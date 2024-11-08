import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_streaming_app/presentation/common/common.dart';

class TopBarSection extends StatelessWidget {
  const TopBarSection({
    super.key,
    this.isBackButton = true,
    this.lastAction,
    this.onBackTap,
    this.rightButtonIconPath,
    this.onTapRightButton,
    this.isBackButtonVisible = true,
  });

  final bool isBackButton;
  final Widget? lastAction;
  final VoidCallback? onBackTap;
  final String? rightButtonIconPath;
  final VoidCallback? onTapRightButton;
  final bool isBackButtonVisible;

  @override
  Widget build(BuildContext context) {
    final topBarSectionTheme = TopBarSectionTheme.of(context);

    return Row(
      mainAxisAlignment:
          isBackButtonVisible ? MainAxisAlignment.spaceBetween : MainAxisAlignment.end,
      children: [
        if (isBackButtonVisible)
          GestureDetector(
            onTap: onBackTap ?? () => context.router.popForced(),
            child: Container(
              height: topBarSectionTheme.iconContainerSize,
              width: topBarSectionTheme.iconContainerSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(topBarSectionTheme.iconContainerBorderRadius),
                border: Border.all(
                  color: topBarSectionTheme.indicatorSectionPrimaryColor,
                ),
              ),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                isBackButton ? Assets.backIcon : Assets.closeIcon,
              ),
            ),
          ),
        if (lastAction != null) ...{lastAction!} else if (rightButtonIconPath != null)
          GestureDetector(
            onTap: onTapRightButton,
            child: Container(
              height: topBarSectionTheme.iconContainerSize,
              width: topBarSectionTheme.iconContainerSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(topBarSectionTheme.iconContainerBorderRadius),
                border: Border.all(
                  color: topBarSectionTheme.indicatorSectionPrimaryColor,
                ),
              ),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                rightButtonIconPath!,
              ),
            ),
          ),
      ],
    );
  }
}
