import 'package:flutter/material.dart';
import 'package:music_streaming_app/core/core.dart';
import 'package:music_streaming_app/presentation/common/common.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  final void Function(GenderType) onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    final secondaryButtonTheme = SecondaryButtonTheme.of(context);

    return GestureDetector(
      onTap: () => onTap(GenderType.fromString(text.toLowerCase())),
      child: Container(
        height: secondaryButtonTheme.buttonHeight,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: secondaryButtonTheme.borderColor),
          borderRadius: BorderRadius.circular(secondaryButtonTheme.borderRadius),
          color: secondaryButtonTheme.buttonColor,
        ),
        child: Center(
          child: Text(
            text,
            style: secondaryButtonTheme.contentTextStyle,
          ),
        ),
      ),
    );
  }
}
