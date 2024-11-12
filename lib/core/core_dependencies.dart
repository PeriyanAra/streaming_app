import 'package:music_streaming_app/core/core.dart';

final class CoreDependencies implements Dependencies {
  @override
  Future<void> register(DependencyInjection di) async {
    di
      ..registerLazySingleton<CustomJsonDecoder>(() => CustomJsonDecoder([]))
      ..registerLazySingleton<JsonStringConverter>(
        () => JsonStringConverter(jsonDecoder: di()),
      )
      ..registerLazySingleton(AdService.new);
  }
}
