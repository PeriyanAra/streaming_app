import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
              title: 'firstPhotoStepTitle'.tr(),
            ),
            HBox(height: onboardingTheme.titleBottomSpacing),
            PrimaryButton(
              onTap: onFinish,
              text: 'firstPhoto'.tr(),
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
                    'imageGuidelinesTitle'.tr(),
                    style: onboardingTheme.imageGuidelineTitleTextStyle,
                  ),
                  HBox(height: onboardingTheme.guidelineTextSpace),
                  _buildChecklistItem(
                    'imageGuidelinesFirstText'.tr(),
                    context,
                  ),
                  HBox(height: onboardingTheme.guidelineTextSpace),
                  _buildChecklistItem(
                    'imageGuidelinesSecondText'.tr(),
                    context,
                  ),
                  HBox(height: onboardingTheme.guidelineTextSpace),
                  _buildChecklistItem(
                    'imageGuidelinesThirdText'.tr(),
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
