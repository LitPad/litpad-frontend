import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app/locator.dart';
import 'core/router/app_router.dart';

void main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  // final startupLogic = StartupLogic();
  // await startupLogic.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'LitPad',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: 'Inter',
        useMaterial3: true,
      ),
      routerConfig: appRouter,
    );
  }
}
