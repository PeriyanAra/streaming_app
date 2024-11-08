import 'dart:convert';

import 'package:music_streaming_app/core/converters/converters.dart';

class JsonStringConverter {
  JsonStringConverter({
    required CustomJsonDecoder jsonDecoder,
  }) : _jsonDecoder = jsonDecoder;

  final CustomJsonDecoder _jsonDecoder;

  String toJsonString<T>(T value) => jsonEncode(value);

  T fromJsonString<T>(String value) => _jsonDecoder.decode<T>(jsonDecode(value));
}
