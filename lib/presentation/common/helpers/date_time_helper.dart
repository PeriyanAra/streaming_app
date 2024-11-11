import 'package:intl/intl.dart';

extension DateTimeFormatterExtension on DateTime {
  //Example: 17:45
  String toTime() {
    return DateFormat.Hm().format(this);
  }

  String toDayLabel() {
    final now = DateTime.now();

    var label = '';

    if (day == now.day) {
      label = 'today';
    } else if (day == now.day - 1) {
      label = 'yesterday';
    } else if (day == now.day + 1) {
      label = 'tomorrow';
    }

    return label;
  }

  //Example: April
  String toMonth() {
    return DateFormat('MMMM').format(this);
  }

  //Example: Apr 24
  String toStringMMMdd([String? locale]) {
    return DateFormat('MMM dd', locale).format(this);
  }

  String toStringDDMMM([String? locale]) {
    return DateFormat('dd MMM', locale).format(this);
  }

  //Example: Apr 24 17:45
  String toStringMMMddWithTime([String? locale]) {
    return '${toStringMMMdd(locale)} ${toTime()}';
  }

  //Example: Apr 24 2023
  String toStringMMMddWithYear([String? locale]) {
    return '${toStringMMMdd(locale)} $year';
  }

  String toStringDDMMMWithYear([String? locale]) {
    return '${toStringDDMMM(locale)} $year';
  }

  //Example: 4/28/23
  String toStringWithSlashes() {
    return '$month/$day/${year.toString().substring(2)}';
  }

  //Example: 22.09.2023
  String toStringWithDots() {
    return '${_twoDigits(day)}.${_twoDigits(month)}.$year';
  }

  //Example: 4/28/23
  String toStringWithSlashesAndTime() {
    return '$month/$day/${year.toString().substring(2)} ${toTime()}';
  }

  String toCode() {
    return '${toDateCode()}_${toTimeCode()}';
  }

  String toDateCode() {
    return '$year${_twoDigits(month)}${_twoDigits(day)}';
  }

  String toTimeCode() {
    return '${_twoDigits(hour)}${_twoDigits(minute)}${_twoDigits(second)}';
  }

  String _twoDigits(int n) {
    if (n >= 10) {
      return '$n';
    }
    return '0$n';
  }
}
