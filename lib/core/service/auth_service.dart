import 'package:litpad/core/service/api_service.dart';
import 'package:stacked/stacked.dart';
import '../../app/locator.dart';
import '../models/user.dart';

class AuthService extends BaseViewModel {
  final _apiCall = locator<ApiService>();
  User? _currentUser;
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;


  Future signUp() {
    final signUpResponse =
        _apiCall.call(method: HttpMethod.post, path: '', body: {});
    return signUpResponse;
  }

  Future signIn() {
    //Todo: Change response types to Map dynamic type
    final signInResponse =
        _apiCall.call(method: HttpMethod.post, path: '', body: {});
    if (signInResponse != null) {
      _isLoggedIn = true;
      notifyListeners();
    }
    return signInResponse;
  }

  Future signInWithGoogle() {
    final signInWithGoogleResponse =
        _apiCall.call(method: HttpMethod.post, path: '', body: {});
    return signInWithGoogleResponse;
  }

  Future signInWithFacebook() {
    final signInWithFacebookResponse =
        _apiCall.call(method: HttpMethod.post, path: '', body: {});
    return signInWithFacebookResponse;
  }
}
