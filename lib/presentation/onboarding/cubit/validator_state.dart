part of 'validator_cubit.dart';

@freezed
class ValidatorState with _$ValidatorState {
  const factory ValidatorState.initial() = ValidatorinitialState;
  const factory ValidatorState.valid() = ValidatorValidState;
  const factory ValidatorState.invalid() = ValidatorinvalidState;
}
