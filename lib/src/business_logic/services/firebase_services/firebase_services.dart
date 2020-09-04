import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:organize_flutter_project/src/business_logic/utils/contants.dart';

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

//Future<bool> signInWithFacebook() async {
//  final facebookLogin = FacebookLogin();
//  try {
//    final result = await facebookLogin.logInWithReadPermissions(['email']);
//    if (result.accessToken != null){
//      var firebaseUser = await firebaseAuthWithFacebook(
//          token: result.accessToken);
//      if (firebaseUser != null){
//        RegistrationData.socialId = firebaseUser.uid;
//        RegistrationData.socialLogin = '1';
//        if (firebaseUser.email != null){
//          RegistrationData.email = firebaseUser.email;
//        }
//        return true;
//      } else {
//        showErrorToast('Face Auth failed! Try again.');
//      }
//    } else {
//      showErrorToast(result.errorMessage.toString());
//      return false;
//    }
//  } catch (error){
//    showErrorToast(error.toString());
//    return false;
//  }
//  return false;
//}
//
//Future<FirebaseUser> firebaseAuthWithFacebook({@required FacebookAccessToken token}) async {
//  AuthCredential credential= FacebookAuthProvider.getCredential(accessToken: token.token);
//  final AuthResult _authResult = await _authInstance.signInWithCredential(credential);
//  return _authResult.user;
//}