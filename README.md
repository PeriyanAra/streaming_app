# music_streaming_app

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

To run project you have to install flutter first. How to install flutter you can read here.
[Flutter Installation Guide](https://flutter.dev/docs/get-started/install)


### Install fvm

FVM helps with the need for consistent app builds by referencing the Flutter SDK version used on a per-project basis. It also allows you to have multiple Flutter versions installed to quickly validate and test upcoming Flutter releases with your apps without waiting for Flutter installation every time.

```bash
dart pub global activate fvm
```

Install flutter version, which is defined for project.

```bash
fvm install
```

### Android configuration

If you use Android Studio, you can define flutter sdk with following steps.

[Configure Android Studio](https://fvm.app/docs/getting_started/configuration#android-studio)


### Usage 

To use fvm with flutter you need to add `fvm` before flutter command. Here are some examples.

```bash
fvm install
fvm flutter test
fvm flutter pub get
fvm flutter analyze
fvm  flutter run --flavor dev
fvm  flutter run --flavor prod
```

### 1. Generate all data containing files with Freezed(view models, DTOs)
Using this command:
```bash
fvm flutter pub get
fvm flutter pub run build_runner build --delete-conflicting-outputs
```


For example:
## 1. View Models

```dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_streaming_app/core/core.dart';
import 'package:music_streaming_app/data/data.dart';

part 'user_view_model.freezed.dart';

@freezed
class UserViewModel with _$UserViewModel {
  const factory UserViewModel({
    required String name,
    required GenderType gender,
    required DateTime birthday,
    required List<String> photos,
  }) = _UserViewModel;

  const UserViewModel._();

  factory UserViewModel.fromDto(UserDto dto) {
    return UserViewModel(
      name: dto.name,
      gender: dto.gender,
      birthday: dto.birthday,
      photos: dto.photos,
    );
  }
}
```



## 2. DTO
```dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_streaming_app/core/core.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDto with _$UserDto {
  const factory UserDto({
    required String name,
    required DateTime birthday,
    required GenderType gender,
    required List<String> photos,
  }) = _UserDto;

  const UserDto._();

  factory UserDto.fromJson(Map<String, Object?> json) => _$UserDtoFromJson(json);
}


```
### 2. Create corresponding folders in the modules ( Presentation, Data) with a name that describes your feature:
For example user:
```
 Presentation: user
 Data: user
```

The first step is `Data` layer implementation.
Implement `DTO` objects (other words response models):
```dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_streaming_app/core/core.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDto with _$UserDto {
  const factory UserDto({
    required String name,
    required DateTime birthday,
    required GenderType gender,
    required List<String> photos,
  }) = _UserDto;

  const UserDto._();

  factory UserDto.fromJson(Map<String, Object?> json) => _$UserDtoFromJson(json);
}
```

Then if you need use local db write new initialScript if app already going production  write migrationsScript into tables folder(lib/data/database/tables) and save tables and columns names into `DatabaseConstants` :

```dart
String createUserTable() {
  return '''
    CREATE TABLE ${DatabaseConstants.userTable}
      (
          ${DatabaseConstants.name} TEXT NOT NULL,
          ${DatabaseConstants.birthday} TEXT NOT NULL,
          ${DatabaseConstants.gender} TEXT NOT NULL,
          ${DatabaseConstants.photos} TEXT NOT NULL
      )
    ''';
}
```

Don't forgot register initialScript(lib/data/database/initial_scripts.dart) or migrationsScript(lib/data/database/migrations_scripts.dart) :

```dart
List<String> initialScripts() {
  return [
    createUserTable(),
  ];
}
```



Implement `DataSources`, it will be used in repository.

```dart
abstract interface class UserDataSource {
  Future<ResultData<UserDto, FailureResult>> fetchUser();
}

```
With every method use `ResultData` as return value, it takes two entities (success and failure).
It is like a wrapper, can contains 1 or multiple repositories. In case of multiple we can combine responses, and as result `Presentation` layer will get only one entity.

```dart
final class UserLocalDataSource with SafeExecutionMixin implements UserDataSource {
  const UserLocalDataSource({
    required Database database,
  }) : _database = database;

  final Database _database;

  @override
  Future<ResultData<UserDto, FailureResult>> fetchUser() {
    return executeSafely<ResultData<UserDto, FailureResult>>(
      () async {
        final items = await _database.rawQuery(
          'SELECT * FROM ${DatabaseConstants.userTable}',
        );

        if (items.isEmpty) {
          return const ResultData.failure(
            FailureResult(
              reason: FailureReasons.unknown,
              debugMessage: 'not have data in local DB',
            ),
          );
        }

        final userJsonMap = {...items.first};

        userJsonMap[DatabaseConstants.photos] = jsonDecode(
          userJsonMap[DatabaseConstants.photos].toString(),
        );

        final userDto = UserDto.fromJson(userJsonMap);

        final photos = [...userDto.photos];

        final dir = await getApplicationDocumentsDirectory();

        for (var i = 0; i < photos.length; i++) {
          photos[i] = '$dir/${photos[i]}';
        }

        return ResultData.success(
          userDto.copyWith(photos: photos),
        );
      },
      onError: ResultData.failure,
    );
  }
}
```

Add repository:
```dart
class UserRepository {
  const UserRepository({
    required UserDataSource userLocalDataSource,
  }) : _userLocalDataSource = userLocalDataSource;

  final UserDataSource _userLocalDataSource;

  Future<ResultData<UserDto, FailureResult>> fetchUser() {
    return _userLocalDataSource.fetchUser();
  }
}
```
Don't forget to register your Services, Data sources and Repository implementations in `DataDependencies` as `LazySingleton`

```dart
final class DataDependencies implements Dependencies {
  @override
  Future<void> register(DependencyInjection di) async {
    di
      ..registerSingleton<Database>(
        await DatabaseCreator.initDatabase(),
      )
      ..registerLazySingleton<UserDataSource>(
        () => UserLocalDataSource(
          database: di(),
        ),
      )
      ..registerLazySingleton(
        () => UserRepository(
          userLocalDataSource: di(),
        ),
      );     
  }
}
```

When all described above steps are done, we can start with the `Presentation` layer.
Add Bloc implementation and execute `UserRepository` from the `Data` layer:
```dart
class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({
    required UserRepository repository,
  })  : _repository = repository,
        super(const UserState.loading()) {
    on<_FetchDataEvent>(_handleFetchDataEvent);
  }

  final UserRepository _repository;

  Future<void> _handleFetchDataEvent(
    _FetchDataEvent event,
    Emitter<UserState> emit,
  ) async {
    final response = await _repository.fetchUser();

    response.when(
      success: (data) => emit(
        UserState.loaded(
          user: UserViewModel.fromDto(data),
        ),
      ),
      failure: (_) => emit(
        const UserState.loaded(user: null),
      ),
    );
  }
}

```

### 3. Register and provide blocs
When you created the bloc, it needs to registration in `PresentationDependencies` as `LazySingleton`:

```dart 
final class PresentationDependencies implements Dependencies {
  @override
  Future<void> register(DependencyInjection di) async {
    di.registerLazySingleton<UserBloc>(
        () => UserBloc(
          repository: di(),
        ),
      );
  }
}
```
To provide the bloc, use `BlocProvider.value(...)`:
```dart
    BlocProvider.value(
        value: DiGetItImplementation()<UserBloc>(),
        child: ...,
    );
```

### 4. Register layer dependencies
If you created new layer(for example `core`) and and register layer dependencies into `CoreDependencies` don't forgot add `CoreDependencies` into `registerAppDependencies`(lib/core/di/register_app_dependencies.dart):

```dart
Future<void> registerAppDependencies(
  DependencyInjection di,
) async {
  final dependenciesList = <Dependencies>[
    DataDependencies(),
    PresentationDependencies(),
    CoreDependencies(),
  ];

  for (final dependencies in dependenciesList) {
    await dependencies.register(di);
  }
}

```

### 5. Routing and navigation
For navigation we use `AutoRouter`.

First of all register your screen in [app_router.dart] file:
```dart
@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: 'user',
          initial: true,
          page: UserRoute.page,
        ),
      ];
}
```
After registration don't forget to run builder:

```bash
fvm flutter packages pub run build_runner build
```
For navigation to some route use:
```dart
AutoRouter.of(context).push(UserRoute());
```
or:
```dart
context.router.push(UserRoute());
```

### 6. Translations
Use this command to generate translations:
```bash 
dart run slang
```

## Built With
* [flutter](https://flutter.dev) - Design beautiful apps


## Contributing
Please read [Dart Code Style](https://dart.dev/guides/language/effective-dart/style) for details on our code of conduct, and the process for submitting pull requests to us.


## Authors
* **Ara Periyan** - *Flutter Freelancer* 

