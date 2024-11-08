import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'validator_state.dart';
part 'validator_cubit.freezed.dart';

class ValidatorCubit extends Cubit<ValidatorState> {
  ValidatorCubit() : super(const ValidatorState.initial());

  void checkValidation({
    required String dayStr,
    required String monthStr,
    required String yearStr,
    required bool isNicknameValidation,
    required String nickName,
  }) {
    emit(const ValidatorState.initial());

    if (isNicknameValidation) {
      if (nickName.isEmpty) {
        emit(const ValidatorState.invalid());
      } else {
        emit(const ValidatorState.valid());
      }

      return;
    }

    int day, month, year;

    try {
      day = int.parse(dayStr);
      month = int.parse(monthStr);
      year = int.parse(yearStr);
    } catch (e) {
      emit(const ValidatorState.invalid());

      return;
    }

    if (day <= 0 || month <= 0 || year <= 0) {
      emit(const ValidatorState.invalid());

      return;
    }

    if (month < 1 || month > 12) {
      emit(const ValidatorState.invalid());

      return;
    }

    final currentYear = DateTime.now().year;
    if (year < 1900 || year > currentYear) {
      emit(const ValidatorState.invalid());

      return;
    }

    int maxDay;
    final monthsWith31Days = <int>[1, 3, 5, 7, 8, 10, 12];

    if (month == 2) {
      final isLeapYear = (year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0));
      maxDay = isLeapYear ? 29 : 28;
    } else if (monthsWith31Days.contains(month)) {
      maxDay = 31;
    } else {
      maxDay = 30;
    }

    if (day < 1 || day > maxDay) {
      emit(const ValidatorState.invalid());

      return;
    }

    emit(const ValidatorState.valid());
  }
}
