import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:litpad/core/core.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "dotenv");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: allProviders,
      child: MaterialApp.router(
        title: 'LitPad',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          fontFamily: 'Inter',
          useMaterial3: true,
        ),
        routerConfig: appRouter,
        builder: (context, child) => FutureBuilder(
            future: Future.delayed(const Duration(seconds: 2)),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return child!;
              }
              return const CircularProgressIndicator();
              // return  const SpinKitFadingCircle(
              //   color: Colors.deepPurple,
              //   size: 50.0,
              // );
            }),
      ),
    );
  }
}
