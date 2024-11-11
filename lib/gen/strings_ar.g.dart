///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsAr implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsAr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ar,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ar>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsAr _root = this; // ignore: unused_field

	// Translations
	@override String get splashTitle => 'هل أنتم مستعدون لاختباركم؟';
	@override String get splashSubtitle => 'ابدأ الآن بإنشاء ملفك الشخصي والتواصل!';
	@override String get defaultErrorMessage => 'حدث خطأ ما! يرجى المحاولة لاحقًا. إذا استمرت المشكلة، تواصل معنا على \'suporttest@gmail.com\'';
	@override String get cameraAccessDenied => 'لاستخدام هذه الميزة، يرجى الذهاب إلى تطبيق الإعدادات وتمكين الوصول إلى الكاميرا.';
	@override String get cameraAccessRestricted => 'لاستخدام هذه الميزة، يرجى الذهاب إلى تطبيق الإعدادات وتمكين الوصول إلى الكاميرا.';
	@override String get continueText => 'استمر';
	@override String get ok => 'موافق';
	@override String get error_header => 'عذرًا، حدث خطأ';
	@override String get birthdayStepTitle => 'متى كان يوم\nميلادك؟';
	@override String get niknameStepTitle => 'اختر اسمك\nالمستعار';
	@override String get genderStepTitle => 'ما هو جنسك؟';
	@override String get genderStepSubTitle => 'يساعدنا جنسُك في العثور على\nالمطابقات المناسبة لك.';
	@override String get firstPhotoStepTitle => 'أضف صورة جميلة\nلنفسك';
	@override String get unlockApp => 'فتح التطبيق';
	@override String get rateUs => 'قيمنا';
	@override String get username => 'اسم المستخدم';
	@override String get birthday => 'تاريخ الميلاد';
	@override String get myAccount => 'حسابي';
	@override String get settings => 'الإعدادات';
	@override String get day => 'اليوم';
	@override String get month => 'الشهر';
	@override String get year => 'السنة';
	@override String get invalidDate => 'تاريخ الميلاد غير صالح';
	@override String get exit => 'خروج';
	@override String get invalidNickname => 'لا يمكن أن يكون الاسم المستعار فارغًا';
	@override String get male => 'ذكر';
	@override String get female => 'أنثى';
	@override String get other => 'آخر';
	@override String get firstPhoto => 'التقط صورتك الأولى';
	@override String get imageGuidelinesTitle => 'تأكد من أن صورتك';
	@override String get imageGuidelinesFirstText => 'تُظهر وجهك بوضوح';
	@override String get imageGuidelinesSecondText => 'صورة لك فقط، لا صور جماعية';
	@override String get imageGuidelinesThirdText => 'لا صور مزيفة أو أشياء أو شخص آخر';
	@override String get phoneNotHaveCamera => 'الهاتف لا يحتوي على كاميرا';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsAr {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'splashTitle': return 'هل أنتم مستعدون لاختباركم؟';
			case 'splashSubtitle': return 'ابدأ الآن بإنشاء ملفك الشخصي والتواصل!';
			case 'defaultErrorMessage': return 'حدث خطأ ما! يرجى المحاولة لاحقًا. إذا استمرت المشكلة، تواصل معنا على \'suporttest@gmail.com\'';
			case 'cameraAccessDenied': return 'لاستخدام هذه الميزة، يرجى الذهاب إلى تطبيق الإعدادات وتمكين الوصول إلى الكاميرا.';
			case 'cameraAccessRestricted': return 'لاستخدام هذه الميزة، يرجى الذهاب إلى تطبيق الإعدادات وتمكين الوصول إلى الكاميرا.';
			case 'continueText': return 'استمر';
			case 'ok': return 'موافق';
			case 'error_header': return 'عذرًا، حدث خطأ';
			case 'birthdayStepTitle': return 'متى كان يوم\nميلادك؟';
			case 'niknameStepTitle': return 'اختر اسمك\nالمستعار';
			case 'genderStepTitle': return 'ما هو جنسك؟';
			case 'genderStepSubTitle': return 'يساعدنا جنسُك في العثور على\nالمطابقات المناسبة لك.';
			case 'firstPhotoStepTitle': return 'أضف صورة جميلة\nلنفسك';
			case 'unlockApp': return 'فتح التطبيق';
			case 'rateUs': return 'قيمنا';
			case 'username': return 'اسم المستخدم';
			case 'birthday': return 'تاريخ الميلاد';
			case 'myAccount': return 'حسابي';
			case 'settings': return 'الإعدادات';
			case 'day': return 'اليوم';
			case 'month': return 'الشهر';
			case 'year': return 'السنة';
			case 'invalidDate': return 'تاريخ الميلاد غير صالح';
			case 'exit': return 'خروج';
			case 'invalidNickname': return 'لا يمكن أن يكون الاسم المستعار فارغًا';
			case 'male': return 'ذكر';
			case 'female': return 'أنثى';
			case 'other': return 'آخر';
			case 'firstPhoto': return 'التقط صورتك الأولى';
			case 'imageGuidelinesTitle': return 'تأكد من أن صورتك';
			case 'imageGuidelinesFirstText': return 'تُظهر وجهك بوضوح';
			case 'imageGuidelinesSecondText': return 'صورة لك فقط، لا صور جماعية';
			case 'imageGuidelinesThirdText': return 'لا صور مزيفة أو أشياء أو شخص آخر';
			case 'phoneNotHaveCamera': return 'الهاتف لا يحتوي على كاميرا';
			default: return null;
		}
	}
}

