import 'package:music_streaming_app/core/core.dart';
import 'package:music_streaming_app/data/user/dtos/user_dto.dart';

abstract interface class UserDataSource {
  Future<ResultData<UserDto, FailureResult>> fetchUser();

  Future<ResultData<UserDto, FailureResult>> saveUser(UserDto user);

  Future<ResultData<String, FailureResult>> uploadPhoto(String photoPath);
}
