part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.loading() = UserLoadingState;

  const factory UserState.loaded({required UserViewModel? user}) = UserLoadedState;

  const factory UserState.error({required String errorMessage}) = UserErrorState;
}
