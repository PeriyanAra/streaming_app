import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:music_streaming_app/core/core.dart';
import 'package:music_streaming_app/presentation/common/common.dart';
import 'package:music_streaming_app/presentation/onboarding/theme/theme.dart';
import 'package:music_streaming_app/presentation/onboarding/widgets/steps_indicator.dart';
import 'package:music_streaming_app/presentation/onboarding/widgets/widgets.dart';

class GenderStep extends StatelessWidget {
  const GenderStep({
    super.key,
    required this.onBackTap,
    required this.onNextTap,
  });

  final VoidCallback onBackTap;
  final void Function(GenderType) onNextTap;

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
                step: OnboardingSteps.gender,
              ),
              onBackTap: onBackTap,
            ),
            HBox(height: onboardingTheme.titleTopSpacing),
            StepTitleSection(
              title: 'genderStepTitle'.tr(),
              subTitle: 'genderStepSubTitle'.tr(),
            ),
            ...List.generate(GenderType.values.length, (index) {
              return Column(
                children: [
                  SecondaryButton(
                    onTap: onNextTap,
                    text: GenderType.values[index].name.tr(),
                  ),
                  HBox(height: onboardingTheme.secondaryButtonsSpace),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
