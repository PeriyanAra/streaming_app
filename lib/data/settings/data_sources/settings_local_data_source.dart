import 'package:music_streaming_app/core/core.dart';

import 'package:music_streaming_app/data/data.dart';

final class SettingsLocalDataSource with SafeExecutionMixin implements SettingsDataSource {
  const SettingsLocalDataSource({
    required AppKeyValueStorage deviceAppKeyValueStorage,
  }) : _deviceAppKeyValueStorage = deviceAppKeyValueStorage;

  final AppKeyValueStorage _deviceAppKeyValueStorage;

  @override
  Future<ResultData<Map<String, bool>, FailureResult>> fetchSettings() async {
    return executeSafely<ResultData<Map<String, bool>, FailureResult>>(
      () async {
        final settingsJsonMap = await _deviceAppKeyValueStorage.read<Map<String, dynamic>>(
          'settings',
        );

        if (settingsJsonMap == null) return const ResultData.success(<String, bool>{});

        final settingsMap = settingsJsonMap.map(
          (key, value) => MapEntry(key, bool.tryParse(value.toString()) ?? false),
        );

        return ResultData.success(settingsMap);
      },
      onError: ResultData.failure,
    );
  }

  @override
  Future<ResultData<bool, FailureResult>> toggleUnlockApp() {
    return executeSafely<ResultData<bool, FailureResult>>(
      () async {
        final settingsResponse = await fetchSettings();

        if (settingsResponse.isFailure || settingsResponse.data.isEmpty) {
          await _deviceAppKeyValueStorage.write(
            'settings',
            {
              'unlock_app': true,
            },
          );

          return const ResultData.success(true);
        }
        final settingsMap = {...settingsResponse.data};

        settingsMap['unlock_app'] = !(settingsMap['unlock_app'] ?? false);

        await _deviceAppKeyValueStorage.write(
          'settings',
          settingsMap,
        );

        return ResultData.success(settingsMap['unlock_app']!);
      },
      onError: ResultData.failure,
    );
  }
}
