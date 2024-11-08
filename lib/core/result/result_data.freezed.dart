// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ResultData<T, E extends Exception> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(E exception) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(E exception)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(E exception)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SuccessResult<T, E> value) success,
    required TResult Function(_FailureResult<T, E> value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SuccessResult<T, E> value)? success,
    TResult? Function(_FailureResult<T, E> value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SuccessResult<T, E> value)? success,
    TResult Function(_FailureResult<T, E> value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultDataCopyWith<T, E extends Exception, $Res> {
  factory $ResultDataCopyWith(
          ResultData<T, E> value, $Res Function(ResultData<T, E>) then) =
      _$ResultDataCopyWithImpl<T, E, $Res, ResultData<T, E>>;
}

/// @nodoc
class _$ResultDataCopyWithImpl<T, E extends Exception, $Res,
    $Val extends ResultData<T, E>> implements $ResultDataCopyWith<T, E, $Res> {
  _$ResultDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResultData
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SuccessResultImplCopyWith<T, E extends Exception, $Res> {
  factory _$$SuccessResultImplCopyWith(_$SuccessResultImpl<T, E> value,
          $Res Function(_$SuccessResultImpl<T, E>) then) =
      __$$SuccessResultImplCopyWithImpl<T, E, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$SuccessResultImplCopyWithImpl<T, E extends Exception, $Res>
    extends _$ResultDataCopyWithImpl<T, E, $Res, _$SuccessResultImpl<T, E>>
    implements _$$SuccessResultImplCopyWith<T, E, $Res> {
  __$$SuccessResultImplCopyWithImpl(_$SuccessResultImpl<T, E> _value,
      $Res Function(_$SuccessResultImpl<T, E>) _then)
      : super(_value, _then);

  /// Create a copy of ResultData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$SuccessResultImpl<T, E>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$SuccessResultImpl<T, E extends Exception> extends _SuccessResult<T, E> {
  const _$SuccessResultImpl(this.data) : super._();

  @override
  final T data;

  @override
  String toString() {
    return 'ResultData<$T, $E>.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessResultImpl<T, E> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of ResultData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessResultImplCopyWith<T, E, _$SuccessResultImpl<T, E>> get copyWith =>
      __$$SuccessResultImplCopyWithImpl<T, E, _$SuccessResultImpl<T, E>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(E exception) failure,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(E exception)? failure,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(E exception)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SuccessResult<T, E> value) success,
    required TResult Function(_FailureResult<T, E> value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SuccessResult<T, E> value)? success,
    TResult? Function(_FailureResult<T, E> value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SuccessResult<T, E> value)? success,
    TResult Function(_FailureResult<T, E> value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _SuccessResult<T, E extends Exception> extends ResultData<T, E> {
  const factory _SuccessResult(final T data) = _$SuccessResultImpl<T, E>;
  const _SuccessResult._() : super._();

  T get data;

  /// Create a copy of ResultData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessResultImplCopyWith<T, E, _$SuccessResultImpl<T, E>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureResultImplCopyWith<T, E extends Exception, $Res> {
  factory _$$FailureResultImplCopyWith(_$FailureResultImpl<T, E> value,
          $Res Function(_$FailureResultImpl<T, E>) then) =
      __$$FailureResultImplCopyWithImpl<T, E, $Res>;
  @useResult
  $Res call({E exception});
}

/// @nodoc
class __$$FailureResultImplCopyWithImpl<T, E extends Exception, $Res>
    extends _$ResultDataCopyWithImpl<T, E, $Res, _$FailureResultImpl<T, E>>
    implements _$$FailureResultImplCopyWith<T, E, $Res> {
  __$$FailureResultImplCopyWithImpl(_$FailureResultImpl<T, E> _value,
      $Res Function(_$FailureResultImpl<T, E>) _then)
      : super(_value, _then);

  /// Create a copy of ResultData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = null,
  }) {
    return _then(_$FailureResultImpl<T, E>(
      null == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as E,
    ));
  }
}

/// @nodoc

class _$FailureResultImpl<T, E extends Exception> extends _FailureResult<T, E> {
  const _$FailureResultImpl(this.exception) : super._();

  @override
  final E exception;

  @override
  String toString() {
    return 'ResultData<$T, $E>.failure(exception: $exception)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureResultImpl<T, E> &&
            const DeepCollectionEquality().equals(other.exception, exception));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(exception));

  /// Create a copy of ResultData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureResultImplCopyWith<T, E, _$FailureResultImpl<T, E>> get copyWith =>
      __$$FailureResultImplCopyWithImpl<T, E, _$FailureResultImpl<T, E>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(E exception) failure,
  }) {
    return failure(exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(E exception)? failure,
  }) {
    return failure?.call(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(E exception)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SuccessResult<T, E> value) success,
    required TResult Function(_FailureResult<T, E> value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SuccessResult<T, E> value)? success,
    TResult? Function(_FailureResult<T, E> value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SuccessResult<T, E> value)? success,
    TResult Function(_FailureResult<T, E> value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _FailureResult<T, E extends Exception> extends ResultData<T, E> {
  const factory _FailureResult(final E exception) = _$FailureResultImpl<T, E>;
  const _FailureResult._() : super._();

  E get exception;

  /// Create a copy of ResultData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailureResultImplCopyWith<T, E, _$FailureResultImpl<T, E>> get copyWith =>
      throw _privateConstructorUsedError;
}
