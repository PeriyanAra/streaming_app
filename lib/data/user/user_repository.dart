import 'package:music_streaming_app/core/core.dart';
import 'package:music_streaming_app/data/data.dart';

class UserRepository {
  const UserRepository({
    required UserDataSource userLocalDataSource,
  }) : _userLocalDataSource = userLocalDataSource;

  final UserDataSource _userLocalDataSource;

  Future<ResultData<UserDto, FailureResult>> fetchUser() {
    return _userLocalDataSource.fetchUser();
  }

  Future<ResultData<UserDto, FailureResult>> saveUser(
    UserDto user,
  ) {
    return _userLocalDataSource.saveUser(user);
  }

  Future<ResultData<String, FailureResult>> uploadPhoto(
    String photoPath,
  ) {
    return _userLocalDataSource.uploadPhoto(photoPath);
  }
}
