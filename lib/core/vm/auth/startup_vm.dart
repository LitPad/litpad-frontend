import 'package:litpad/core/vm/base_vm.dart';

import '../../../ui/components/components.dart';
import '../../service/auth_service.dart';

class StartupVM extends BaseVM {
  final AuthService _authService = AuthService();

  Future<bool> checkAuthentication() async {
    final isAuthenticated = await _authService.isAuthenticated();
    debugPrint('Auth state : $isAuthenticated');
    return isAuthenticated;
  }
}