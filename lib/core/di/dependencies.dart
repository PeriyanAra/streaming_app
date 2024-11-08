import 'package:music_streaming_app/core/di/dependency_injection.dart';

abstract class Dependencies {
  Future<void> register(DependencyInjection di);
}