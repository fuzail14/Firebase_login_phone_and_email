import 'dart:async';
import 'package:firebaseproject/module/Admin/View/admin_screen.dart';
import 'package:firebaseproject/module/Home/View/home_screen.dart';
import 'package:firebaseproject/module/PhoneLogin/View/phone_login.dart';
import 'package:firebaseproject/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //navigate to the new screen
    Timer(Duration(seconds: 3), () => Get.to(() => AdminScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 182, 117, 13),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Image.asset(
              SplashLogo,
              width: 280,
            ),
          ),
        ],
      ),
    );
  }
}
