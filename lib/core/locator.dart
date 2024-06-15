import 'package:litpad/core/core.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final allProviders = <SingleChildWidget>[
  //Site details
  ChangeNotifierProvider(create: (_) => GetSiteDetailsVM()),
  ChangeNotifierProvider(create: (_) => SiteHealthCheckVM()),

  //Auth providers
  ChangeNotifierProvider(create: (_) => BaseVM()),
  ChangeNotifierProvider(create: (_) => SignupVM()),
  ChangeNotifierProvider(create: (_) => LoginVM()),
  ChangeNotifierProvider(create: (_) => VerifyMailVM()),
  ChangeNotifierProvider(create: (_) => SetNewPasswordVM()),
  ChangeNotifierProvider(create: (_) => ResetPasswordVM()),
  ChangeNotifierProvider(create: (_) => FaceBookLoginVM()),
  ChangeNotifierProvider(create: (_) => GoogleLoginVM()),
  ChangeNotifierProvider(create: (_) => ResendVerificationMailVM()),
  ChangeNotifierProvider(create: (_) => StartupVM()),

  //Profile providers
  ChangeNotifierProvider(create: (_) => FollowAndUnfollowVM()),
  ChangeNotifierProvider(create: (_) => UpdatePasswordVM()),
  ChangeNotifierProvider(create: (_) => UpdateProfileVM()),
  ChangeNotifierProvider(create: (_) => AddSubscriberVM()),
  ChangeNotifierProvider(create: (_) => ViewUserProfileVM()),

  //Books providers
  ChangeNotifierProvider(create: (_) => ViewAvailableBooksGenreVM()),
  ChangeNotifierProvider(create: (_) => ViewAvailableBooksTagVM()),
  ChangeNotifierProvider(create: (_) => ViewLatestBookByAuthorVM()),
  ChangeNotifierProvider(create: (_) => ViewLatestBooksVM()),
  ChangeNotifierProvider(create: (_) => CreateABookVM()),
  ChangeNotifierProvider(create: (_) => AddChapterToBookVM()),
  ChangeNotifierProvider(create: (_) => BuyBooksVM()),
  ChangeNotifierProvider(create: (_) => DeleteBookVM()),
  ChangeNotifierProvider(create: (_) => DeleteChapterVM()),
  ChangeNotifierProvider(create: (_) => UpdateBookVM()),
  ChangeNotifierProvider(create: (_) => UpdateBookChapterVM()),
  ChangeNotifierProvider(create: (_) => ViewBoughtBooksVM()),
  ChangeNotifierProvider(create: (_) => ViewSingleBooksPartialChapterVM()),
  ChangeNotifierProvider(create: (_) => ViewSingleBooksVM()),
];
