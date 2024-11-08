part of 'settings_bloc.dart';

@freezed
class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.fetchSettings({required BuildContext context}) = _FetchSettingsEvent;
  const factory SettingsEvent.changeUnlockUppStatus() = _ChangeUnlockUppStatus;
}
