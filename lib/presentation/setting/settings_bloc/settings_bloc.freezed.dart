// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SettingsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context) fetchSettings,
    required TResult Function() changeUnlockUppStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context)? fetchSettings,
    TResult? Function()? changeUnlockUppStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context)? fetchSettings,
    TResult Function()? changeUnlockUppStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchSettingsEvent value) fetchSettings,
    required TResult Function(_ChangeUnlockUppStatus value)
        changeUnlockUppStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchSettingsEvent value)? fetchSettings,
    TResult? Function(_ChangeUnlockUppStatus value)? changeUnlockUppStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchSettingsEvent value)? fetchSettings,
    TResult Function(_ChangeUnlockUppStatus value)? changeUnlockUppStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsEventCopyWith<$Res> {
  factory $SettingsEventCopyWith(
          SettingsEvent value, $Res Function(SettingsEvent) then) =
      _$SettingsEventCopyWithImpl<$Res, SettingsEvent>;
}

/// @nodoc
class _$SettingsEventCopyWithImpl<$Res, $Val extends SettingsEvent>
    implements $SettingsEventCopyWith<$Res> {
  _$SettingsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchSettingsEventImplCopyWith<$Res> {
  factory _$$FetchSettingsEventImplCopyWith(_$FetchSettingsEventImpl value,
          $Res Function(_$FetchSettingsEventImpl) then) =
      __$$FetchSettingsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BuildContext context});
}

/// @nodoc
class __$$FetchSettingsEventImplCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res, _$FetchSettingsEventImpl>
    implements _$$FetchSettingsEventImplCopyWith<$Res> {
  __$$FetchSettingsEventImplCopyWithImpl(_$FetchSettingsEventImpl _value,
      $Res Function(_$FetchSettingsEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
  }) {
    return _then(_$FetchSettingsEventImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$FetchSettingsEventImpl implements _FetchSettingsEvent {
  const _$FetchSettingsEventImpl({required this.context});

  @override
  final BuildContext context;

  @override
  String toString() {
    return 'SettingsEvent.fetchSettings(context: $context)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchSettingsEventImpl &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context);

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchSettingsEventImplCopyWith<_$FetchSettingsEventImpl> get copyWith =>
      __$$FetchSettingsEventImplCopyWithImpl<_$FetchSettingsEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context) fetchSettings,
    required TResult Function() changeUnlockUppStatus,
  }) {
    return fetchSettings(context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context)? fetchSettings,
    TResult? Function()? changeUnlockUppStatus,
  }) {
    return fetchSettings?.call(context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context)? fetchSettings,
    TResult Function()? changeUnlockUppStatus,
    required TResult orElse(),
  }) {
    if (fetchSettings != null) {
      return fetchSettings(context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchSettingsEvent value) fetchSettings,
    required TResult Function(_ChangeUnlockUppStatus value)
        changeUnlockUppStatus,
  }) {
    return fetchSettings(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchSettingsEvent value)? fetchSettings,
    TResult? Function(_ChangeUnlockUppStatus value)? changeUnlockUppStatus,
  }) {
    return fetchSettings?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchSettingsEvent value)? fetchSettings,
    TResult Function(_ChangeUnlockUppStatus value)? changeUnlockUppStatus,
    required TResult orElse(),
  }) {
    if (fetchSettings != null) {
      return fetchSettings(this);
    }
    return orElse();
  }
}

abstract class _FetchSettingsEvent implements SettingsEvent {
  const factory _FetchSettingsEvent({required final BuildContext context}) =
      _$FetchSettingsEventImpl;

  BuildContext get context;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchSettingsEventImplCopyWith<_$FetchSettingsEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeUnlockUppStatusImplCopyWith<$Res> {
  factory _$$ChangeUnlockUppStatusImplCopyWith(
          _$ChangeUnlockUppStatusImpl value,
          $Res Function(_$ChangeUnlockUppStatusImpl) then) =
      __$$ChangeUnlockUppStatusImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChangeUnlockUppStatusImplCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res, _$ChangeUnlockUppStatusImpl>
    implements _$$ChangeUnlockUppStatusImplCopyWith<$Res> {
  __$$ChangeUnlockUppStatusImplCopyWithImpl(_$ChangeUnlockUppStatusImpl _value,
      $Res Function(_$ChangeUnlockUppStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ChangeUnlockUppStatusImpl implements _ChangeUnlockUppStatus {
  const _$ChangeUnlockUppStatusImpl();

  @override
  String toString() {
    return 'SettingsEvent.changeUnlockUppStatus()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeUnlockUppStatusImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context) fetchSettings,
    required TResult Function() changeUnlockUppStatus,
  }) {
    return changeUnlockUppStatus();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context)? fetchSettings,
    TResult? Function()? changeUnlockUppStatus,
  }) {
    return changeUnlockUppStatus?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context)? fetchSettings,
    TResult Function()? changeUnlockUppStatus,
    required TResult orElse(),
  }) {
    if (changeUnlockUppStatus != null) {
      return changeUnlockUppStatus();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchSettingsEvent value) fetchSettings,
    required TResult Function(_ChangeUnlockUppStatus value)
        changeUnlockUppStatus,
  }) {
    return changeUnlockUppStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchSettingsEvent value)? fetchSettings,
    TResult? Function(_ChangeUnlockUppStatus value)? changeUnlockUppStatus,
  }) {
    return changeUnlockUppStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchSettingsEvent value)? fetchSettings,
    TResult Function(_ChangeUnlockUppStatus value)? changeUnlockUppStatus,
    required TResult orElse(),
  }) {
    if (changeUnlockUppStatus != null) {
      return changeUnlockUppStatus(this);
    }
    return orElse();
  }
}

abstract class _ChangeUnlockUppStatus implements SettingsEvent {
  const factory _ChangeUnlockUppStatus() = _$ChangeUnlockUppStatusImpl;
}

/// @nodoc
mixin _$SettingsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<SettingsData> settingsHelper) loaded,
    required TResult Function(String failureMsg) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<SettingsData> settingsHelper)? loaded,
    TResult? Function(String failureMsg)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<SettingsData> settingsHelper)? loaded,
    TResult Function(String failureMsg)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SettingsLoadingState value) loading,
    required TResult Function(SettingsLoadedState value) loaded,
    required TResult Function(SettingsErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SettingsLoadingState value)? loading,
    TResult? Function(SettingsLoadedState value)? loaded,
    TResult? Function(SettingsErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SettingsLoadingState value)? loading,
    TResult Function(SettingsLoadedState value)? loaded,
    TResult Function(SettingsErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsStateCopyWith<$Res> {
  factory $SettingsStateCopyWith(
          SettingsState value, $Res Function(SettingsState) then) =
      _$SettingsStateCopyWithImpl<$Res, SettingsState>;
}

/// @nodoc
class _$SettingsStateCopyWithImpl<$Res, $Val extends SettingsState>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SettingsLoadingStateImplCopyWith<$Res> {
  factory _$$SettingsLoadingStateImplCopyWith(_$SettingsLoadingStateImpl value,
          $Res Function(_$SettingsLoadingStateImpl) then) =
      __$$SettingsLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SettingsLoadingStateImplCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$SettingsLoadingStateImpl>
    implements _$$SettingsLoadingStateImplCopyWith<$Res> {
  __$$SettingsLoadingStateImplCopyWithImpl(_$SettingsLoadingStateImpl _value,
      $Res Function(_$SettingsLoadingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SettingsLoadingStateImpl implements SettingsLoadingState {
  const _$SettingsLoadingStateImpl();

  @override
  String toString() {
    return 'SettingsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<SettingsData> settingsHelper) loaded,
    required TResult Function(String failureMsg) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<SettingsData> settingsHelper)? loaded,
    TResult? Function(String failureMsg)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<SettingsData> settingsHelper)? loaded,
    TResult Function(String failureMsg)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SettingsLoadingState value) loading,
    required TResult Function(SettingsLoadedState value) loaded,
    required TResult Function(SettingsErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SettingsLoadingState value)? loading,
    TResult? Function(SettingsLoadedState value)? loaded,
    TResult? Function(SettingsErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SettingsLoadingState value)? loading,
    TResult Function(SettingsLoadedState value)? loaded,
    TResult Function(SettingsErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SettingsLoadingState implements SettingsState {
  const factory SettingsLoadingState() = _$SettingsLoadingStateImpl;
}

/// @nodoc
abstract class _$$SettingsLoadedStateImplCopyWith<$Res> {
  factory _$$SettingsLoadedStateImplCopyWith(_$SettingsLoadedStateImpl value,
          $Res Function(_$SettingsLoadedStateImpl) then) =
      __$$SettingsLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<SettingsData> settingsHelper});
}

/// @nodoc
class __$$SettingsLoadedStateImplCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$SettingsLoadedStateImpl>
    implements _$$SettingsLoadedStateImplCopyWith<$Res> {
  __$$SettingsLoadedStateImplCopyWithImpl(_$SettingsLoadedStateImpl _value,
      $Res Function(_$SettingsLoadedStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? settingsHelper = null,
  }) {
    return _then(_$SettingsLoadedStateImpl(
      settingsHelper: null == settingsHelper
          ? _value._settingsHelper
          : settingsHelper // ignore: cast_nullable_to_non_nullable
              as List<SettingsData>,
    ));
  }
}

/// @nodoc

class _$SettingsLoadedStateImpl implements SettingsLoadedState {
  const _$SettingsLoadedStateImpl(
      {required final List<SettingsData> settingsHelper})
      : _settingsHelper = settingsHelper;

  final List<SettingsData> _settingsHelper;
  @override
  List<SettingsData> get settingsHelper {
    if (_settingsHelper is EqualUnmodifiableListView) return _settingsHelper;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_settingsHelper);
  }

  @override
  String toString() {
    return 'SettingsState.loaded(settingsHelper: $settingsHelper)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsLoadedStateImpl &&
            const DeepCollectionEquality()
                .equals(other._settingsHelper, _settingsHelper));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_settingsHelper));

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsLoadedStateImplCopyWith<_$SettingsLoadedStateImpl> get copyWith =>
      __$$SettingsLoadedStateImplCopyWithImpl<_$SettingsLoadedStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<SettingsData> settingsHelper) loaded,
    required TResult Function(String failureMsg) error,
  }) {
    return loaded(settingsHelper);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<SettingsData> settingsHelper)? loaded,
    TResult? Function(String failureMsg)? error,
  }) {
    return loaded?.call(settingsHelper);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<SettingsData> settingsHelper)? loaded,
    TResult Function(String failureMsg)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(settingsHelper);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SettingsLoadingState value) loading,
    required TResult Function(SettingsLoadedState value) loaded,
    required TResult Function(SettingsErrorState value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SettingsLoadingState value)? loading,
    TResult? Function(SettingsLoadedState value)? loaded,
    TResult? Function(SettingsErrorState value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SettingsLoadingState value)? loading,
    TResult Function(SettingsLoadedState value)? loaded,
    TResult Function(SettingsErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class SettingsLoadedState implements SettingsState {
  const factory SettingsLoadedState(
          {required final List<SettingsData> settingsHelper}) =
      _$SettingsLoadedStateImpl;

  List<SettingsData> get settingsHelper;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SettingsLoadedStateImplCopyWith<_$SettingsLoadedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SettingsErrorStateImplCopyWith<$Res> {
  factory _$$SettingsErrorStateImplCopyWith(_$SettingsErrorStateImpl value,
          $Res Function(_$SettingsErrorStateImpl) then) =
      __$$SettingsErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String failureMsg});
}

/// @nodoc
class __$$SettingsErrorStateImplCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$SettingsErrorStateImpl>
    implements _$$SettingsErrorStateImplCopyWith<$Res> {
  __$$SettingsErrorStateImplCopyWithImpl(_$SettingsErrorStateImpl _value,
      $Res Function(_$SettingsErrorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failureMsg = null,
  }) {
    return _then(_$SettingsErrorStateImpl(
      failureMsg: null == failureMsg
          ? _value.failureMsg
          : failureMsg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SettingsErrorStateImpl implements SettingsErrorState {
  const _$SettingsErrorStateImpl({required this.failureMsg});

  @override
  final String failureMsg;

  @override
  String toString() {
    return 'SettingsState.error(failureMsg: $failureMsg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsErrorStateImpl &&
            (identical(other.failureMsg, failureMsg) ||
                other.failureMsg == failureMsg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failureMsg);

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsErrorStateImplCopyWith<_$SettingsErrorStateImpl> get copyWith =>
      __$$SettingsErrorStateImplCopyWithImpl<_$SettingsErrorStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<SettingsData> settingsHelper) loaded,
    required TResult Function(String failureMsg) error,
  }) {
    return error(failureMsg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<SettingsData> settingsHelper)? loaded,
    TResult? Function(String failureMsg)? error,
  }) {
    return error?.call(failureMsg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<SettingsData> settingsHelper)? loaded,
    TResult Function(String failureMsg)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(failureMsg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SettingsLoadingState value) loading,
    required TResult Function(SettingsLoadedState value) loaded,
    required TResult Function(SettingsErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SettingsLoadingState value)? loading,
    TResult? Function(SettingsLoadedState value)? loaded,
    TResult? Function(SettingsErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SettingsLoadingState value)? loading,
    TResult Function(SettingsLoadedState value)? loaded,
    TResult Function(SettingsErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SettingsErrorState implements SettingsState {
  const factory SettingsErrorState({required final String failureMsg}) =
      _$SettingsErrorStateImpl;

  String get failureMsg;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SettingsErrorStateImplCopyWith<_$SettingsErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
