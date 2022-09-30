// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'todo_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TodoListState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Todo> todo) loaded,
    required TResult Function(String errorText) error,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Todo> todo)? loaded,
    TResult Function(String errorText)? error,
    TResult Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Todo> todo)? loaded,
    TResult Function(String errorText)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ListLoaded value) loaded,
    required TResult Function(_ListError value) error,
    required TResult Function(_ListLoading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ListLoaded value)? loaded,
    TResult Function(_ListError value)? error,
    TResult Function(_ListLoading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ListLoaded value)? loaded,
    TResult Function(_ListError value)? error,
    TResult Function(_ListLoading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoListStateCopyWith<$Res> {
  factory $TodoListStateCopyWith(
          TodoListState value, $Res Function(TodoListState) then) =
      _$TodoListStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$TodoListStateCopyWithImpl<$Res>
    implements $TodoListStateCopyWith<$Res> {
  _$TodoListStateCopyWithImpl(this._value, this._then);

  final TodoListState _value;
  // ignore: unused_field
  final $Res Function(TodoListState) _then;
}

/// @nodoc
abstract class _$$_ListLoadedCopyWith<$Res> {
  factory _$$_ListLoadedCopyWith(
          _$_ListLoaded value, $Res Function(_$_ListLoaded) then) =
      __$$_ListLoadedCopyWithImpl<$Res>;
  $Res call({List<Todo> todo});
}

/// @nodoc
class __$$_ListLoadedCopyWithImpl<$Res>
    extends _$TodoListStateCopyWithImpl<$Res>
    implements _$$_ListLoadedCopyWith<$Res> {
  __$$_ListLoadedCopyWithImpl(
      _$_ListLoaded _value, $Res Function(_$_ListLoaded) _then)
      : super(_value, (v) => _then(v as _$_ListLoaded));

  @override
  _$_ListLoaded get _value => super._value as _$_ListLoaded;

  @override
  $Res call({
    Object? todo = freezed,
  }) {
    return _then(_$_ListLoaded(
      todo == freezed
          ? _value._todo
          : todo // ignore: cast_nullable_to_non_nullable
              as List<Todo>,
    ));
  }
}

/// @nodoc

class _$_ListLoaded implements _ListLoaded {
  const _$_ListLoaded(final List<Todo> todo) : _todo = todo;

  final List<Todo> _todo;
  @override
  List<Todo> get todo {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todo);
  }

  @override
  String toString() {
    return 'TodoListState.loaded(todo: $todo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListLoaded &&
            const DeepCollectionEquality().equals(other._todo, _todo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_todo));

  @JsonKey(ignore: true)
  @override
  _$$_ListLoadedCopyWith<_$_ListLoaded> get copyWith =>
      __$$_ListLoadedCopyWithImpl<_$_ListLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Todo> todo) loaded,
    required TResult Function(String errorText) error,
    required TResult Function() loading,
  }) {
    return loaded(todo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Todo> todo)? loaded,
    TResult Function(String errorText)? error,
    TResult Function()? loading,
  }) {
    return loaded?.call(todo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Todo> todo)? loaded,
    TResult Function(String errorText)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(todo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ListLoaded value) loaded,
    required TResult Function(_ListError value) error,
    required TResult Function(_ListLoading value) loading,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ListLoaded value)? loaded,
    TResult Function(_ListError value)? error,
    TResult Function(_ListLoading value)? loading,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ListLoaded value)? loaded,
    TResult Function(_ListError value)? error,
    TResult Function(_ListLoading value)? loading,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _ListLoaded implements TodoListState {
  const factory _ListLoaded(final List<Todo> todo) = _$_ListLoaded;

  List<Todo> get todo;
  @JsonKey(ignore: true)
  _$$_ListLoadedCopyWith<_$_ListLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ListErrorCopyWith<$Res> {
  factory _$$_ListErrorCopyWith(
          _$_ListError value, $Res Function(_$_ListError) then) =
      __$$_ListErrorCopyWithImpl<$Res>;
  $Res call({String errorText});
}

/// @nodoc
class __$$_ListErrorCopyWithImpl<$Res> extends _$TodoListStateCopyWithImpl<$Res>
    implements _$$_ListErrorCopyWith<$Res> {
  __$$_ListErrorCopyWithImpl(
      _$_ListError _value, $Res Function(_$_ListError) _then)
      : super(_value, (v) => _then(v as _$_ListError));

  @override
  _$_ListError get _value => super._value as _$_ListError;

  @override
  $Res call({
    Object? errorText = freezed,
  }) {
    return _then(_$_ListError(
      errorText == freezed
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ListError implements _ListError {
  const _$_ListError(this.errorText);

  @override
  final String errorText;

  @override
  String toString() {
    return 'TodoListState.error(errorText: $errorText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListError &&
            const DeepCollectionEquality().equals(other.errorText, errorText));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(errorText));

  @JsonKey(ignore: true)
  @override
  _$$_ListErrorCopyWith<_$_ListError> get copyWith =>
      __$$_ListErrorCopyWithImpl<_$_ListError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Todo> todo) loaded,
    required TResult Function(String errorText) error,
    required TResult Function() loading,
  }) {
    return error(errorText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Todo> todo)? loaded,
    TResult Function(String errorText)? error,
    TResult Function()? loading,
  }) {
    return error?.call(errorText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Todo> todo)? loaded,
    TResult Function(String errorText)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(errorText);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ListLoaded value) loaded,
    required TResult Function(_ListError value) error,
    required TResult Function(_ListLoading value) loading,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ListLoaded value)? loaded,
    TResult Function(_ListError value)? error,
    TResult Function(_ListLoading value)? loading,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ListLoaded value)? loaded,
    TResult Function(_ListError value)? error,
    TResult Function(_ListLoading value)? loading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ListError implements TodoListState {
  const factory _ListError(final String errorText) = _$_ListError;

  String get errorText;
  @JsonKey(ignore: true)
  _$$_ListErrorCopyWith<_$_ListError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ListLoadingCopyWith<$Res> {
  factory _$$_ListLoadingCopyWith(
          _$_ListLoading value, $Res Function(_$_ListLoading) then) =
      __$$_ListLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ListLoadingCopyWithImpl<$Res>
    extends _$TodoListStateCopyWithImpl<$Res>
    implements _$$_ListLoadingCopyWith<$Res> {
  __$$_ListLoadingCopyWithImpl(
      _$_ListLoading _value, $Res Function(_$_ListLoading) _then)
      : super(_value, (v) => _then(v as _$_ListLoading));

  @override
  _$_ListLoading get _value => super._value as _$_ListLoading;
}

/// @nodoc

class _$_ListLoading implements _ListLoading {
  const _$_ListLoading();

  @override
  String toString() {
    return 'TodoListState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ListLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Todo> todo) loaded,
    required TResult Function(String errorText) error,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Todo> todo)? loaded,
    TResult Function(String errorText)? error,
    TResult Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Todo> todo)? loaded,
    TResult Function(String errorText)? error,
    TResult Function()? loading,
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
    required TResult Function(_ListLoaded value) loaded,
    required TResult Function(_ListError value) error,
    required TResult Function(_ListLoading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ListLoaded value)? loaded,
    TResult Function(_ListError value)? error,
    TResult Function(_ListLoading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ListLoaded value)? loaded,
    TResult Function(_ListError value)? error,
    TResult Function(_ListLoading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _ListLoading implements TodoListState {
  const factory _ListLoading() = _$_ListLoading;
}

/// @nodoc
mixin _$TodoState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noError,
    required TResult Function(String errorText) error,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? noError,
    TResult Function(String errorText)? error,
    TResult Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noError,
    TResult Function(String errorText)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoError value) noError,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NoError value)? noError,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoError value)? noError,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoStateCopyWith<$Res> {
  factory $TodoStateCopyWith(TodoState value, $Res Function(TodoState) then) =
      _$TodoStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$TodoStateCopyWithImpl<$Res> implements $TodoStateCopyWith<$Res> {
  _$TodoStateCopyWithImpl(this._value, this._then);

  final TodoState _value;
  // ignore: unused_field
  final $Res Function(TodoState) _then;
}

/// @nodoc
abstract class _$$_NoErrorCopyWith<$Res> {
  factory _$$_NoErrorCopyWith(
          _$_NoError value, $Res Function(_$_NoError) then) =
      __$$_NoErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_NoErrorCopyWithImpl<$Res> extends _$TodoStateCopyWithImpl<$Res>
    implements _$$_NoErrorCopyWith<$Res> {
  __$$_NoErrorCopyWithImpl(_$_NoError _value, $Res Function(_$_NoError) _then)
      : super(_value, (v) => _then(v as _$_NoError));

  @override
  _$_NoError get _value => super._value as _$_NoError;
}

/// @nodoc

class _$_NoError implements _NoError {
  const _$_NoError();

  @override
  String toString() {
    return 'TodoState.noError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_NoError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noError,
    required TResult Function(String errorText) error,
    required TResult Function() loading,
  }) {
    return noError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? noError,
    TResult Function(String errorText)? error,
    TResult Function()? loading,
  }) {
    return noError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noError,
    TResult Function(String errorText)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (noError != null) {
      return noError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoError value) noError,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
  }) {
    return noError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NoError value)? noError,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
  }) {
    return noError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoError value)? noError,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (noError != null) {
      return noError(this);
    }
    return orElse();
  }
}

abstract class _NoError implements TodoState {
  const factory _NoError() = _$_NoError;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  $Res call({String errorText});
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res> extends _$TodoStateCopyWithImpl<$Res>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, (v) => _then(v as _$_Error));

  @override
  _$_Error get _value => super._value as _$_Error;

  @override
  $Res call({
    Object? errorText = freezed,
  }) {
    return _then(_$_Error(
      errorText == freezed
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error(this.errorText);

  @override
  final String errorText;

  @override
  String toString() {
    return 'TodoState.error(errorText: $errorText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error &&
            const DeepCollectionEquality().equals(other.errorText, errorText));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(errorText));

  @JsonKey(ignore: true)
  @override
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noError,
    required TResult Function(String errorText) error,
    required TResult Function() loading,
  }) {
    return error(errorText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? noError,
    TResult Function(String errorText)? error,
    TResult Function()? loading,
  }) {
    return error?.call(errorText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noError,
    TResult Function(String errorText)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(errorText);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoError value) noError,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NoError value)? noError,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoError value)? noError,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements TodoState {
  const factory _Error(final String errorText) = _$_Error;

  String get errorText;
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res> extends _$TodoStateCopyWithImpl<$Res>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, (v) => _then(v as _$_Loading));

  @override
  _$_Loading get _value => super._value as _$_Loading;
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'TodoState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noError,
    required TResult Function(String errorText) error,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? noError,
    TResult Function(String errorText)? error,
    TResult Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noError,
    TResult Function(String errorText)? error,
    TResult Function()? loading,
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
    required TResult Function(_NoError value) noError,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NoError value)? noError,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoError value)? noError,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements TodoState {
  const factory _Loading() = _$_Loading;
}
