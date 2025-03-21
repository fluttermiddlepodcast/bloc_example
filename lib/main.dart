import 'package:bloc_example/core/di/di.dart';
import 'package:bloc_example/features/home/home_page.dart';
import 'package:bloc_example/features/profile/bloc/profile_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory(
            (await getTemporaryDirectory()).path,
          ),
  );

  await initDI();

  runApp(const BLoCExampleApp());
}

class BLoCExampleApp extends StatelessWidget {
  const BLoCExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BLoC Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: BlocProvider<ProfileBloc>(
        create: (context) => ProfileBloc(),
        child: const HomePage(),
      ),
    );
  }
}
