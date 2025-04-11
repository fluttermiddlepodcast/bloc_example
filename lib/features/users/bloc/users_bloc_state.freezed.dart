// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UsersBlocState {
  List<User> get users;
  bool get canLoadMore;
  int get page;
  UsersBlocStatus get status;
  String? get error;

  /// Create a copy of UsersBlocState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UsersBlocStateCopyWith<UsersBlocState> get copyWith =>
      _$UsersBlocStateCopyWithImpl<UsersBlocState>(this as UsersBlocState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UsersBlocState &&
            const DeepCollectionEquality().equals(other.users, users) &&
            (identical(other.canLoadMore, canLoadMore) || other.canLoadMore == canLoadMore) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(users), canLoadMore, page, status, error);

  @override
  String toString() {
    return 'UsersBlocState(users: $users, canLoadMore: $canLoadMore, page: $page, status: $status, error: $error)';
  }
}

/// @nodoc
abstract mixin class $UsersBlocStateCopyWith<$Res> {
  factory $UsersBlocStateCopyWith(UsersBlocState value, $Res Function(UsersBlocState) _then) =
      _$UsersBlocStateCopyWithImpl;
  @useResult
  $Res call({List<User> users, bool canLoadMore, int page, UsersBlocStatus status, String? error});
}

/// @nodoc
class _$UsersBlocStateCopyWithImpl<$Res> implements $UsersBlocStateCopyWith<$Res> {
  _$UsersBlocStateCopyWithImpl(this._self, this._then);

  final UsersBlocState _self;
  final $Res Function(UsersBlocState) _then;

  /// Create a copy of UsersBlocState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
    Object? canLoadMore = null,
    Object? page = null,
    Object? status = null,
    Object? error = freezed,
  }) {
    return _then(_self.copyWith(
      users: null == users
          ? _self.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>,
      canLoadMore: null == canLoadMore
          ? _self.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as UsersBlocStatus,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _UsersBlocState implements UsersBlocState {
  const _UsersBlocState(
      {final List<User> users = const [],
      this.canLoadMore = true,
      this.page = 0,
      this.status = UsersBlocStatus.loading,
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
  final bool canLoadMore;
  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final UsersBlocStatus status;
  @override
  final String? error;

  /// Create a copy of UsersBlocState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UsersBlocStateCopyWith<_UsersBlocState> get copyWith =>
      __$UsersBlocStateCopyWithImpl<_UsersBlocState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UsersBlocState &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            (identical(other.canLoadMore, canLoadMore) || other.canLoadMore == canLoadMore) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_users), canLoadMore, page, status, error);

  @override
  String toString() {
    return 'UsersBlocState(users: $users, canLoadMore: $canLoadMore, page: $page, status: $status, error: $error)';
  }
}

/// @nodoc
abstract mixin class _$UsersBlocStateCopyWith<$Res> implements $UsersBlocStateCopyWith<$Res> {
  factory _$UsersBlocStateCopyWith(_UsersBlocState value, $Res Function(_UsersBlocState) _then) =
      __$UsersBlocStateCopyWithImpl;
  @override
  @useResult
  $Res call({List<User> users, bool canLoadMore, int page, UsersBlocStatus status, String? error});
}

/// @nodoc
class __$UsersBlocStateCopyWithImpl<$Res> implements _$UsersBlocStateCopyWith<$Res> {
  __$UsersBlocStateCopyWithImpl(this._self, this._then);

  final _UsersBlocState _self;
  final $Res Function(_UsersBlocState) _then;

  /// Create a copy of UsersBlocState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? users = null,
    Object? canLoadMore = null,
    Object? page = null,
    Object? status = null,
    Object? error = freezed,
  }) {
    return _then(_UsersBlocState(
      users: null == users
          ? _self._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>,
      canLoadMore: null == canLoadMore
          ? _self.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as UsersBlocStatus,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
