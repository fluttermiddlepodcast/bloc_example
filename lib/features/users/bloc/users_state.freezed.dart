// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UsersState {
  List<User> get users;
  int get page;
  bool get canLoadMore;
  bool get isLoading;
  String? get error;

  /// Create a copy of UsersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UsersStateCopyWith<UsersState> get copyWith =>
      _$UsersStateCopyWithImpl<UsersState>(this as UsersState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UsersState &&
            const DeepCollectionEquality().equals(other.users, users) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.canLoadMore, canLoadMore) ||
                other.canLoadMore == canLoadMore) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(users),
      page,
      canLoadMore,
      isLoading,
      error);

  @override
  String toString() {
    return 'UsersState(users: $users, page: $page, canLoadMore: $canLoadMore, isLoading: $isLoading, error: $error)';
  }
}

/// @nodoc
abstract mixin class $UsersStateCopyWith<$Res> {
  factory $UsersStateCopyWith(
          UsersState value, $Res Function(UsersState) _then) =
      _$UsersStateCopyWithImpl;
  @useResult
  $Res call(
      {List<User> users,
      int page,
      bool canLoadMore,
      bool isLoading,
      String? error});
}

/// @nodoc
class _$UsersStateCopyWithImpl<$Res> implements $UsersStateCopyWith<$Res> {
  _$UsersStateCopyWithImpl(this._self, this._then);

  final UsersState _self;
  final $Res Function(UsersState) _then;

  /// Create a copy of UsersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
    Object? page = null,
    Object? canLoadMore = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_self.copyWith(
      users: null == users
          ? _self.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      canLoadMore: null == canLoadMore
          ? _self.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _UsersState implements UsersState {
  const _UsersState(
      {final List<User> users = const [],
      this.page = 0,
      this.canLoadMore = true,
      this.isLoading = true,
      this.error})
      : _users = users;

  final List<User> _users;
  @override
  @JsonKey()
  List<User> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final bool canLoadMore;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;

  /// Create a copy of UsersState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UsersStateCopyWith<_UsersState> get copyWith =>
      __$UsersStateCopyWithImpl<_UsersState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UsersState &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.canLoadMore, canLoadMore) ||
                other.canLoadMore == canLoadMore) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_users),
      page,
      canLoadMore,
      isLoading,
      error);

  @override
  String toString() {
    return 'UsersState(users: $users, page: $page, canLoadMore: $canLoadMore, isLoading: $isLoading, error: $error)';
  }
}

/// @nodoc
abstract mixin class _$UsersStateCopyWith<$Res>
    implements $UsersStateCopyWith<$Res> {
  factory _$UsersStateCopyWith(
          _UsersState value, $Res Function(_UsersState) _then) =
      __$UsersStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<User> users,
      int page,
      bool canLoadMore,
      bool isLoading,
      String? error});
}

/// @nodoc
class __$UsersStateCopyWithImpl<$Res> implements _$UsersStateCopyWith<$Res> {
  __$UsersStateCopyWithImpl(this._self, this._then);

  final _UsersState _self;
  final $Res Function(_UsersState) _then;

  /// Create a copy of UsersState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? users = null,
    Object? page = null,
    Object? canLoadMore = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_UsersState(
      users: null == users
          ? _self._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      canLoadMore: null == canLoadMore
          ? _self.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
