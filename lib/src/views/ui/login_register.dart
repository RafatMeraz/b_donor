import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:organize_flutter_project/src/business_logic/services/firebase_services/firebase_services.dart';
import 'package:organize_flutter_project/src/business_logic/services/repository.dart';
import 'package:organize_flutter_project/src/business_logic/utils/contants.dart';
import 'package:organize_flutter_project/src/views/ui/become_donor.dart';
import 'package:organize_flutter_project/src/views/ui/home.dart';
import 'package:organize_flutter_project/src/views/ui/verify_number.dart';
import 'package:organize_flutter_project/src/views/utils/contants.dart';
import 'package:organize_flutter_project/src/views/utils/reusable_widgets.dart';

class LoginRegister extends StatefulWidget {
  @override
  _LoginRegisterState createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
  bool inProgress = false;
//  void fbLogin() async {
//    final facebookLogin = FacebookLogin();
//    final facebookLoginResult = await facebookLogin.logIn(['email']);
//
//    if (facebookLoginResult != null) {
//      if (facebookLoginResult.accessToken != null &&
//          facebookLoginResult.accessToken.token != null) {
//        final token = facebookLoginResult.accessToken.token;
//        final graphResponse = await http.get(
//            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=$token');
//        final profile = json.decode(graphResponse.body);
//        print("profile : $profile");
//
//        if (profile != null) {
////          RegistrationData.socialId = profile['id'];
////          RegistrationData.socialLogin = '1';
////          RegistrationData.email = profile['email'];
////          UserData.socialLogin = true;
////
////          var _emailResponse = await checkEmailExists();
////          if (_emailResponse) {
////            Navigator.push(context,
////                MaterialPageRoute(builder: (context) => SocialPhone()));
////          } else {
////            Navigator.pushAndRemoveUntil(
////                context,
////                MaterialPageRoute(
////                    builder: (context) => HomeBottomNavigationBar()),
////                (route) => false);
////          }
//        } else {
//          showErrorToast('Login with email failed! Try again.');
//        }
//      }
//    }
//  }

  checkEmailExists() async{
    setState(() {
      inProgress = true;
    });
    var _response = await repository.checkEmailExists(RegisterUserData.email, EmailExistCheck.LoginCheck);
    if (_response.id == ResponseCode.SUCCESSFUL) {
      setState(() {
        inProgress = false;
      });
      if (_response.object == 'not exists'){
        Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyMobileNumber()));
      } else {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> Home()), (route) => false);
      }
    } else {
      setState(() {
        inProgress = false;
      });
      showErrorToast(_response.object);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: ModalProgressHUD(
        inAsyncCall: inProgress,
        color: Colors.black87,
        progressIndicator: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: kPurpleColor,
          ),
          padding: EdgeInsets.all(20),
          child: CircularProgressIndicator(
            backgroundColor: kWhiteColor,
            valueColor: AlwaysStoppedAnimation<Color>(kBlackColor),
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: 340,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset('assets/images/reg_bg.png', fit: BoxFit.fitWidth,),
                ),
                Text('LOGIN & REGISTER', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                SizedBox(
                  height: 50
                ),
                InkWell(
                  onTap: (){
//                  fbLogin();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BecomeDonor()));
                  },
                  child: Container(
                    width: 280,
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2D509B),
                      borderRadius: BorderRadius.circular(30)
                    ),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: 15,
                          ),
                          Image.asset('assets/images/facebook-logo.png', width: 12, height: 18, fit: BoxFit.scaleDown),
                          Expanded(child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Facebook', style: TextStyle(fontSize: 15, color: kWhiteColor, fontWeight: FontWeight.w500)),
                            ],
                          ))
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16
                ),
                InkWell(
                  onTap: () async{
                    var result = await signInWithGoogle();
                    if (result){
                      checkEmailExists();
                    } else {
                      print('SignIn failed!');
                    }
                  },
                  child: Container(
                    width: 280,
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: kBorderGreyColor)
                    ),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: 15,
                          ),
                          Image.asset('assets/images/google-logo.png', width: 12, height: 18, fit: BoxFit.scaleDown),
                          Expanded(child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Google', style: TextStyle(fontSize: 15, color: kBlackColor, fontWeight: FontWeight.w500)),
                            ],
                          ))
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    height: 16
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyMobileNumber()));
                  },
                  child: Container(
                    width: 280,
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: kBorderGreyColor)
                    ),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: 15,
                          ),
                          Image.asset('assets/images/mobile-logo.png', width: 12, height: 18, fit: BoxFit.scaleDown),
                          Expanded(child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Mobile Number', style: TextStyle(fontSize: 15, color: kBlackColor, fontWeight: FontWeight.w500)),
                            ],
                          ))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
