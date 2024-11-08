import 'package:flutter/material.dart';
import 'package:music_streaming_app/presentation/common/theme/theme.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    final primaryButtonTheme = PrimaryButtonTheme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: primaryButtonTheme.buttonHeight,
        decoration: primaryButtonTheme.buttonDecoration,
        child: Center(
          child: Text(
            text,
            style: primaryButtonTheme.buttonTextStyle,
          ),
        ),
      ),
    );
  }
}
