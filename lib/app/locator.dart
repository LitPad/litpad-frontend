import 'package:get_it/get_it.dart';
import 'package:litpad/core/service/api_service.dart';
import 'package:litpad/core/service/auth_service.dart';

import '../core/vm/auth/login_vm.dart';
import '../core/vm/auth/signup_vm.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton(ApiService());
  locator.registerLazySingleton<AuthService>(() => AuthService());
  locator.registerLazySingleton<SignUpVM>(() => SignUpVM());
  locator.registerLazySingleton<LoginVM>(() => LoginVM());
}
