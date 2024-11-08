part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.saveUser({
    required String name,
    required DateTime birthday,
    required GenderType gender,
  }) = _SaveUserEvent;

  const factory UserEvent.fetchData() = _FetchDataEvent;
}
