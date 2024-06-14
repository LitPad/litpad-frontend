import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

import 'core/locator.dart';
import 'core/router/app_router.dart';
import 'core/vm/auth/startup_vm.dart';

void main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "dotenv");
  if (kIsWeb) {
    await FacebookAuth.i.webAndDesktopInitialize(
      appId: dotenv.env['APP_ID']!,
      cookie: true,
      xfbml: true,
      version: "v15.0",
    );
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: allProviders,
      child: MaterialApp.router(
        title: 'LitPad Fontend',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          fontFamily: 'Inter',
          useMaterial3: true,
        ),
        routerConfig: appRouter,
        builder: (context, child) => FutureBuilder(
          future: checkAuthentication(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return child!;
              // if (snapshot.hasData && snapshot.data == true) {
              //   return const HomeScreen(isAuthenticated: true);
              // } else {
              //   return const HomeScreen(isAuthenticated: false);
              // }
            }
            return const SpinKitFadingCircle(
              color: Colors.deepPurple,
              size: 50.0,
            );
          },
        ),
      ),
    );
  }

  Future<bool> checkAuthentication() async {
    final startupVM = StartupVM();
    return await startupVM.checkAuthentication();
  }
}
