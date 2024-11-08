import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:music_streaming_app/presentation/common/widgets/h_box.dart';
import 'package:music_streaming_app/presentation/setting/theme/setting_theme.dart';
import 'package:music_streaming_app/presentation/setting/widget/settings_data_helper_class.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({
    super.key,
    required this.allSettingsData,
  });

  final List<SettingsData> allSettingsData;

  @override
  Widget build(BuildContext context) {
    final settingTheme = SettingTheme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'settings'.tr(),
          style: settingTheme.settingSectionTitleTextStyle,
        ),
        HBox(height: settingTheme.titleBottomSpacing),
        Container(
          decoration: BoxDecoration(
            color: settingTheme.settingCardBackgroundColor,
            borderRadius: BorderRadius.circular(settingTheme.settingCardBorderRadius),
          ),
          child: Column(
            children: [
              for (final settingsData in allSettingsData)
                GestureDetector(
                  onTap: settingsData.onTap,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          settingsData.title,
                          style: settingTheme.settingSectionItemTextStyle,
                        ),
                      ),
                      if (settingsData != allSettingsData.last)
                        Divider(color: settingTheme.settingCardDividerColor, height: 1),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
