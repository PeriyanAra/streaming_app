enum OnboardingSteps {
  birthday(percent: 25),
  nickname(percent: 50),
  gender(percent: 75),
  firstPhoto(percent: 100);

  const OnboardingSteps({required this.percent});

  final int percent;
}
