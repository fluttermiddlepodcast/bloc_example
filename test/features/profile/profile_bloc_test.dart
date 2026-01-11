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
          _defaultProfileBlocState,
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
          _defaultProfileBlocState,
        ],
      );

      blocTest<ProfileBloc, ProfileBlocState>(
        'LogIn test',
        build: () => ProfileBloc(),
        setUp: () => setupHydratedStorageMock(),
        act: (bloc) => bloc.add(ProfileBlocEventLogIn()),
        expect: () => [
          _defaultProfileBlocState,
          ProfileBlocStateLoading(),
          _defaultProfileBlocState,
        ],
      );

      blocTest<ProfileBloc, ProfileBlocState>(
        'LogOut test',
        build: () => ProfileBloc(),
        setUp: () => setupHydratedStorageMock(),
        act: (bloc) => bloc.add(ProfileBlocEventLogOut()),
        expect: () => [
          _defaultProfileBlocState,
          ProfileBlocStateLoading(),
          ProfileBlocStateLoaded(
            isLoggedIn: false,
            profile: _testProfile,
          ),
        ],
      );
    },
  );
}

final _defaultProfileBlocState = ProfileBlocStateLoaded(
  isLoggedIn: true,
  profile: _testProfile,
);

final _testProfile = Profile(
  firstName: 'Carlo',
  lastName: 'Rivetti',
);
