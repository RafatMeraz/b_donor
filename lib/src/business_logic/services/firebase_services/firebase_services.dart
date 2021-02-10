import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:organize_flutter_project/src/business_logic/utils/contants.dart';
import 'package:organize_flutter_project/src/views/ui/home.dart';
import 'package:organize_flutter_project/src/views/ui/login_register.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
FirebaseApp defaultApp;

Future<String> signInWithGoogle() async {
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
    return null;
  }

  assert(!authResult.user.isAnonymous);
  assert(await authResult.user.getIdToken() != null);

  assert(authResult.user.uid == _auth.currentUser.uid);
  RegisterUserData.socialId = authResult.user.uid.toString();
//  print(RegistrationData.socialId);
  RegisterUserData.socialLogin = '1';
  RegisterUserData.email = authResult.user.email;
  UserData.userId = authResult.user.uid;
//  UserData.socialLogin = true;
  return _auth.currentUser.uid;
}

class FirebaseServices {
  static String errorMessage;
  static bool userSignIn = false;
  static User userData;
  static final fireStoreInstance = FirebaseFirestore.instance;

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

  static Future<bool> checkDocExist(String docID) async {
    bool exists = false;
    try {
      await fireStoreInstance.doc("users/$docID").get().then((doc) {
        if (doc.exists)
          exists = true;
        else
          exists = false;
      });
      return exists;
    } catch (e) {
      return false;
    }
  }
  static Future<bool> registerNewUserData(String name, String zip, String address, String uid, String bloodGroup, String division, String gender, bool contactVisible) async {
    try {
      await fireStoreInstance.collection('users').doc(uid).set({
        'name': name,
        'zip': zip,
        'address': address,
        'blood_group': bloodGroup,
        'division': division,
        'gender': gender,
        'contact_visible': contactVisible,
        'donor_mode': false
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static getUserData(String uid) async {
    final _doc = await fireStoreInstance.collection('users').doc(uid).get();
    return _doc;
  }

  static logout() {
    _auth.signOut();
  }
}