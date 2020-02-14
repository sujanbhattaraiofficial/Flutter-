import 'package:firebase_auth/firebase_auth.dart';

class CurrentUserInfo {
  static Future<FirebaseUser> fetchUserData() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return user;
  }
}
