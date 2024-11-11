
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_streaming_app/gen/strings.g.dart';
import 'package:music_streaming_app/presentation/common/common.dart';
import 'package:music_streaming_app/presentation/onboarding/theme/theme.dart';
import 'package:music_streaming_app/presentation/onboarding/widgets/steps_indicator.dart';
import 'package:music_streaming_app/presentation/onboarding/widgets/widgets.dart';

class FirstPhotoStep extends StatelessWidget {
  const FirstPhotoStep({
    required this.onFinish,
    required this.onBackTap,
    super.key,
  });

  final VoidCallback onBackTap;

  final VoidCallback onFinish;

  @override
  Widget build(BuildContext context) {
    final onboardingTheme = OnboardingTheme.of(context);

    return SafeArea(
      child: Padding(
        padding: onboardingTheme.screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopBarSection(
              lastAction: const StepsIndicator(
                step: OnboardingSteps.firstPhoto,
              ),
              onBackTap: onBackTap,
            ),
            HBox(height: onboardingTheme.titleTopSpacing),
            StepTitleSection(
              title: t.firstPhotoStepTitle,
            ),
            HBox(height: onboardingTheme.titleBottomSpacing),
            PrimaryButton(
              onTap: onFinish,
              text: t.firstPhoto,
            ),
            HBox(height: onboardingTheme.firstPhotoButtonBottomSpacing),
            Container(
              padding: onboardingTheme.guidelineContainerPadding,
              alignment: Alignment.center,
              decoration: onboardingTheme.guidelineContainerDecoration,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.imageGuidelinesTitle,
                    style: onboardingTheme.imageGuidelineTitleTextStyle,
                  ),
                  HBox(height: onboardingTheme.guidelineTextSpace),
                  _buildChecklistItem(
                    t.imageGuidelinesFirstText,
                    context,
                  ),
                  HBox(height: onboardingTheme.guidelineTextSpace),
                  _buildChecklistItem(
                    t.imageGuidelinesSecondText,
                    context,
                  ),
                  HBox(height: onboardingTheme.guidelineTextSpace),
                  _buildChecklistItem(
                    t.imageGuidelinesThirdText,
                    context,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChecklistItem(String text, BuildContext context) {
    final onboardingTheme = OnboardingTheme.of(context);

    return Row(
      children: [
        SvgPicture.asset(
          Assets.checkIcon,
          height: onboardingTheme.imageGuidelinesCheckHeight,
          width: onboardingTheme.imageGuidelinesCheckWidth,
        ),
        WBox(width: onboardingTheme.guidelineContainerCheckSpace),
        Expanded(
          child: Text(
            text,
            style: onboardingTheme.imageGuidelineTextTextStyle,
          ),
        ),
      ],
    );
  }
}
