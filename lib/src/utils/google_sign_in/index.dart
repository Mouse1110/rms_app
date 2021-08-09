import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInApi {
  static final GoogleSignIn _googleSignIn = GoogleSignIn();

  static Future<GoogleSignInAccount> login() async {
    final user = await _googleSignIn.signIn();
    if (user == null) {
      return null;
    } else
      return user;
  }

  static Future signOut() async {
    await _googleSignIn.signOut();
  }
}
