part of 'settings_bloc.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.loading() = SettingsLoadingState;

  const factory SettingsState.loaded({
    required List<SettingsData> settingsHelper,
  }) = SettingsLoadedState;

  const factory SettingsState.error({
    required String failureMsg,
  }) = SettingsErrorState;
}
