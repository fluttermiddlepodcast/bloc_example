import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';

class HydratedStorageMock extends Mock implements Storage {}

Future<void> setupHydratedStorageMock() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  final hydratedStorage = HydratedStorageMock();

  when(
    () => hydratedStorage.write(
      any(),
      any<dynamic>(),
    ),
  ).thenAnswer((_) async {});

  HydratedBloc.storage = hydratedStorage;
}
