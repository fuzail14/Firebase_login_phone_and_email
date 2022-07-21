import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseproject/model/SignupModel/user_signup_model.dart';
import 'package:firebaseproject/module/Home/View/home_screen.dart';

import 'package:firebaseproject/module/PhoneLogin/View/phone_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreentest extends StatefulWidget {
  const HomeScreentest({Key? key}) : super(key: key);

  @override
  _HomeScreentestState createState() => _HomeScreentestState();
}

class _HomeScreentestState extends State<HomeScreentest> {
  User? user = FirebaseAuth.instance.currentUser;
  UserSignupModel loggedInUser = UserSignupModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserSignupModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 150,
                child:
                    Image.asset("assets/firebasepic.png", fit: BoxFit.contain),
              ),
              Text(
                "Welcome Back",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text("${loggedInUser.firstname} ${loggedInUser.lastname}",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(
                height: 15,
              ),
              Text("${loggedInUser.uid}",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(
                height: 15,
              ),
              ActionChip(
                  label: Text("Logout"),
                  onPressed: () {
                    logout(context);
                  }),
            ],
          ),
        ),
      ),
    );
  }

  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(HomeScreen());
  }
}
