import 'package:flutter/material.dart';
import 'package:music_streaming_app/presentation/common/common.dart';

class AdBanner extends StatelessWidget {
  const AdBanner({
    super.key,
    required this.onCloseAdTap,
    required this.ad,
    required this.height,
  });

  final VoidCallback onCloseAdTap;
  final Widget ad;
  final double height;

  @override
  Widget build(BuildContext context) {
    final adBannerTheme = AdBannerTheme.of(context);
    final bannerHeight = height + adBannerTheme.dividerHeight;
    final offset = Offset((MediaQuery.of(context).size.width / 2) - 36, -(bannerHeight / 2 + 12));

    return BottomSheet(
      shape: const RoundedRectangleBorder(),
      onClosing: () {},
      enableDrag: false,
      builder: (context) {
        return SizedBox(
          height: bannerHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              LinearProgressIndicator(
                minHeight: adBannerTheme.dividerHeight,
                value: 1.0,
                valueColor: AlwaysStoppedAnimation(adBannerTheme.progressColor),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Transform.translate(
                    offset: offset,
                    child: GestureDetector(
                      onTap: onCloseAdTap,
                      child: Image.asset(Assets.closeAdImage),
                    ),
                  ),
                  ad,
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
