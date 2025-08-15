import 'dart:async';

import 'package:bloc_example/features/profile/bloc/profile_state.dart';
import 'package:bloc_example/features/profile/model/profile.dart';
import 'package:yx_state/yx_state.dart';

class ProfileStateManager extends StateManager<ProfileState> {
  ProfileStateManager() : super(ProfileState()) {
    loadProfile(isLoggedIn: true);

    const timerDuration = Duration(
      hours: 2,
    );
    timer = Timer.periodic(
      timerDuration,
      (_) {
        if (!state.isLoading && state.error == null) {
          loadProfile(isLoggedIn: !state.isLoggedIn);
        }
      },
    );
  }

  Timer? timer;

  Future<void> loadProfile({bool isLoggedIn = false}) {
    return handle(
      (emit) async {
        emit(
          state.copyWith(
            profile: null,
            isLoggedIn: false,
            isLoading: true,
            error: null,
          ),
        );

        if (const bool.fromEnvironment('ERROR_WHILE_PROFILE_FETCH')) {
          emit(
            state.copyWith(
              isLoggedIn: false,
              isLoading: false,
              error: 'Something went wrong. Try again later',
            ),
          );
        } else {
          emit(
            state.copyWith(
              profile: Profile(
                firstName: 'Carlo',
                lastName: 'Rivetti',
              ),
              isLoggedIn: true,
              isLoading: false,
              error: null,
            ),
          );
        }
      },
    );
  }

  Future<void> logIn() => loadProfile(isLoggedIn: true);

  Future<void> logOut() => loadProfile(isLoggedIn: false);

  @override
  Future<void> close() {
    timer?.cancel();

    return super.close();
  }
}
