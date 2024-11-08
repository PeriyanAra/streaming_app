import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_streaming_app/presentation/common/common.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final nextButtonTheme = NextButtonTheme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: nextButtonTheme.buttonSize,
        width: nextButtonTheme.buttonSize,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(nextButtonTheme.buttonBorderRadius),
          color: nextButtonTheme.buttonColor,
        ),
        alignment: Alignment.center,
        child: SvgPicture.asset(
          Assets.nextIcon,
        ),
      ),
    );
  }
}
