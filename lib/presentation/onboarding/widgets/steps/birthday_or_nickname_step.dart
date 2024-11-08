import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_streaming_app/core/core.dart';
import 'package:music_streaming_app/presentation/common/common.dart';
import 'package:music_streaming_app/presentation/onboarding/cubit/validator_cubit.dart';
import 'package:music_streaming_app/presentation/onboarding/theme/birthday_or_nickname_step_theme.dart';
import 'package:music_streaming_app/presentation/onboarding/theme/theme.dart';
import 'package:music_streaming_app/presentation/onboarding/widgets/steps_indicator.dart';
import 'package:music_streaming_app/presentation/onboarding/widgets/widgets.dart';

class BirthdayOrNicknameStep extends StatefulWidget {
  const BirthdayOrNicknameStep({
    super.key,
    required this.onNextTap,
    required this.isBirthdayStep,
    this.onBackTap,
  });

  final void Function(String) onNextTap;
  final VoidCallback? onBackTap;
  final bool isBirthdayStep;

  @override
  State<BirthdayOrNicknameStep> createState() => _BirthdayOrNicknameStepState();
}

class _BirthdayOrNicknameStepState extends State<BirthdayOrNicknameStep> {
  final TextEditingController _dayController = TextEditingController();
  final TextEditingController _monthController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  final FocusNode _dayFocusNode = FocusNode();
  final FocusNode _monthFocusNode = FocusNode();
  final FocusNode _yearFocusNode = FocusNode();
  final FocusNode _nicknameFocusNode = FocusNode();
  Completer<void>? completer;

  @override
  Widget build(BuildContext context) {
    final onboardingTheme = OnboardingTheme.of(context);
    final birthdayStepTheme = BirthdayOrNicknameStepTheme.of(context);
    final di = DiGetItImplementation();
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return SafeArea(
      child: Padding(
        padding: onboardingTheme.screenPadding,
        child: BlocConsumer<ValidatorCubit, ValidatorState>(
          listener: (context, state) {
            if (state is ValidatorValidState) {
              if (widget.isBirthdayStep) {
                widget.onNextTap.call(
                  DateTime(
                    int.parse(_yearController.text),
                    int.parse(_monthController.text),
                    int.parse(_dayController.text),
                  ).toString(),
                );
              } else {
                widget.onNextTap.call(
                  _nicknameController.text,
                );
              }
            } else if (state is ValidatorinvalidState && context.mounted) {
              DialogHelper.show(
                context,
                title: widget.isBirthdayStep ? 'invalidDate'.tr() : 'invalidNickname'.tr(),
                buttonText: 'ok'.tr(),
              );
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TopBarSection(
                      lastAction: StepsIndicator(
                        step: widget.isBirthdayStep
                            ? OnboardingSteps.birthday
                            : OnboardingSteps.nickname,
                      ),
                      onBackTap: widget.onBackTap,
                      isBackButton: !widget.isBirthdayStep,
                    ),
                    HBox(height: onboardingTheme.titleTopSpacing),
                    StepTitleSection(
                      title: widget.isBirthdayStep
                          ? 'birthdayStepTitle'.tr()
                          : 'niknameStepTitle'.tr(),
                    ),
                    HBox(
                      height: onboardingTheme.titleBottomSpacing,
                    ),
                    if (widget.isBirthdayStep) ...{
                      Row(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                width: birthdayStepTheme.dayMonthFieldWidth,
                                child: InputField(
                                  keyboardType: TextInputType.number,
                                  textEditingController: _dayController,
                                  focusNode: _dayFocusNode,
                                  onChanged: (value) {
                                    if (value.length >= 2) {
                                      _dayFocusNode.nextFocus();
                                    }
                                  },
                                  maxLength: 2,
                                ),
                              ),
                              HBox(height: birthdayStepTheme.bottomTextTopSpace),
                              Text(
                                'day'.tr(),
                                style: birthdayStepTheme.bottomTextStyle,
                              ),
                            ],
                          ),
                          WBox(width: birthdayStepTheme.fieldSpace),
                          Column(
                            children: [
                              SizedBox(
                                width: birthdayStepTheme.dayMonthFieldWidth,
                                child: InputField(
                                  keyboardType: TextInputType.number,
                                  textEditingController: _monthController,
                                  focusNode: _monthFocusNode,
                                  maxLength: 2,
                                  onChanged: (value) {
                                    if (value.length >= 2) {
                                      _monthFocusNode.nextFocus();
                                    }
                                  },
                                ),
                              ),
                              HBox(height: birthdayStepTheme.bottomTextTopSpace),
                              Text(
                                'month'.tr(),
                                style: birthdayStepTheme.bottomTextStyle,
                              ),
                            ],
                          ),
                          WBox(width: birthdayStepTheme.fieldSpace),
                          Column(
                            children: [
                              SizedBox(
                                width: birthdayStepTheme.yearFieldWidth,
                                child: InputField(
                                  keyboardType: TextInputType.number,
                                  textEditingController: _yearController,
                                  focusNode: _yearFocusNode,
                                  maxLength: 4,
                                ),
                              ),
                              HBox(height: birthdayStepTheme.bottomTextTopSpace),
                              Text(
                                'year'.tr(),
                                style: birthdayStepTheme.bottomTextStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    } else
                      InputField(
                        keyboardType: TextInputType.text,
                        textEditingController: _nicknameController,
                        focusNode: _nicknameFocusNode,
                        maxLength: 20,
                        textAlign: TextAlign.start,
                      ),
                  ],
                ),
                Positioned(
                  bottom: keyboardHeight + onboardingTheme.nextButtonPositionFromBottom,
                  right: onboardingTheme.nextButtonPositionFromRight,
                  child: NextButton(
                    onTap: () {
                      di<ValidatorCubit>().checkValidation(
                        dayStr: _dayController.text,
                        monthStr: _monthController.text,
                        yearStr: _yearController.text,
                        isNicknameValidation: !widget.isBirthdayStep,
                        nickName: _nicknameController.text,
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
