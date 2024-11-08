import 'package:flutter/material.dart';
import 'package:music_streaming_app/presentation/common/common.dart';
import 'package:music_streaming_app/presentation/setting/theme/theme.dart';

class MyAccountSection extends StatelessWidget {
  const MyAccountSection({
    super.key,
    required this.title,
    required this.items,
  });

  final String title;
  final List<Map<String, String>> items;

  @override
  Widget build(BuildContext context) {
    final settingTheme = SettingTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: settingTheme.settingSectionTitleTextStyle,
        ),
        HBox(height: settingTheme.titleBottomSpacing),
        Container(
          decoration: BoxDecoration(
            color: settingTheme.settingCardBackgroundColor,
            borderRadius: BorderRadius.circular(settingTheme.settingCardBorderRadius),
          ),
          child: Column(
            children: items.map((item) {
              return GestureDetector(
                
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        item['title'] ?? '',
                        style: settingTheme.settingSectionItemTextStyle,
                      ),
                      trailing: item['value'] != null
                          ? Text(
                              item['value']!,
                              style: settingTheme.valueTextStyle,
                            )
                          : null,
                    ),
                    if (item != items.last) Divider(color: settingTheme.settingCardDividerColor, height: 1),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
