// // coverage:ignore-file
// // GENERATED CODE - DO NOT MODIFY BY HAND
// // ignore_for_file: type=lint
// // ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

// part of 'users_bloc_state.dart';

// // **************************************************************************
// // FreezedGenerator
// // **************************************************************************

// T _$identity<T>(T value) => value;

// final _privateConstructorUsedError = UnsupportedError(
//     'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

// /// @nodoc
// mixin _$UsersBlocState {
//   bool get isLoading => throw _privateConstructorUsedError;
//   String? get error => throw _privateConstructorUsedError;
//   List<User> get users => throw _privateConstructorUsedError;

//   @JsonKey(ignore: true)
//   $UsersBlocStateCopyWith<UsersBlocState> get copyWith =>
//       throw _privateConstructorUsedError;
// }

// /// @nodoc
// abstract class $UsersBlocStateCopyWith<$Res> {
//   factory $UsersBlocStateCopyWith(
//           UsersBlocState value, $Res Function(UsersBlocState) then) =
//       _$UsersBlocStateCopyWithImpl<$Res, UsersBlocState>;
//   @useResult
//   $Res call({bool isLoading, String? error, List<User> users});
// }

// /// @nodoc
// class _$UsersBlocStateCopyWithImpl<$Res, $Val extends UsersBlocState>
//     implements $UsersBlocStateCopyWith<$Res> {
//   _$UsersBlocStateCopyWithImpl(this._value, this._then);

//   // ignore: unused_field
//   final $Val _value;
//   // ignore: unused_field
//   final $Res Function($Val) _then;

//   @pragma('vm:prefer-inline')
//   @override
//   $Res call({
//     Object? isLoading = null,
//     Object? error = freezed,
//     Object? users = null,
//   }) {
//     return _then(_value.copyWith(
//       isLoading: null == isLoading
//           ? _value.isLoading
//           : isLoading // ignore: cast_nullable_to_non_nullable
//               as bool,
//       error: freezed == error
//           ? _value.error
//           : error // ignore: cast_nullable_to_non_nullable
//               as String?,
//       users: null == users
//           ? _value.users
//           : users // ignore: cast_nullable_to_non_nullable
//               as List<User>,
//     ) as $Val);
//   }
// }

// /// @nodoc
// abstract class _$$UsersBlocStateImplCopyWith<$Res>
//     implements $UsersBlocStateCopyWith<$Res> {
//   factory _$$UsersBlocStateImplCopyWith(_$UsersBlocStateImpl value,
//           $Res Function(_$UsersBlocStateImpl) then) =
//       __$$UsersBlocStateImplCopyWithImpl<$Res>;
//   @override
//   @useResult
//   $Res call({bool isLoading, String? error, List<User> users});
// }

// /// @nodoc
// class __$$UsersBlocStateImplCopyWithImpl<$Res>
//     extends _$UsersBlocStateCopyWithImpl<$Res, _$UsersBlocStateImpl>
//     implements _$$UsersBlocStateImplCopyWith<$Res> {
//   __$$UsersBlocStateImplCopyWithImpl(
//       _$UsersBlocStateImpl _value, $Res Function(_$UsersBlocStateImpl) _then)
//       : super(_value, _then);

//   @pragma('vm:prefer-inline')
//   @override
//   $Res call({
//     Object? isLoading = null,
//     Object? error = freezed,
//     Object? users = null,
//   }) {
//     return _then(_$UsersBlocStateImpl(
//       isLoading: null == isLoading
//           ? _value.isLoading
//           : isLoading // ignore: cast_nullable_to_non_nullable
//               as bool,
//       error: freezed == error
//           ? _value.error
//           : error // ignore: cast_nullable_to_non_nullable
//               as String?,
//       users: null == users
//           ? _value._users
//           : users // ignore: cast_nullable_to_non_nullable
//               as List<User>,
//     ));
//   }
// }

// /// @nodoc

// class _$UsersBlocStateImpl implements _UsersBlocState {
//   const _$UsersBlocStateImpl(
//       {this.isLoading = true,
//       this.error,
//       final List<User> users = const <User>[]})
//       : _users = users;

//   @override
//   @JsonKey()
//   final bool isLoading;
//   @override
//   final String? error;
//   final List<User> _users;
//   @override
//   @JsonKey()
//   List<User> get users {
//     if (_users is EqualUnmodifiableListView) return _users;
//     // ignore: implicit_dynamic_type
//     return EqualUnmodifiableListView(_users);
//   }

//   @override
//   String toString() {
//     return 'UsersBlocState(isLoading: $isLoading, error: $error, users: $users)';
//   }

//   @override
//   bool operator ==(Object other) {
//     return identical(this, other) ||
//         (other.runtimeType == runtimeType &&
//             other is _$UsersBlocStateImpl &&
//             (identical(other.isLoading, isLoading) ||
//                 other.isLoading == isLoading) &&
//             (identical(other.error, error) || other.error == error) &&
//             const DeepCollectionEquality().equals(other._users, _users));
//   }

//   @override
//   int get hashCode => Object.hash(runtimeType, isLoading, error,
//       const DeepCollectionEquality().hash(_users));

//   @JsonKey(ignore: true)
//   @override
//   @pragma('vm:prefer-inline')
//   _$$UsersBlocStateImplCopyWith<_$UsersBlocStateImpl> get copyWith =>
//       __$$UsersBlocStateImplCopyWithImpl<_$UsersBlocStateImpl>(
//           this, _$identity);
// }

// abstract class _UsersBlocState implements UsersBlocState {
//   const factory _UsersBlocState(
//       {final bool isLoading,
//       final String? error,
//       final List<User> users}) = _$UsersBlocStateImpl;

//   @override
//   bool get isLoading;
//   @override
//   String? get error;
//   @override
//   List<User> get users;
//   @override
//   @JsonKey(ignore: true)
//   _$$UsersBlocStateImplCopyWith<_$UsersBlocStateImpl> get copyWith =>
//       throw _privateConstructorUsedError;
// }
