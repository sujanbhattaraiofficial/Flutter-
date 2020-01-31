import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui/flutter_firebase_ui.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleOk {
  // GoogleOk() {
  //   //default constructor;
  //   handleSignIn();
  
  // }

  Future<void> handleSignIn() async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    GoogleSignInAccount googleAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleAccount.authentication;
    AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken);
    AuthResult authResult =
        (await firebaseAuth.signInWithCredential(credential));
    FirebaseUser user = authResult.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await firebaseAuth.currentUser();
    assert(user.uid == currentUser.uid);
  }
}
