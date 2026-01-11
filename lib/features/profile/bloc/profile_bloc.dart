import 'dart:async';

import 'package:bloc_example/features/profile/bloc/profile_bloc_event.dart';
import 'package:bloc_example/features/profile/bloc/profile_bloc_state.dart';
import 'package:bloc_example/features/profile/model/profile.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ProfileBloc extends HydratedBloc<ProfileBlocEvent, ProfileBlocState> {
  ProfileBloc() : super(ProfileBlocStateLoading()) {
    on<ProfileBlocEventFetch>(_onFetch);
    on<ProfileBlocEventLogIn>(_onLogIn);
    on<ProfileBlocEventLogOut>(_onLogOut);

    if (state is ProfileBlocStateLoading) {
      add(
        ProfileBlocEventFetch(
          isLogIn: true,
        ),
      );
    }

    timer = Timer.periodic(
      const Duration(hours: 2),
      (_) {
        if (state is ProfileBlocStateLoaded) {
          if ((state as ProfileBlocStateLoaded).isLoggedIn) {
            add(ProfileBlocEventLogOut());
          } else {
            add(ProfileBlocEventLogIn());
          }
        }
      },
    );
  }

  Timer? timer;

  Future<void> _onFetch(
    ProfileBlocEventFetch event,
    Emitter<ProfileBlocState> emit,
  ) async {
    if (const bool.fromEnvironment('ERROR_WHILE_PROFILE_FETCH')) {
      emit(
        ProfileBlocStateError(
          error: 'Something went wrong. Try again later',
        ),
      );
    } else {
      emit(
        ProfileBlocStateLoaded(
          isLoggedIn: event.isLogIn,
          profile: Profile(
            firstName: 'Carlo',
            lastName: 'Rivetti',
          ),
        ),
      );
    }
  }

  Future<void> _onLogIn(
    ProfileBlocEventLogIn event,
    Emitter<ProfileBlocState> emit,
  ) async {
    emit(ProfileBlocStateLoading());

    add(
      ProfileBlocEventFetch(
        isLogIn: true,
      ),
    );
  }

  Future<void> _onLogOut(
    ProfileBlocEventLogOut event,
    Emitter<ProfileBlocState> emit,
  ) async {
    emit(ProfileBlocStateLoading());

    add(
      ProfileBlocEventFetch(
        isLogIn: false,
      ),
    );
  }

  @override
  Future<void> close() {
    timer?.cancel();

    return super.close();
  }

  @override
  ProfileBlocState? fromJson(Map<String, dynamic> json) {
    if (json.containsKey('profile')) {
      return ProfileBlocStateLoaded(
        profile: Profile.fromJson(json['profile']),
        isLoggedIn: json['isLoggedIn'] ?? true,
      );
    }

    return null;
  }

  @override
  Map<String, dynamic>? toJson(ProfileBlocState state) {
    if (state is ProfileBlocStateLoaded) {
      return {
        'profile': state.profile.toJson(),
        'isLoggedIn': state.isLoggedIn,
      };
    }

    return null;
  }
}
