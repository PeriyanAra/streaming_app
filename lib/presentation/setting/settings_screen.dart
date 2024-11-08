import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_streaming_app/core/core.dart';
import 'package:music_streaming_app/presentation/common/common.dart';
import 'package:music_streaming_app/presentation/common/helpers/date_time_helper.dart';
import 'package:music_streaming_app/presentation/setting/settings_bloc/settings_bloc.dart';
import 'package:music_streaming_app/presentation/setting/theme/setting_theme.dart';
import 'package:music_streaming_app/presentation/setting/widget/settings_section.dart';
import 'package:music_streaming_app/presentation/setting/widget/widget.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    super.initState();

    DiGetItImplementation()<SettingsBloc>().add( SettingsEvent.fetchSettings(context: context));
  }

  @override
  Widget build(BuildContext context) {
    final settingTheme = SettingTheme.of(context);

    return BlocConsumer<SettingsBloc, SettingsState>(
      listener: (context, state) {
        if (state is SettingsErrorState) {
          final errorMsg = state.failureMsg;
          DialogHelper.show(
            context,
            title: errorMsg,
            buttonText: 'exit'.tr(),
          );
        }
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const CircularProgressIndicator(),
          loaded: (settingsData) {
            return Scaffold(
              backgroundColor: settingTheme.backgroundColor,
              body: SafeArea(
                child: Padding(
                  padding: settingTheme.screenPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TopBarSection(),
                      HBox(height: settingTheme.settingTopSpacing),
                      SettingsSection(
                          allSettingsData: settingsData,
                      ),
                      HBox(height: settingTheme.settingItemSpacing),
                      BlocBuilder<UserBloc, UserState>(
                        builder: (context, state) {
                          final user = state.maybeMap(
                            loaded: (value) => value.user,
                            orElse: () => null,
                          );
                          return MyAccountSection(
                            title: 'myAccount'.tr(),
                            items: [
                              {'title': 'username'.tr(), 'value': user?.name ?? ''},
                              {'title': 'birthday'.tr(), 'value': user?.birthday.toStringDDMMMWithYear() ?? ''},
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
