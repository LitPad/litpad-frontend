import 'package:get_it/get_it.dart';
import 'package:litpad/core/service/api_service.dart';
import 'package:litpad/core/service/auth_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton(ApiService());
  locator.registerLazySingleton<AuthService>(() => AuthService());
}
