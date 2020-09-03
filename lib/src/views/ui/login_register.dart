import 'package:flutter/material.dart';
import 'package:organize_flutter_project/src/business_logic/services/firebase_services.dart';
import 'package:organize_flutter_project/src/views/ui/verify_number.dart';
import 'package:organize_flutter_project/src/views/utils/contants.dart';
import 'package:organize_flutter_project/src/views/utils/reusable_widgets.dart';
import 'package:http/http.dart' as http;

class LoginRegister extends StatefulWidget {
  @override
  _LoginRegisterState createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SafeArea(
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
//                  Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyMobileNumber()));
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyMobileNumber()));
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
    );
  }
}
