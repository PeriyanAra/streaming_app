import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_streaming_app/core/core.dart';
import 'package:music_streaming_app/gen/strings.g.dart';
import 'package:music_streaming_app/presentation/common/common.dart';
import 'package:music_streaming_app/presentation/onboarding/cubit/validator_cubit.dart';
import 'package:music_streaming_app/presentation/onboarding/theme/birthday_or_nickname_step_theme.dart';
import 'package:music_streaming_app/presentation/onboarding/theme/theme.dart';
import 'package:music_streaming_app/presentation/onboarding/widgets/steps_indicator.dart';
import 'package:music_streaming_app/presentation/onboarding/widgets/widgets.dart';
import 'package:music_streaming_app/presentation/theme/music_streaming_color_theme.dart';

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
  String errorText = '';
  Completer<void>? completer;

  @override
  Widget build(BuildContext context) {
    final onboardingTheme = OnboardingTheme.of(context);
    final birthdayStepTheme = BirthdayOrNicknameStepTheme.of(context);
    final di = DiGetItImplementation();
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final colors = MusicStreamingColorTheme.of(context);

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

              errorText = '';
            } else if (state is ValidatorinvalidState && context.mounted) {
              errorText = widget.isBirthdayStep ? t.invalidDate : t.invalidNickname;
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
                      title: widget.isBirthdayStep ? t.birthdayStepTitle : t.niknameStepTitle,
                    ),
                    HBox(
                      height: onboardingTheme.titleBottomSpacing,
                    ),
                    if (widget.isBirthdayStep) ...{
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            children: [
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
                                          hasError: errorText.isNotEmpty,
                                          onChanged: (value) {
                                            if (value.length >= 2) {
                                              _dayFocusNode.nextFocus();
                                            }

                                            setState(() {
                                              errorText = '';
                                            });
                                          },
                                          maxLength: 2,
                                        ),
                                      ),
                                      HBox(height: birthdayStepTheme.bottomTextTopSpace),
                                      Text(
                                        t.day,
                                        style: birthdayStepTheme.bottomTextStyle.copyWith(
                                          color: errorText.isNotEmpty ? colors.error : null,
                                        ),
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
                                          hasError: errorText.isNotEmpty,
                                          onChanged: (value) {
                                            if (value.length >= 2) {
                                              _monthFocusNode.nextFocus();
                                            }
                                            setState(() {
                                              errorText = '';
                                            });
                                          },
                                        ),
                                      ),
                                      HBox(height: birthdayStepTheme.bottomTextTopSpace),
                                      Text(
                                        t.month,
                                        style: birthdayStepTheme.bottomTextStyle.copyWith(
                                          color: errorText.isNotEmpty ? colors.error : null,
                                        ),
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
                                          hasError: errorText.isNotEmpty,
                                          maxLength: 4,
                                          onChanged: (value) {
                                            setState(() {
                                              errorText = '';
                                            });
                                          },
                                        ),
                                      ),
                                      HBox(height: birthdayStepTheme.bottomTextTopSpace),
                                      Text(
                                        t.year,
                                        style: birthdayStepTheme.bottomTextStyle.copyWith(
                                          color: errorText.isNotEmpty ? colors.error : null,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              if (errorText.isNotEmpty) ...{
                                HBox(height: birthdayStepTheme.errorMessageTopSpace),
                                Center(
                                  child: Text(
                                    errorText,
                                    style: birthdayStepTheme.bottomTextStyle.copyWith(
                                      color: colors.error,
                                    ),
                                  ),
                                ),
                              },
                            ],
                          ),
                        ],
                      ),
                    } else ...{
                      InputField(
                        keyboardType: TextInputType.text,
                        textEditingController: _nicknameController,
                        focusNode: _nicknameFocusNode,
                        maxLength: 20,
                        textAlign: TextAlign.start,
                        hasError: errorText.isNotEmpty,
                        onChanged: (value) {
                          setState(() {
                            errorText = '';
                          });
                        },
                      ),
                      if (errorText.isNotEmpty) ...{
                        HBox(height: birthdayStepTheme.errorMessageTopSpace),
                        Center(
                          child: Text(
                            errorText,
                            style: birthdayStepTheme.bottomTextStyle.copyWith(
                              color: colors.error,
                            ),
                          ),
                        ),
                      },
                    },
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
