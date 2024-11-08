import 'dart:convert';
import 'dart:io';

import 'package:music_streaming_app/core/core.dart';
import 'package:music_streaming_app/data/database/database_constants.dart';
import 'package:music_streaming_app/data/user/user.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

final class UserLocalDataSource with SafeExecutionMixin implements UserDataSource {
  const UserLocalDataSource({
    required Database database,
  }) : _database = database;

  final Database _database;

  @override
  Future<ResultData<UserDto, FailureResult>> fetchUser() {
    return executeSafely<ResultData<UserDto, FailureResult>>(
      () async {
        final items = await _database.rawQuery(
          'SELECT * FROM ${DatabaseConstants.userTable}',
        );

        if (items.isEmpty) {
          return const ResultData.failure(
            FailureResult(
              reason: FailureReasons.unknown,
              debugMessage: 'not have data in local DB',
            ),
          );
        }

        final userJsonMap = {...items.first};

        userJsonMap[DatabaseConstants.photos] = jsonDecode(
          userJsonMap[DatabaseConstants.photos].toString(),
        );

        final userDto = UserDto.fromJson(userJsonMap);

        final photos = [...userDto.photos];

        final dir = await getApplicationDocumentsDirectory();

        for (var i = 0; i < photos.length; i++) {
          photos[i] = '$dir/${photos[i]}';
        }

        return ResultData.success(
          userDto.copyWith(photos: photos),
        );
      },
      onError: ResultData.failure,
    );
  }

  @override
  Future<ResultData<UserDto, FailureResult>> saveUser(UserDto user) async {
    return executeSafely<ResultData<UserDto, FailureResult>>(
      () async {
        final userResponse = await fetchUser();

        final batch = _database.batch()
          ..delete(DatabaseConstants.userTable)
          ..rawInsert(
            '''
          INSERT INTO ${DatabaseConstants.userTable}(
              ${DatabaseConstants.name},
              ${DatabaseConstants.birthday},
              ${DatabaseConstants.gender},
              ${DatabaseConstants.photos}
          ) VALUES(?, ?, ?, ?)
        ''',
            [
              user.name,
              user.birthday.toIso8601String(),
              user.gender.name,
              if (userResponse.isSuccess) jsonEncode(userResponse.data.photos) else jsonEncode([]),
            ],
          );

        await batch.commit();

        return ResultData.success(
          user.copyWith(
            photos: userResponse.isSuccess ? userResponse.data.photos : user.photos,
          ),
        );
      },
      onError: ResultData.failure,
    );
  }

  @override
  Future<ResultData<String, FailureResult>> uploadPhoto(
    String photoPath,
  ) async {
    return executeSafely<ResultData<String, FailureResult>>(
      () async {
        final tempFile = File(photoPath);

        final dirPath = await _createDirectoryAndGetPath();

        final file = File('$dirPath/${_getFileName(photoPath)}')
          ..createSync()
          ..writeAsBytesSync(tempFile.readAsBytesSync());

        tempFile.deleteSync();

        final userResponse = await fetchUser();

        if (userResponse.isFailure) {
          return ResultData.failure(userResponse.exception);
        }

        final photos = [
          ...userResponse.data.photos.map(_getFileName),
          _getFileName(file.path),
        ];

        final updatedUser = userResponse.data.copyWith(
          photos: photos,
        );

        await _database.delete(DatabaseConstants.userTable);

        await _database.rawInsert(
          '''
          INSERT INTO ${DatabaseConstants.userTable}(
              ${DatabaseConstants.name},
              ${DatabaseConstants.birthday},
              ${DatabaseConstants.gender},
              ${DatabaseConstants.photos}
          ) VALUES(?, ?, ?, ?)
        ''',
          [
            updatedUser.name,
            updatedUser.birthday.toIso8601String(),
            updatedUser.gender.name,
            jsonEncode(updatedUser.photos),
          ],
        );

        return ResultData.success(file.path);
      },
      onError: ResultData.failure,
    );
  }

  Future<String> _createDirectoryAndGetPath() async {
    final dir = await getApplicationDocumentsDirectory();

    const path = 'photos';
    final fullPath = '${dir.path}/$path';
    final directoryExists = Directory(fullPath).existsSync();

    if (!directoryExists) {
      Directory(fullPath).createSync(recursive: true);
    }

    return fullPath;
  }

  String _getFileName(String filePath) {
    final filePathParts = filePath.split('/');

    if (filePathParts.isEmpty) {
      return filePath;
    }

    return filePathParts.last;
  }
}
