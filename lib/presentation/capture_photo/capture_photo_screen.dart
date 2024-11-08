import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_streaming_app/core/core.dart';
import 'package:music_streaming_app/presentation/capture_photo/capture_photo_bloc/capture_photo_bloc.dart';
import 'package:music_streaming_app/presentation/capture_photo/capture_photo_screen_content.dart';


@RoutePage()
class CapturePhotoScreen extends StatelessWidget {
  const CapturePhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: DiGetItImplementation()<CapturePhotoBloc>()..add(const CapturePhotoEvent.initialize(),),
      child: const CapturePhotoScreenContent(),
    );
  }
}
