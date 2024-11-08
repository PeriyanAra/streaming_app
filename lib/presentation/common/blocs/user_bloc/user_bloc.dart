import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_streaming_app/core/core.dart';
import 'package:music_streaming_app/data/data.dart';
import 'package:music_streaming_app/presentation/common/view_models/user_view_model.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({
    required UserRepository repository,
  })  : _repository = repository,
        super(const UserState.loading()) {
    on<_SaveUserEvent>(_handleSaveUserEvent);
    on<_FetchDataEvent>(_handleFetchDataEvent);
  }

  final UserRepository _repository;

  Future<void> _handleSaveUserEvent(
    _SaveUserEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserState.loading());

    final response = await _repository.saveUser(
      UserDto(
        name: event.name,
        birthday: event.birthday,
        gender: event.gender,
        photos: [],
      ),
    );

    response.when(
      success: (data) => emit(
        UserState.loaded(
          user: UserViewModel.fromDto(data),
        ),
      ),
      failure: (failure) => emit(
        UserState.error(
          errorMessage: failure.debugMessage,
        ),
      ),
    );
  }

  Future<void> _handleFetchDataEvent(
    _FetchDataEvent event,
    Emitter<UserState> emit,
  ) async {
    final response = await _repository.fetchUser();

    response.when(
      success: (data) => emit(
        UserState.loaded(
          user: UserViewModel.fromDto(data),
        ),
      ),
      failure: (_) => emit(
        const UserState.loaded(user: null),
      ),
    );
  }
}
