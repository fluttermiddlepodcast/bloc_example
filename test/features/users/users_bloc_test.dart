import 'package:bloc_example/features/users/bloc/users_bloc.dart';
import 'package:bloc_example/features/users/bloc/users_bloc_event.dart';
import 'package:bloc_example/features/users/bloc/users_bloc_state.dart';
import 'package:bloc_example/features/users/model/user.dart';
import 'package:bloc_example/features/users/repository/users_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/hydrated_storage_mock.dart';

class MockUsersRepository extends Mock implements UsersRepository {}

void main() {
  group(
    'UsersBloc tests',
    () {
      late UsersRepository usersRepository;

      setUp(
        () {
          usersRepository = MockUsersRepository();

          when(
            () => usersRepository.fetchUsers(
              limit: 30,
              page: 0,
            ),
          ).thenAnswer(
            (_) => Future.value(
              (
                _testUsers,
                null,
              ),
            ),
          );

          when(
            () => usersRepository.fetchUsers(
              limit: 30,
              page: 1,
            ),
          ).thenAnswer(
            (_) => Future.value(
              (
                _testUsers,
                null,
              ),
            ),
          );

          when(
            () => usersRepository.fetchUsers(
              limit: 30,
              page: 2,
            ),
          ).thenAnswer(
            (_) => Future.value(
              (
                <User>[],
                null,
              ),
            ),
          );
        },
      );

      blocTest(
        'Initialization test',
        build: () => UsersBloc(
          usersRepository: usersRepository,
        ),
        setUp: () => setupHydratedStorageMock(),
        expect: () => [
          _defaultLoadedState,
        ],
      );

      blocTest(
        'Fetch more test (has more)',
        build: () => UsersBloc(
          usersRepository: usersRepository,
        ),
        setUp: () => setupHydratedStorageMock(),
        act: (bloc) => bloc.add(UsersBlocEventFetchMore()),
        skip: 1,
        expect: () => [
          UsersBlocStateLoaded(
            users: [
              ..._testUsers,
              ..._testUsers,
            ],
            canLoadMore: true,
            page: 2,
          ),
        ],
      );

      blocTest(
        'Fetch more test (no more)',
        build: () => UsersBloc(
          usersRepository: usersRepository,
        ),
        setUp: () => setupHydratedStorageMock(),
        act: (bloc) => bloc
          ..add(UsersBlocEventFetchMore())
          ..add(UsersBlocEventFetchMore()),
        skip: 2,
        expect: () => [
          UsersBlocStateLoaded(
            users: [
              ..._testUsers,
              ..._testUsers,
            ],
            canLoadMore: false,
            page: 3,
          ),
        ],
      );

      blocTest(
        'Refresh test',
        build: () => UsersBloc(
          usersRepository: usersRepository,
        ),
        setUp: () => setupHydratedStorageMock(),
        act: (bloc) => bloc.add(UsersBlocEventRefresh()),
        skip: 2,
        expect: () => [
          _defaultLoadedState,
        ],
      );
    },
  );
}

final _defaultLoadedState = UsersBlocStateLoaded(
  users: _testUsers,
  canLoadMore: true,
  page: 1,
);

final _testUsers = [
  _testUser(
    'John Lorenz',
    'Moser',
    'johnlorenzmoser@gmail.com',
  ),
  _testUser(
    'Anton Kolja',
    'Pehrs',
    'antonkoljapehrs@gmail.com',
  ),
  _testUser(
    'John Lorenz',
    'Moser',
    'johnlorenzmoser@gmail.com',
  ),
  _testUser(
    'Anton Kolja',
    'Pehrs',
    'antonkoljapehrs@gmail.com',
  ),
  _testUser(
    'John Lorenz',
    'Moser',
    'johnlorenzmoser@gmail.com',
  ),
  _testUser(
    'Anton Kolja',
    'Pehrs',
    'antonkoljapehrs@gmail.com',
  ),
  _testUser(
    'John Lorenz',
    'Moser',
    'johnlorenzmoser@gmail.com',
  ),
  _testUser(
    'Anton Kolja',
    'Pehrs',
    'antonkoljapehrs@gmail.com',
  ),
  _testUser(
    'John Lorenz',
    'Moser',
    'johnlorenzmoser@gmail.com',
  ),
  _testUser(
    'Anton Kolja',
    'Pehrs',
    'antonkoljapehrs@gmail.com',
  ),
  _testUser(
    'John Lorenz',
    'Moser',
    'johnlorenzmoser@gmail.com',
  ),
  _testUser(
    'Anton Kolja',
    'Pehrs',
    'antonkoljapehrs@gmail.com',
  ),
  _testUser(
    'John Lorenz',
    'Moser',
    'johnlorenzmoser@gmail.com',
  ),
  _testUser(
    'Anton Kolja',
    'Pehrs',
    'antonkoljapehrs@gmail.com',
  ),
  _testUser(
    'John Lorenz',
    'Moser',
    'johnlorenzmoser@gmail.com',
  ),
  _testUser(
    'Anton Kolja',
    'Pehrs',
    'antonkoljapehrs@gmail.com',
  ),
  _testUser(
    'John Lorenz',
    'Moser',
    'johnlorenzmoser@gmail.com',
  ),
  _testUser(
    'Anton Kolja',
    'Pehrs',
    'antonkoljapehrs@gmail.com',
  ),
  _testUser(
    'John Lorenz',
    'Moser',
    'johnlorenzmoser@gmail.com',
  ),
  _testUser(
    'Anton Kolja',
    'Pehrs',
    'antonkoljapehrs@gmail.com',
  ),
  _testUser(
    'John Lorenz',
    'Moser',
    'johnlorenzmoser@gmail.com',
  ),
  _testUser(
    'Anton Kolja',
    'Pehrs',
    'antonkoljapehrs@gmail.com',
  ),
  _testUser(
    'John Lorenz',
    'Moser',
    'johnlorenzmoser@gmail.com',
  ),
  _testUser(
    'Anton Kolja',
    'Pehrs',
    'antonkoljapehrs@gmail.com',
  ),
  _testUser(
    'John Lorenz',
    'Moser',
    'johnlorenzmoser@gmail.com',
  ),
  _testUser(
    'Anton Kolja',
    'Pehrs',
    'antonkoljapehrs@gmail.com',
  ),
  _testUser(
    'John Lorenz',
    'Moser',
    'johnlorenzmoser@gmail.com',
  ),
  _testUser(
    'Anton Kolja',
    'Pehrs',
    'antonkoljapehrs@gmail.com',
  ),
  _testUser(
    'John Lorenz',
    'Moser',
    'johnlorenzmoser@gmail.com',
  ),
  _testUser(
    'Anton Kolja',
    'Pehrs',
    'antonkoljapehrs@gmail.com',
  ),
];

User _testUser(
  String firstName,
  String lastName,
  String email,
) {
  return User(
    name: Name(
      title: '',
      first: firstName,
      last: lastName,
    ),
    email: email,
    picture: Picture(
      large: '',
      medium: '',
      thumbnail: '',
    ),
  );
}
