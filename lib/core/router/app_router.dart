import 'package:go_router/go_router.dart';
import 'package:litpad/ui/screens/screens.dart';

class RoutePath {
  static const String homeScreen = 'homeScreen';
  static const String aboutScreen = 'aboutScreen';
  static const String authorsDetailScreen = 'authorsDetailScreen';
  static const String bookDetailsScreen = 'bookDetailsScreen';
  static const String browsingingScreen = 'browsingingScreen';
  static const String latestBooksScreen = 'latestBooksScreen';
}

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      name: RoutePath.homeScreen,
      path: "/",
      builder: (context, state) => const HomeScreen(),
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
