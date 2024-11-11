// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "splashTitle": "Are you ready for\nyour test?",
  "splashSubtitle": "Start now by creating your profile and connect!",
  "defaultErrorMessage": "Something went wrong!. Please try again later. If problem not fix connect us 'suporttest@gmail.com'",
  "cameraAccessDenied": "To use this feature, please go to the Settings app and enable camera access.",
  "cameraAccessRestricted": "To use this feature, please go to the Settings app and enable camera access.",
  "continueText": "Continue",
  "continue": "Continue",
  "ok": "Ok",
  "error_header": "Oops, we have an error",
  "birthdayStepTitle": "When’s your\nbirthday?",
  "niknameStepTitle": "Choose your\nnickname",
  "genderStepTitle": "Which gender do\nyou identify as?",
  "firstPhotoStepTitle": "Add a nice photo\nof yourself",
  "day": "Day",
  "month": "Month",
  "year": "Year",
  "invalidDate": "Invalid date of birthday"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en};
}
