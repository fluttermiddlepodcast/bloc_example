import 'package:bloc_example/core/di/app_scope.dart';
import 'package:bloc_example/features/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:yx_scope_flutter/yx_scope_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const BLoCExampleApp());
}

class BLoCExampleApp extends StatefulWidget {
  const BLoCExampleApp({super.key});

  @override
  State<BLoCExampleApp> createState() => _BLoCExampleAppState();
}

class _BLoCExampleAppState extends State<BLoCExampleApp> {
  final _appScopeHolder = AppScopeHolder();

  @override
  void initState() {
    super.initState();

    _appScopeHolder.create();
  }

  @override
  void dispose() {
    _appScopeHolder.drop();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScopeProvider(
      holder: _appScopeHolder,
      child: MaterialApp(
        title: 'BLoC Example',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
