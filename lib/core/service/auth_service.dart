import 'package:litpad/core/service/api_service.dart';
import 'package:stacked/stacked.dart';

class AuthService extends BaseViewModel {
  final _apiCall = ApiService();
  Future signUp() {
    final signUpResponse =
        _apiCall.call(method: HttpMethod.post, path: '', body: {});
    return signUpResponse;
  }

  Future signIn() {
    final signInResponse =
        _apiCall.call(method: HttpMethod.post, path: '', body: {});
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
