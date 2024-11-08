import 'package:flutter/material.dart';
import 'package:music_streaming_app/presentation/capture_photo/theme/theme.dart';

class CapturePhotoButton extends StatelessWidget {
  const CapturePhotoButton({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final capturePhotoButtonTheme = CapturePhotoButtonTheme.of(context);

    return GestureDetector(
           onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Opacity(
            opacity: capturePhotoButtonTheme.opacity,
            child: Center(
              child: GestureDetector(
           
                child: Container(
                  alignment: Alignment.center,
                  height: capturePhotoButtonTheme.height,
                  width: capturePhotoButtonTheme.height,
                  decoration: BoxDecoration(
                    color: capturePhotoButtonTheme.color,
                    borderRadius: capturePhotoButtonTheme.buttonBorderBorderRadius,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: capturePhotoButtonTheme.insideButtonSize,
            width: capturePhotoButtonTheme.insideButtonSize,
            decoration: BoxDecoration(
              color: capturePhotoButtonTheme.color,
              borderRadius: capturePhotoButtonTheme.insideButtonBorderRadius,
              boxShadow: [
                BoxShadow(
                  color: capturePhotoButtonTheme.shadowColor,
                  spreadRadius: capturePhotoButtonTheme.spreadRadius,
                  blurRadius: capturePhotoButtonTheme.blurRadius,
                  offset: capturePhotoButtonTheme.offset,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
