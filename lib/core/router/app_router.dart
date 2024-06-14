import 'package:go_router/go_router.dart';
import 'package:litpad/ui/screens/auth/create_username_screen.dart';
import 'package:litpad/ui/screens/auth/set_new_password/set_new_password.dart';
import 'package:litpad/ui/screens/auth/unverified_user.dart';
import 'package:litpad/ui/screens/auth/widgets/reset_password_message_screen.dart';
import 'package:litpad/ui/screens/author_centre/create_a_story/create_a_story.dart';
import 'package:litpad/ui/screens/landing_page/landing_page.dart';
import 'package:litpad/ui/screens/screens.dart';

import '../../ui/components/components.dart';
import '../../ui/screens/auth/forgot_password/forgot_password.dart';
import '../../ui/screens/auth/widgets/verify_mail_screen.dart';
import '../core.dart';

class RoutePath {
  static const String homeScreen = 'homeScreen';
  static const String landingPage = 'landingPage';
  static const String aboutScreen = 'aboutScreen';
  static const String authorsDetailScreen = 'authorsDetailScreen';
  static const String bookDetailsScreen = 'bookDetailsScreen';
  static const String browsingScreen = 'browsingScreen';
  static const String latestBooksScreen = 'latestBooksScreen';

  static const String writersBenefitScreen = 'writersBenefitScreen';

  static const String signupScreen = 'signupScreen';
  static const String loginScreen = 'loginScreen';
  static const String createUsername = 'createUsername';

  static const String authCheckMail = 'authCheckMail';
  static const String profileScreen = 'profileScreen';
  static const String userScreen = 'userScreen';

  static const String settingsScreen = 'settingsScreen';
  static const String topUpScreen = 'topupScreen';
  static const String authorCentreScreen = 'authorCentreScreen';
  static const String verifyMailScreen = 'verifyMailScreen';
  static const String forgotPasswordScreen = 'forgotPasswordScreen';
  static const String setNewPasswordScreen = 'setNewPasswordScreen';
  static const String resetPasswordMessageScreen = 'resetPasswordMessageScreen';
  static const String unverifiedUserScreen = 'unverifiedUserScreen';
  static const String createStoryScreen = 'createStoryScreen';
}

Future<bool> isAuthenticated() async {
  final startupVM = StartupVM();
  return await startupVM.checkAuthentication();
}

//Todo: Implement 404 screens
final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      name: RoutePath.landingPage,
      path: "/",
      builder: (context, state) => const LandingPage(),
      redirect: (context, state) async {
        debugPrint('In redirect ====>');
        final isAuth = await isAuthenticated();
        debugPrint('Redirect Auth State ====> $isAuth');
        if (!isAuth) {
          return '/';
        } else {
          return '/home';
        }
      },
    ),
    GoRoute(
      name: RoutePath.homeScreen,
      path: "/home",
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      name: RoutePath.writersBenefitScreen,
      path: "/writers-benefit",
      builder: (context, state) => const WritersBenefitScreen(),
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
      name: RoutePath.createUsername,
      path: "/create-username",
      builder: (context, state) => const CreateUsernameScreen(),
    ),
    GoRoute(
      name: RoutePath.authCheckMail,
      path: "/auth-check-mail",
      builder: (context, state) => const AuthCheckMailScreen(),
    ),
    GoRoute(
      name: RoutePath.forgotPasswordScreen,
      path: "/forgot-password",
      builder: (context, state) => const ForgotPasswordScreen(),
    ),
    GoRoute(
      name: RoutePath.resetPasswordMessageScreen,
      path: "/reset-password-mail",
      builder: (context, state) => const ResetPasswordMessageScreen(),
    ),
    GoRoute(
      name: RoutePath.setNewPasswordScreen,
      path: "/password-reset/:token",
      builder: (context, state) => const SetNewPasswordScreen(),
    ),
    GoRoute(
      name: RoutePath.aboutScreen,
      path: "/about-us",
      builder: (context, state) => const AboutScreen(),
    ),
    GoRoute(
      name: RoutePath.settingsScreen,
      path: "/settings",
      builder: (context, state) => const SettingScreen(),
    ),
    GoRoute(
      name: RoutePath.topUpScreen,
      path: "/topup",
      builder: (context, state) => const TopupScreen(),
    ),
    GoRoute(
        name: RoutePath.authorCentreScreen,
        path: "/author-centre",
        builder: (context, state) => const AuthorsCentreScreen(),
        routes: [
          GoRoute(
            name: RoutePath.createStoryScreen,
            path: "create-story",
            builder: (context, state) => const CreateStoryScreen(),
          ),
        ]),

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
        name: RoutePath.verifyMailScreen,
        path: "/verify-email/:token",
        builder: (context, state) {
          return VerifyMailScreen(token: state.pathParameters['token']);
        }),
    GoRoute(
      name: RoutePath.browsingScreen,
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
        ),
      ],
    ),
    GoRoute(
      name: RoutePath.unverifiedUserScreen,
      path: "/unverified-user",
      builder: (context, state) => const UnverifiedUser(),
    ),
    // GoRoute(
    //   name: RoutePath.browsingScreen,
    //   path: "/auth",
    //   builder: (context, state) => const BrowsingScreen(),
    //   routes: [
    //     GoRoute(
    //       name: RoutePath.bookDetailsScreen,
    //       path: "details/:id",
    //       builder: (context, state) => const BookDetailsScreen(),
    //     ),
    //     GoRoute(
    //       name: RoutePath.latestBooksScreen,
    //       path: "latest",
    //       builder: (context, state) => const LatestBooksScreen(),
    //     )
    //   ],
    // ),
  ],
);

//Todo: Screens to be placed in login guard
//Homscreen has
//Browse, Booklisting and writer's benefit
//Browse, Booklisting and writer's benefit , login & signup
