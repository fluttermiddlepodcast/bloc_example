import 'dart:async';

import 'package:bloc_example/domain/profile/bloc/profile_bloc_event.dart';
import 'package:bloc_example/domain/profile/bloc/profile_bloc_state.dart';
import 'package:bloc_example/domain/profile/model/profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileBlocEvent, ProfileBlocState> {
  ProfileBloc() : super(ProfileBlocStateLoading()) {
    on<ProfileBlocEventFetch>(_onFetch);
    on<ProfileBlocEventLogIn>(_onLogIn);
    on<ProfileBlocEventLogOut>(_onLogOut);

    add(
      ProfileBlocEventFetch(
        isLogIn: true,
      ),
    );

    const timerDuration = Duration(
      hours: 2,
    );
    timer = Timer.periodic(
      timerDuration,
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
}
