import 'package:bloc_example/features/profile/model/profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
sealed class ProfileState with _$ProfileState {
  const factory ProfileState({
    Profile? profile,
    @Default(false) bool isLoggedIn,
    @Default(true) bool isLoading,
    String? error,
  }) = _ProfileState;
}
