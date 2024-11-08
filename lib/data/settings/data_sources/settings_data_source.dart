import 'package:music_streaming_app/core/result/failure_result.dart';
import 'package:music_streaming_app/core/result/result_data.dart';

abstract class SettingsDataSource {
  Future<ResultData<bool, FailureResult>> toggleUnlockApp();

  Future<ResultData<Map<String, bool>, FailureResult>> fetchSettings();
}
