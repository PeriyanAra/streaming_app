import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_streaming_app/core/core.dart';
import 'package:music_streaming_app/data/user/user.dart';

part 'user_view_model.freezed.dart';

@freezed
class UserViewModel with _$UserViewModel {
  const factory UserViewModel({
    required String name,
    required GenderType gender,
    required DateTime birthday,
    required List<String> photos,
  }) = _UserViewModel;

  const UserViewModel._();

  factory UserViewModel.fromDto(UserDto dto) {
    return UserViewModel(
      name: dto.name,
      gender: dto.gender,
      birthday: dto.birthday,
      photos: dto.photos,
    );
  }
}
