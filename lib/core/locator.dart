import 'package:litpad/core/core.dart';
import 'package:litpad/core/service/toast_service.dart';
import 'package:litpad/core/vm/auth/startup_vm.dart';
import 'package:litpad/core/vm/profile/profile.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';


final allProviders = <SingleChildWidget>[
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
  ChangeNotifierProvider(create: (_) => ToastService()),
  ChangeNotifierProvider(create: (_) => ViewUserProfileVM()),
];
