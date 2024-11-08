import 'package:music_streaming_app/data/database/tables/user_table.dart';

List<String> initialScripts() {
  return [
    createUserTable(),
  ];
}
