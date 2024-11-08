import 'package:music_streaming_app/core/core.dart';
import 'package:music_streaming_app/data/data.dart';

class SettingsRepository {
  const SettingsRepository({
    required SettingsDataSource settingsLocalDataSource,
  }) : _settingsLocalDataSource = settingsLocalDataSource;

  final SettingsDataSource _settingsLocalDataSource;

  Future<ResultData<bool, FailureResult>> toggleUnlockApp() {
    return _settingsLocalDataSource.toggleUnlockApp();
  }

  Future<ResultData<Map<String, bool>, FailureResult>> fetchSettings() {
    return _settingsLocalDataSource.fetchSettings();
  }
}
