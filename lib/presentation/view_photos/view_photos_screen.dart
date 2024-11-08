import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:music_streaming_app/core/core.dart';
import 'package:music_streaming_app/presentation/capture_photo/theme/theme.dart';
import 'package:music_streaming_app/presentation/common/common.dart';
import 'package:music_streaming_app/presentation/router/app_router.gr.dart';
import 'package:music_streaming_app/presentation/setting/settings_bloc/settings_bloc.dart';

@RoutePage()
class ViewPhotosScreen extends StatefulWidget {
  const ViewPhotosScreen({
    super.key,
    required this.imagePath,
  });

  final String imagePath;

  @override
  State<ViewPhotosScreen> createState() => _ViewPhotosScreenState();
}

class _ViewPhotosScreenState extends State<ViewPhotosScreen> {
  BannerAd? add;

  @override
  void initState() {
    super.initState();
    if (add == null) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          DiGetItImplementation()<AdService>().loadAd(context).then(
                (e) => setState(
                  () {
                    add ??= e;
                  },
                ),
              );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: false,
        child: Container(
          height: double.infinity,
          padding: CapturePhotoScreenTheme.of(context).viewPhotosContentPadding,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Image.file(
                File(widget.imagePath),
              ).image,
              fit: BoxFit.cover,
            ),
          ),
          alignment: Alignment.topCenter,
          child: TopBarSection(
            rightButtonIconPath: Assets.settingIcon,
            onTapRightButton: () {
              context.router.push(const SettingsRoute());
            },
          ),
        ),
      ),
      bottomSheet: add == null
          ? const LoadingWidget()
          : BlocBuilder<SettingsBloc, SettingsState>(
              builder: (context, state) {
                if (state is SettingsLoadedState) {
                  final setting = state.settingsHelper
                      .where((setting) => setting.title == 'unlockApp'.tr())
                      .firstOrNull;
                  if (setting != null) {
                    return AdBanner(
                      height: add!.size.height.toDouble(),
                      onCloseAdTap: () {},
                      ad: SizedBox(
                        height: add!.size.height.toDouble(),
                        width: add!.size.width.toDouble(),
                        child: AdWidget(ad: add!),
                      ),
                    );
                  }
                }
                return const SizedBox.shrink();

              },
            ),
    );
  }
}
