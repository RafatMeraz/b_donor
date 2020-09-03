import 'dart:async';

import 'package:flutter/material.dart';
import 'package:organize_flutter_project/src/business_logic/services/hive_services/hive_services.dart';
import 'package:organize_flutter_project/src/business_logic/utils/contants.dart';
import 'package:organize_flutter_project/src/views/ui/home.dart';
import 'package:organize_flutter_project/src/views/ui/intro_screen.dart';
import 'package:organize_flutter_project/src/views/ui/login_register.dart';
import 'package:organize_flutter_project/src/views/utils/contants.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () async => await isFirstValue() ?  Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => IntroScreen())) : await isLoggedIn() ?  Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => Home())) : Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginRegister()))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/splash-bg.png'),
                    fit: BoxFit.fill)),
          ),
          Column(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Container(
                    width: 93,
                    height: 165,
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 25, horizontal: 16),
                child: CircularProgressIndicator(
                  backgroundColor: kSoftPurpleColor,
                  valueColor: AlwaysStoppedAnimation<Color>(kPurpleColor),
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          )
        ],
      )),
    );
  }

  Future<bool> isFirstValue() async {
    if (HiveServices.getData(name: 'first_time') == null){
      return true;
    } else {
      return false;
    }
  }
  Future<bool> isLoggedIn() async{
    var userId = HiveServices.getData(name: 'id');
    if (userId == null){
      return false;
    } else {
      UserData.userId = userId;
      UserData.phone = HiveServices.getData(name: 'name');
      UserData.email = HiveServices.getData(name: 'email');
      UserData.phone = HiveServices.getData(name: 'phone');
      print(userId);
      return true;
    }
  }
}
