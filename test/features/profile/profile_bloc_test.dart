import 'package:bloc_example/features/profile/bloc/profile_bloc.dart';
import 'package:bloc_example/features/profile/bloc/profile_bloc_event.dart';
import 'package:bloc_example/features/profile/bloc/profile_bloc_state.dart';
import 'package:bloc_example/features/profile/model/profile.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mocks/hydrated_storage_mock.dart';

void main() {
  group(
    'ProfileBloc tests',
    () {
      blocTest<ProfileBloc, ProfileBlocState>(
        'Initialization test',
        build: () => ProfileBloc(),
        setUp: () => setupHydratedStorageMock(),
        expect: () => [
          _loggedInProfileBlocState(),
        ],
      );

      blocTest<ProfileBloc, ProfileBlocState>(
        'Fetch test',
        build: () => ProfileBloc(),
        setUp: () => setupHydratedStorageMock(),
        act: (bloc) => bloc
          ..add(ProfileBlocEventLogIn())
          ..add(
            ProfileBlocEventFetch(
              isLogIn: true,
            ),
          ),
        skip: 2,
        expect: () => [
          _loggedInProfileBlocState(),
        ],
      );

      blocTest<ProfileBloc, ProfileBlocState>(
        'LogIn test',
        build: () => ProfileBloc(),
        setUp: () => setupHydratedStorageMock(),
        act: (bloc) => bloc.add(ProfileBlocEventLogIn()),
        expect: () => [
          _loggedInProfileBlocState(),
          ProfileBlocStateLoading(),
          _loggedInProfileBlocState(),
        ],
      );

      blocTest<ProfileBloc, ProfileBlocState>(
        'LogOut test',
        build: () => ProfileBloc(),
        setUp: () => setupHydratedStorageMock(),
        act: (bloc) => bloc.add(ProfileBlocEventLogOut()),
        expect: () => [
          _loggedInProfileBlocState(),
          ProfileBlocStateLoading(),
          ProfileBlocStateLoaded(
            isLoggedIn: false,
            profile: _testProfile(),
          ),
        ],
      );
    },
  );
}

ProfileBlocStateLoaded _loggedInProfileBlocState() {
  return ProfileBlocStateLoaded(
    isLoggedIn: true,
    profile: _testProfile(),
  );
}

Profile _testProfile() {
  return Profile(
    firstName: 'Carlo',
    lastName: 'Rivetti',
  );
}
