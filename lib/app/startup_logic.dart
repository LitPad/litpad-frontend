import 'package:stacked/stacked.dart';

import '../core/service/auth_service.dart';
import 'locator.dart';

class StartupLogic extends BaseViewModel {
  final AuthService _authService = locator<AuthService>();
  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;

  Future<void> initialize() async {
    //Todo: Fetch user data or perform authentication checks
    final isLoggedIn = _authService.isLoggedIn;
    _isAuthenticated = isLoggedIn;
    notifyListeners();
    //Todo: Set authentication state
  }

  Future futureToRun() async {
    await initialize();
  }
}
