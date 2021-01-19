import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:organize_flutter_project/src/business_logic/utils/contants.dart';
import 'package:organize_flutter_project/src/views/ui/home.dart';
import 'package:organize_flutter_project/src/views/ui/login_register.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
FirebaseApp defaultApp;

Future<bool> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
  await googleSignInAccount.authentication;
  defaultApp = await Firebase.initializeApp();

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final authResult = await _auth.signInWithCredential(credential);

  if (authResult.user.isAnonymous) {
    return false;
  }

  assert(!authResult.user.isAnonymous);
  assert(await authResult.user.getIdToken() != null);

  assert(authResult.user.uid == _auth.currentUser.uid);
  RegisterUserData.socialId = authResult.user.uid.toString();
//  print(RegistrationData.socialId);
  RegisterUserData.socialLogin = '1';
  RegisterUserData.email = authResult.user.email;
//  UserData.socialLogin = true;
  return true;
}

class FirebaseAuthService {
  static String errorMessage;
  static bool userSignIn = false;
  static User userData;

  // check user is logged on or not
  static checkUserAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return Home();
          } else {
            return LoginRegister();
          }
        });
  }

  static logout() {
    _auth.signOut();
  }
}