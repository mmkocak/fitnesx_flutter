import 'dart:developer';

import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

Future<UserCredential> signInWithFacebook() async {
  // Trigger the sign-in flow
  final LoginResult loginResult = await FacebookAuth.instance.login();
  log(loginResult.accessToken!.tokenString.toString());
  log(loginResult.message.toString());
  // Create a credential from the access token
  final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
    log(loginResult.accessToken!.tokenString.toString());
  log(loginResult.message.toString());
  // Once signed in, return the UserCredential
  return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
}