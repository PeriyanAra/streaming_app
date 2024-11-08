import 'package:music_streaming_app/data/database/database_constants.dart';

String createUserTable() {
  return '''
    CREATE TABLE ${DatabaseConstants.userTable}
      (
          ${DatabaseConstants.name} TEXT NOT NULL,
          ${DatabaseConstants.birthday} TEXT NOT NULL,
          ${DatabaseConstants.gender} TEXT NOT NULL,
          ${DatabaseConstants.photos} TEXT NOT NULL
      )
    ''';
}
