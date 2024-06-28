import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../core.dart';

class GoogleLoginVM extends BaseVM {
  // Future<ApiResponse> googleLogin() async {
  //   final GoogleSignIn googleSignIn = GoogleSignIn();
  //   final GoogleSignInAccount? account = await googleSignIn.signIn();
  //   final GoogleSignInAuthentication authentication = account!.authentication;
  //
  //   if (authentication != null) {
  //     final String accessToken = authentication.accessToken!;
  //     // Proceed with sending the token to your backend
  //   } else {
  //     print("Error: Authentication object is null");
  //     // Handle the case where authentication fails
  //     return ApiResponse(success: false, message: "Authentication failed");
  //   }
  //
  //   try {
  //     final GoogleSignInAccount? account = await googleSignIn.signIn();
  //     if (account != null) {
  //       final OAuthCredential credential = GoogleAuthProvider.credential(
  //         accessToken: account.,
  //       );
  //
  //       try {
  //         final UserCredential userCredential =
  //         await FirebaseAuth.instance.signInWithCredential(credential);
  //
  //         final User user = userCredential.user!;
  //         final String name = user.displayName ?? '';
  //         final String email = user.email ?? '';
  //
  //         return makeRequest(
  //           method: DioHttpMethod.POST,
  //           endpoint: '/auth/google',
  //           data: {
  //             'name': name,
  //             'email': email,
  //             'token': access
  //             // Additional user data as needed
  //           },
  //           onSuccess: (data) {
  //             return ApiResponse(success: true, data: data);
  //           },
  //         );
  //       } on FirebaseAuthException catch (error) {
  //         print("Error signing in with Firebase: $error");
  //         return ApiResponse(success: false, message: error.toString());
  //       }
  //     }
  //   } on Exception catch (error) {
  //     print("Error signing in with Google: $error");
  //     return ApiResponse(success: false, message: error.toString());
  //   }
  //   return ApiResponse(success: false, message: "Sign-in failed");
  // }

  Future<ApiResponse> googleLogin() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(clientId: dotenv.env['GOOGLE_WEB_CLIENT_ID']);

    try {
      final GoogleSignInAccount? account = await googleSignIn.signIn();
      if (account != null) {
        final GoogleSignInAuthentication authentication =
            account.authentication as GoogleSignInAuthentication;

        final String accessToken = authentication.accessToken!;

        return makeRequest(
          method: DioHttpMethod.POST,
          endpoint: '/auth/google',
          data: {
            'token': accessToken,
          },
          onSuccess: (data) {
            log('Success $data');
            return ApiResponse(success: true, data: data);
          },
        );
      }
    } on Exception catch (error) {
      log("Error signing in with Google: $error");
      return ApiResponse(success: false, message: error.toString());
    }
    return ApiResponse(success: false, message: "Sign-in failed");
  }

  @override
  void dispose() {
    printty("SignUpVM disposed");
    super.dispose();
  }
}
