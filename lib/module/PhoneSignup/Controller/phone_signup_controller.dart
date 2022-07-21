import 'dart:isolate';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebaseproject/model/SignupModel/user_signup_model.dart';
import 'package:firebaseproject/module/Home/View/homescreentest.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class PhoneSignupController extends GetxController {
  final auth = FirebaseAuth.instance;
  var arguments = Get.arguments;
  var id;

  var phoneNumber;

  // string for displaying the error Message
  String? errorMessage;

  // our form key
  final formKey = GlobalKey<FormState>();
  // editing Controller
  final firstNameEditingController = new TextEditingController();
  final secondNameEditingController = new TextEditingController();

  void postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values
    if (formKey.currentState!.validate()) {
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      User? user = auth.currentUser;

      UserSignupModel usersignupModel = UserSignupModel();

      // writing all the values
      usersignupModel.uid = id;
      usersignupModel.firstname = firstNameEditingController.text;
      usersignupModel.lastname = secondNameEditingController.text;
      usersignupModel.phoneNumber = phoneNumber;

      await firebaseFirestore
          .collection("users")
          .doc(user!.uid)
          .set(usersignupModel.toMap());
      Fluttertoast.showToast(msg: "Account created successfully :) ");

      Get.offAll(HomeScreentest());
    }
  }
}
