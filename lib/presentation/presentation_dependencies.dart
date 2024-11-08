import 'package:music_streaming_app/core/di/di.dart';
import 'package:music_streaming_app/presentation/capture_photo/capture_photo_bloc/capture_photo_bloc.dart';
import 'package:music_streaming_app/presentation/common/blocs/user_bloc/user_bloc.dart';
import 'package:music_streaming_app/presentation/onboarding/cubit/validator_cubit.dart';
import 'package:music_streaming_app/presentation/setting/settings_bloc/settings_bloc.dart';

final class PresentationDependencies extends Dependencies {
  @override
  Future<void> register(DependencyInjection di) async {
    di
      ..registerFactory<CapturePhotoBloc>(
        () => CapturePhotoBloc(
          cameraService: di(),
          userRepository: di(),
        ),
      )
      ..registerLazySingleton<SettingsBloc>(
        () => SettingsBloc(
          settingsRepository: di(),
        ),
      )
      ..registerLazySingleton<UserBloc>(
        () => UserBloc(
          repository: di(),
        ),
      )
      ..registerSingleton<ValidatorCubit>(
        ValidatorCubit(),
      );
  }
}
