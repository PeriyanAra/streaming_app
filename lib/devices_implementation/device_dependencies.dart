import 'package:music_streaming_app/core/core.dart';
import 'package:music_streaming_app/devices_implementation/camera_service_impl.dart';
import 'package:music_streaming_app/devices_implementation/device_implementation.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class DeviceDependencies extends Dependencies {
  @override
  Future<void> register(DependencyInjection di) async {
    final appKeyValueStorage = DeviceAppKeyValueStorage(
      sharedPreferences: await SharedPreferences.getInstance(),
      jsonStringConverter: di(),
    );

    di
      ..registerSingleton<AppKeyValueStorage>(appKeyValueStorage)
      ..registerLazySingleton<CameraService>(
        CameraServiceImpl.new,
      );
  }
}
