import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_streaming_app/gen/strings.g.dart';
import 'package:music_streaming_app/presentation/capture_photo/capture_photo_bloc/capture_photo_bloc.dart';
import 'package:music_streaming_app/presentation/capture_photo/theme/theme.dart';
import 'package:music_streaming_app/presentation/capture_photo/widgets/widgets.dart';
import 'package:music_streaming_app/presentation/common/common.dart';
import 'package:music_streaming_app/presentation/router/app_router.gr.dart';

class CapturePhotoScreenContent extends StatefulWidget {
  const CapturePhotoScreenContent({super.key});

  @override
  State<CapturePhotoScreenContent> createState() => _CapturePhotoScreenContentState();
}

class _CapturePhotoScreenContentState extends State<CapturePhotoScreenContent>
    with WidgetsBindingObserver {
  late final CapturePhotoBloc _capturePhotoBloc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _capturePhotoBloc = context.read<CapturePhotoBloc>();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState appLifecycleState) {
    final capturePhotoState = context.read<CapturePhotoBloc>().state;

    if (appLifecycleState == AppLifecycleState.paused) {
      _capturePhotoBloc.add(const CapturePhotoEvent.dispose());
    } else if (appLifecycleState == AppLifecycleState.resumed &&
        capturePhotoState is CapturePhotoInitialState) {
      _capturePhotoBloc.add(const CapturePhotoEvent.initialize());
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _capturePhotoBloc.add(const CapturePhotoEvent.dispose());

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = CapturePhotoScreenTheme.of(context);

    return Scaffold(
      body: BlocConsumer<CapturePhotoBloc, CapturePhotoState>(
        listenWhen: (previous, current) =>
            current is CapturePhotoErrorState && current.cameraController != null,
        listener: (context, state) => DialogHelper.show(
          context,
          buttonText: t.ok,
          title: (state as CapturePhotoErrorState).errorMessage,
        ),
        buildWhen: (previous, current) => current is! CapturePhotoInitialState,
        builder: (context, state) {
          if (state is CapturePhotoErrorState && state.cameraController == null) {
            return Container(
              alignment: Alignment.center,
              padding: theme.contentSpacing,
              child: Text(
                state.errorMessage,
                style: theme.errorTextStyle,
                textAlign: TextAlign.center,
              ),
            );
          }

          if ((state is CapturePhotoLoadingState && state.cameraController == null) ||
              state is CapturePhotoInitialState) {
            return const LoadingWidget();
          }

          return SafeArea(
            child: SizedBox(
              height: double.infinity,
              child: CameraPreview(
                state.cameraController!,
                child: Padding(
                  padding: theme.contentPadding,
                  child: Column(
                    children: [
                      TopBarSection(
                        rightButtonIconPath: Assets.cameraWrap,
                        onTapRightButton: () => context.read<CapturePhotoBloc>().add(
                              const CapturePhotoEvent.changeCamera(),
                            ),
                        isBackButtonVisible: false,
                      ),
                      const Spacer(),
                      if (state is! CapturePhotoLoadingState) ...[
                        CapturePhotoButton(
                          onTap: () => context.read<CapturePhotoBloc>().add(
                                CapturePhotoEvent.captureImage(
                                  onSuccess: (photo) => context.router.push(
                                    ViewPhotosRoute(
                                      imagePath: photo,
                                    ),
                                  ),
                                ),
                              ),
                        ),
                      ] else ...[
                        const LoadingWidget(),
                        const Spacer(),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
