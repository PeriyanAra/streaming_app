import 'package:music_streaming_app/core/di/di.dart';
import 'package:music_streaming_app/data/data.dart';
import 'package:music_streaming_app/data/database/database_creator.dart';
import 'package:music_streaming_app/data/user/data_sources/user_local_data_source.dart';
import 'package:sqflite/sqflite.dart';

class DataDependencies implements Dependencies {
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
      )
      ..registerLazySingleton<SettingsDataSource>(
        () => SettingsLocalDataSource(
          deviceAppKeyValueStorage: di(),
        ),
      )
      ..registerLazySingleton(
        () => SettingsRepository(
          settingsLocalDataSource: di(),
        ),
      );
  }
}
