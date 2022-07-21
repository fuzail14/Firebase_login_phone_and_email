import 'dart:isolate';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebaseproject/module/Home/View/homescreentest.dart';
import 'package:firebaseproject/module/PhoneSignup/View/phone_signup.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  String? id;
  String? phoneNumber;
  var arguments = Get.arguments;
  String? RecievephoneNumber;
  String? Recievedialcodedigits;
  String? RecieveUserRole;
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  final TextEditingController pinOtpCodeController = TextEditingController();
  final FocusNode pinOtpCodeFocus = FocusNode();
  String? verficationcode;
  String? otp;
  String? otpp;

  VerifyPhoneNumber() async {
    RecievephoneNumber = arguments[0];
    Recievedialcodedigits = arguments[1];
    print("verify function RecievephoneNumber ${RecievephoneNumber}");
    print(" verify function Recievedialcodedigits ${Recievedialcodedigits}");

    print("verfiy function..");
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "${Recievedialcodedigits! + RecievephoneNumber!}",
        verificationCompleted: (PhoneAuthCredential credential) async {
          print('verification completed');
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) {
            if (value.user != null) {
              id = value.user!.uid;
              phoneNumber = value.user!.phoneNumber;
              print("id.....$id");
              print("number.....$phoneNumber");
              if (value.user!.uid == id) {
                Get.to(HomeScreentest());
              } else {
                Get.to(PhoneSignupScreen(), arguments: [id, phoneNumber]);
              }
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          Fluttertoast.showToast(msg: "Error Verfiyng Number");
        },
        codeSent: (String vID, int? resentToken) {
          verficationcode = vID;
          update();
        },
        codeAutoRetrievalTimeout: (String vID) {
          verficationcode = vID;
          update();
        },
        timeout: Duration(seconds: 60));
  }

  void otpRecieveing(String pin) async {
    otp = pin;
    print("pin.....$pin");
    //save(pin);
    try {
      await FirebaseAuth.instance
          .signInWithCredential(PhoneAuthProvider.credential(
              verificationId: verficationcode!, smsCode: pin))
          .then((value) {
        if (value.user != null) {
          id = value.user!.uid;
          phoneNumber = value.user!.phoneNumber;
          print("id.....$id");
          print("number.....$phoneNumber");
          if (value.user!.uid == id) {
            Get.to(HomeScreentest());
          } else {
            Get.to(PhoneSignupScreen(), arguments: [id, phoneNumber]);
          }

          //
        }
      });
    } catch (e) {
      Fluttertoast.showToast(msg: "Error");
    }
  }
}
