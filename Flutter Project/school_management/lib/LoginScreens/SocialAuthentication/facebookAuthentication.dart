import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:school_management/Services/navigationServices.dart';
import 'package:school_management/locator.dart';

abstract class FacebookAuth {
  void initiateFacebook();
  Future<void> facebookLoginSucessfully(
      FacebookLoginResult facebookLoginResult);
  Future<void> logOutFacebook();
}

class FacebookAuthenticationBase implements FacebookAuth {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser firebaseUser;
  FacebookLogin facebookLogin = new FacebookLogin();

  final NavigationServices _navigationServices = sl<NavigationServices>();

  void initiateFacebook() async {
    facebookLogin.loginBehavior = FacebookLoginBehavior.webOnly;
    FacebookLoginResult facebookLoginResult =
        await facebookLogin.logIn(['email', 'public_profile']);
    print(facebookLoginResult.status);
    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.loggedIn:
        facebookLoginSucessfully(facebookLoginResult);
        break;
      case FacebookLoginStatus.cancelledByUser:
        break;
      case FacebookLoginStatus.error:
        break;
    }
  }

  Future<void> facebookLoginSucessfully(FacebookLoginResult result) async {
    {
      FacebookAccessToken facebookToken = result.accessToken;
      AuthCredential credential =
          FacebookAuthProvider.getCredential(accessToken: facebookToken.token);
      firebaseUser = (await _auth.signInWithCredential(credential)).user;
      return _navigationServices.navigateTo('/teacher');
    }
  }

  Future<void> logOutFacebook() async {
    await FirebaseAuth.instance.signOut().then((value) {
      facebookLogin.logOut();
      _navigationServices.navigateTo('/loginBoard');
    });
    return null;
  }
}
