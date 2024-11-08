import 'package:music_streaming_app/core/core.dart';
import 'package:music_streaming_app/data/data.dart';
import 'package:music_streaming_app/devices_implementation/device_implementation.dart';
import 'package:music_streaming_app/presentation/presentation_dependencies.dart';

Future<void> registerAppDependencies(
  DependencyInjection di,
) async {
  final dependenciesList = <Dependencies>[
    CoreDependencies(),
    DeviceDependencies(),
    DataDependencies(),
    PresentationDependencies(),
  ];

  for (final dependencies in dependenciesList) {
    await dependencies.register(di);
  }
}
