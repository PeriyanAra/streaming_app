import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_streaming_app/core/enums/gender_type.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDto with _$UserDto {
  const factory UserDto({
    required String name,
    required DateTime birthday,
    required GenderType gender,
    required List<String> photos,
  }) = _UserDto;

  const UserDto._();

  factory UserDto.fromJson(Map<String, Object?> json) => _$UserDtoFromJson(json);
}
