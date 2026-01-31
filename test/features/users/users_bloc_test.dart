import 'package:bloc_example/features/users/bloc/users_bloc.dart';
import 'package:bloc_example/features/users/bloc/users_bloc_event.dart';
import 'package:bloc_example/features/users/bloc/users_bloc_state.dart';
import 'package:bloc_example/features/users/model/user.dart';
import 'package:bloc_example/features/users/repository/users_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mocks/hydrated_storage_mock.dart';

class FakeUsersRepository extends Fake implements UsersRepository {
  final List<User> _allUsers;

  FakeUsersRepository(this._allUsers);

  @override
  Future<(List<User>?, String?)> fetchUsers({
    int limit = 30,
    int page = 0,
  }) async {
    final start = page * limit;
    final end = start + limit;

    if (start >= _allUsers.length) {
      return (<User>[], null);
    }

    final pageUsers = _allUsers.sublist(
      start,
      end.clamp(0, _allUsers.length),
    );

    return (pageUsers, null);
  }
}

void main() {
  group(
    'UsersBloc tests',
    () {
      late UsersRepository usersRepository;

      setUp(
        () {
          usersRepository = FakeUsersRepository(
            [
              ..._testUsers,
              ..._testUsers,
            ],
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
