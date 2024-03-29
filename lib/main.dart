import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_strategy/url_strategy.dart';

import 'core/router/app_router.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // Initialize the ScreenUtil
      designSize: const Size(1440, 1024),
      builder: (context, child) {
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
      },
    );
  }
}
