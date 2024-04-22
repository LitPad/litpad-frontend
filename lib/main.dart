import 'package:flutter/material.dart';
import 'package:litpad/app/startup_logic.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app/locator.dart';
import 'core/router/app_router.dart';

void main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  final startupLogic = StartupLogic();
  await startupLogic.initialize();
  runApp(MyApp(startupLogic: startupLogic));}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required StartupLogic startupLogic});

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
