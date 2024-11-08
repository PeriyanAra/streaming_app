import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_data.freezed.dart';

@freezed
class ResultData<T, E extends Exception> with _$ResultData<T, E> {
  const ResultData._();

  const factory ResultData.success(T data) = _SuccessResult;
  const factory ResultData.failure(E exception) = _FailureResult;

  T get data => (this as _SuccessResult).data as T;
  E get exception => (this as _FailureResult).exception as E;

  bool get isSuccess => this is _SuccessResult;
  bool get isFailure => this is _FailureResult;
}
