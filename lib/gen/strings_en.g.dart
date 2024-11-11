///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	String get splashTitle => 'Are you ready for\nyour test?';
	String get splashSubtitle => 'Start now by creating your profile and connect!';
	String get defaultErrorMessage => 'Something went wrong!. Please try again later. If problem not fix connect us \'suporttest@gmail.com\'';
	String get cameraAccessDenied => 'To use this feature, please go to the Settings app and enable camera access.';
	String get cameraAccessRestricted => 'To use this feature, please go to the Settings app and enable camera access.';
	String get continueText => 'Continue';
	String get ok => 'Ok';
	String get error_header => 'Oops, we have an error';
	String get birthdayStepTitle => 'When’s your\nbirthday?';
	String get niknameStepTitle => 'Choose your\nnickname';
	String get genderStepTitle => 'Which gender do\nyou identify as?';
	String get genderStepSubTitle => 'Your gender helps us find the right\n matches for you.';
	String get firstPhotoStepTitle => 'Add a nice photo\nof yourself';
	String get unlockApp => 'Unlock App';
	String get rateUs => 'Rate Us';
	String get username => 'Username';
	String get birthday => 'Birthday';
	String get myAccount => 'My Account';
	String get settings => 'Settings';
	String get day => 'Day';
	String get month => 'Month';
	String get year => 'Year';
	String get invalidDate => 'Invalid date of birthday';
	String get exit => 'Exit';
	String get invalidNickname => 'Nickname can not be empty';
	String get male => 'Male';
	String get female => 'Female';
	String get other => 'Other';
	String get firstPhoto => 'Take your first photo';
	String get imageGuidelinesTitle => 'Make sure that your image';
	String get imageGuidelinesFirstText => 'Shows your face clearly';
	String get imageGuidelinesSecondText => 'Yourself only, no group pic';
	String get imageGuidelinesThirdText => 'No fake pic, object or someone else';
	String get phoneNotHaveCamera => 'Phone not have camera';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'splashTitle': return 'Are you ready for\nyour test?';
			case 'splashSubtitle': return 'Start now by creating your profile and connect!';
			case 'defaultErrorMessage': return 'Something went wrong!. Please try again later. If problem not fix connect us \'suporttest@gmail.com\'';
			case 'cameraAccessDenied': return 'To use this feature, please go to the Settings app and enable camera access.';
			case 'cameraAccessRestricted': return 'To use this feature, please go to the Settings app and enable camera access.';
			case 'continueText': return 'Continue';
			case 'ok': return 'Ok';
			case 'error_header': return 'Oops, we have an error';
			case 'birthdayStepTitle': return 'When’s your\nbirthday?';
			case 'niknameStepTitle': return 'Choose your\nnickname';
			case 'genderStepTitle': return 'Which gender do\nyou identify as?';
			case 'genderStepSubTitle': return 'Your gender helps us find the right\n matches for you.';
			case 'firstPhotoStepTitle': return 'Add a nice photo\nof yourself';
			case 'unlockApp': return 'Unlock App';
			case 'rateUs': return 'Rate Us';
			case 'username': return 'Username';
			case 'birthday': return 'Birthday';
			case 'myAccount': return 'My Account';
			case 'settings': return 'Settings';
			case 'day': return 'Day';
			case 'month': return 'Month';
			case 'year': return 'Year';
			case 'invalidDate': return 'Invalid date of birthday';
			case 'exit': return 'Exit';
			case 'invalidNickname': return 'Nickname can not be empty';
			case 'male': return 'Male';
			case 'female': return 'Female';
			case 'other': return 'Other';
			case 'firstPhoto': return 'Take your first photo';
			case 'imageGuidelinesTitle': return 'Make sure that your image';
			case 'imageGuidelinesFirstText': return 'Shows your face clearly';
			case 'imageGuidelinesSecondText': return 'Yourself only, no group pic';
			case 'imageGuidelinesThirdText': return 'No fake pic, object or someone else';
			case 'phoneNotHaveCamera': return 'Phone not have camera';
			default: return null;
		}
	}
}

