import 'dart:async';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdService {
  final adUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/9214589741'
      : 'ca-app-pub-3940256099942544/2435281174';

  BannerAd? bannerAd;

  Future<BannerAd?> loadAd(BuildContext context) async {
    try {
      final size = await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
        MediaQuery.sizeOf(context).width.truncate(),
      );

      final width = context.mounted ? MediaQuery.of(context).size.width.toInt() : 300;

      if (bannerAd == null) {
        bannerAd = BannerAd(
          adUnitId: adUnitId,
          request: const AdRequest(),
          size: size ??
              AdSize(
                width: width,
                height: 60,
              ),
          listener: BannerAdListener(
            // Called when an ad is successfully received.
            onAdLoaded: (ad) {
              debugPrint('$ad loaded.');
            },
            // Called when an ad request failed.
            onAdFailedToLoad: (ad, err) {
              debugPrint('BannerAd failed to load: $err');
              // Dispose the ad here to free resources.
              ad.dispose();
            },
          ),
        );

        unawaited(bannerAd?.load());
      }

      if (bannerAd != null) return bannerAd!;

      return null;
    } catch (e) {
      return null;
    }
  }
}
