import 'package:litpad/core/core.dart';
import 'package:litpad/core/vm/auth/verify_email_vm.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final allProviders = <SingleChildWidget>[
  ChangeNotifierProvider(create: (_) => BaseVM()),
  ChangeNotifierProvider(create: (_) => SignupVM()),
  ChangeNotifierProvider(create: (_) => LoginVM()),
  ChangeNotifierProvider(create: (_) => VerifyMailVM()),
];