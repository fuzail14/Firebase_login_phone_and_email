import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebaseproject/module/EmailSignup/View/signup.dart';
import 'package:firebaseproject/module/Home/View/homescreentest.dart';

import 'package:firebaseproject/utils/constants.dart';
import 'package:firebaseproject/widgets/custom_button.dart';
import 'package:firebaseproject/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                text: email,
                controller: emailController,
                validator: (value) {
                  if (!GetUtils.isEmail(value!.trim()))
                    return "Email is not valid";
                  else {}
                },
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                text: password,
                controller: passwordController,
                validator: (value) {
                  RegExp regExp = new RegExp(r'^.{6,}$');
                  if (value!.isEmpty) {
                    return "please Enter Password";
                  }
                  if (!regExp.hasMatch(value)) {
                    return "Please Enter Valid Password (min 6 )";
                  } else {}
                },
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an accont?"),
                  GestureDetector(
                    child: Text(
                      "Signup",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Get.to(SignupScreen());
                    },
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              CustomButton(
                  onTap: () async {
                    _save(emailController.text, passwordController.text);
                  },
                  text: Login)
            ],
          ),
        ),
      ),
    );
  }

  void _save(String email, String password) async {
    if (this._formkey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Login Successful"),
                Get.offAll(HomeScreentest())
              })
          .catchError((e) {
        Fluttertoast.showToast(
            msg: "User Not Found",
            fontSize: 15,
            gravity: ToastGravity.TOP_RIGHT);
      });
    } else {
      return null;
    }
  }
}
