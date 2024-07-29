import 'package:bloc_example/core/di/di.dart';
import 'package:bloc_example/domain/profile/bloc/profile_bloc.dart';
import 'package:bloc_example/presentation/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await initDI();

  runApp(const BLoCExampleApp());
}

class BLoCExampleApp extends StatelessWidget {
  const BLoCExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BLoC example',
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
