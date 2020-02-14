import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:school_management/Services/navigationServices.dart';
import 'package:school_management/locator.dart';

class GoogleOk {
  GoogleSignIn googleSignIn = new GoogleSignIn();
  final NavigationServices _navigationServices = sl<NavigationServices>();
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
    _navigationServices.navigateTo('/teacher');
  }

  Future<void> logOutGoogle() async {
    await FirebaseAuth.instance.signOut().then((value) {
      googleSignIn.signOut();

      _navigationServices.navigateTo('/loginBoard');
    });
  }
}
