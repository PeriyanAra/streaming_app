import 'package:flutter/material.dart';
import 'package:music_streaming_app/presentation/common/common.dart';
import 'package:music_streaming_app/presentation/onboarding/theme/theme.dart';

class StepTitleSection extends StatelessWidget {
  const StepTitleSection({
    required this.title,
    this.subTitle,
    super.key,
  });

  final String title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    final onboardingTheme = OnboardingTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: onboardingTheme.titleTextStyle,
        ),
        if (subTitle != null) ...{
          HBox(
            height: onboardingTheme.subTitleTopSpacing,
          ),
          Text(
            subTitle!,
            style: onboardingTheme.subTitleTextStyle,
          ),
          HBox(
            height: onboardingTheme.subTitleBottomSpacing,
          ),
        },
      ],
    );
  }
}
