import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_streaming_app/core/core.dart';
import 'package:music_streaming_app/presentation/common/blocs/user_bloc/user_bloc.dart';
import 'package:music_streaming_app/presentation/common/constants/assets.dart';
import 'package:music_streaming_app/presentation/onboarding/cubit/validator_cubit.dart';
import 'package:music_streaming_app/presentation/onboarding/widgets/steps/first_photo_step.dart';
import 'package:music_streaming_app/presentation/onboarding/widgets/steps/gender_step.dart';
import 'package:music_streaming_app/presentation/onboarding/widgets/widgets.dart';
import 'package:music_streaming_app/presentation/router/app_router.gr.dart';

@RoutePage()
class OnboardingStepScreen extends StatefulWidget {
  const OnboardingStepScreen({super.key});

  @override
  State<OnboardingStepScreen> createState() => _OnboardingStepScreenState();
}

class _OnboardingStepScreenState extends State<OnboardingStepScreen> {
  final PageController _pageController = PageController();
  late List<Widget> steps;
  DateTime birthday = DateTime.now();
  String nickname = '';
  GenderType gender = GenderType.male;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final di = DiGetItImplementation();

    steps = [
      BirthdayOrNicknameStep(
        onNextTap: (val) {
          birthday = DateTime.parse(val);

          _onNextButtonTap();
        },
        isBirthdayStep: true,
      ),
      BirthdayOrNicknameStep(
        onNextTap: (val) {
          nickname = val;

          _onNextButtonTap();
        },
        onBackTap: _onBackTap,
        isBirthdayStep: false,
      ),
      GenderStep(
        onBackTap: _onBackTap,
        onNextTap: (val) {
          gender = val;

          _onNextButtonTap();
        },
      ),
      FirstPhotoStep(
        onBackTap: _onBackTap,
        onFinish: () {
          context.read<UserBloc>().add(
                UserEvent.saveUser(
                  name: nickname,
                  birthday: birthday,
                  gender: gender,
                ),
              );

          context.router.replaceAll([const AuthenticatedRoute()]);
        },
      ),
    ];

    return PopScope(
      canPop: false,
      child: BlocProvider.value(
        value: di<ValidatorCubit>(),
        child: Scaffold(
          body: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: steps.length,
            controller: _pageController,
            itemBuilder: (context, index) {
              return ImagePagePart(
                imagePath: Assets.generalImage,
                index: index,
                totalParts: steps.length,
                stepWidget: steps[index],
              );
            },
          ),
          resizeToAvoidBottomInset: false,
        ),
      ),
    );
  }

  void _onNextButtonTap() {
    if (_pageController.hasClients) {
      final nextPage = _pageController.page!.toInt() + 1;
      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onBackTap() {
    if (_pageController.hasClients) {
      final nextPage = _pageController.page!.toInt() - 1;
      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }
}

class ImagePagePart extends StatelessWidget {
  const ImagePagePart({
    super.key,
    required this.imagePath,
    required this.index,
    required this.totalParts,
    required this.stepWidget,
  });

  final String imagePath;
  final int index;
  final int totalParts;
  final Widget stepWidget;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;
        final imageWidth = totalParts * screenWidth;
        final partWidth = imageWidth / totalParts;
        final leftOffset = -partWidth * index;

        return ClipRect(
          child: SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: Stack(
              children: [
                Positioned(
                  left: leftOffset,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    height: constraints.maxHeight,
                    width: imageWidth,
                  ),
                ),
                stepWidget,
              ],
            ),
          ),
        );
      },
    );
  }
}
