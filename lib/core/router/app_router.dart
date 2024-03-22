import 'package:go_router/go_router.dart';
import 'package:litpad/ui/screens/screens.dart';

class RoutePath {
  static const String homeScreen = 'homeScreen';
  static const String aboutScreen = 'aboutScreen';
  static const String authorsDetailScreen = 'authorsDetailScreen';
  static const String bookDetailsScreen = 'bookDetailsScreen';
  static const String browsingingScreen = 'browsingingScreen';
  static const String latestBooksScreen = 'latestBooksScreen';

  static const String signupScreen = 'signupScreen';
  static const String loginScreen = 'loginScreen';
  static const String authCheckMail = 'authCheckMail';
  static const String profileScreen = 'profileScreen';
  static const String userScreen = 'userScreen';
}

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      name: RoutePath.homeScreen,
      path: "/",
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      name: RoutePath.loginScreen,
      path: "/login",
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: RoutePath.signupScreen,
      path: "/signup",
      builder: (context, state) => const SignupScreen(),
    ),
    GoRoute(
      name: RoutePath.authCheckMail,
      path: "/auth-check-mail",
      builder: (context, state) => const AuthCheckMail(),
    ),
    GoRoute(
      name: RoutePath.aboutScreen,
      path: "/about-us",
      builder: (context, state) => const AboutScreen(),
    ),
    GoRoute(
      name: RoutePath.authorsDetailScreen,
      path: "/authors/:id",
      builder: (context, state) => const AuthorsDetails(),
    ),
    GoRoute(
      name: RoutePath.profileScreen,
      path: "/my-account/:id",
      builder: (context, state) => const MyProfileScreen(),
    ),
    GoRoute(
      name: RoutePath.browsingingScreen,
      path: "/books",
      builder: (context, state) => const BrowsingScreen(),
      routes: [
        GoRoute(
          name: RoutePath.bookDetailsScreen,
          path: "details/:id",
          builder: (context, state) => const BookDetailsScreen(),
        ),
        GoRoute(
          name: RoutePath.latestBooksScreen,
          path: "latest",
          builder: (context, state) => const LatestBooksScreen(),
        )
      ],
    ),
  ],
);
