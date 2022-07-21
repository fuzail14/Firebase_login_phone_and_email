import 'package:firebaseproject/module/PhoneLogin/Controller/otp_controller.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class Otp extends GetView<OtpController> {
  @override
  Widget build(BuildContext context) {
    Get.put(OtpController());
    controller.VerifyPhoneNumber();

    print(
        "Otp classcontroller.RecievephoneNumber ${controller.RecievephoneNumber}");
    print(
        " Otp Class   controller.Recievedialcodedigits ${controller.Recievedialcodedigits}");

    return Scaffold(
      key: controller.scaffoldkey,
      appBar: AppBar(title: Text("Otp Verification")),
      body: Column(children: [
        Padding(
          padding: EdgeInsets.all(8),
          child: Image.asset("assets/firebasepic.png"),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: Center(
            child: GestureDetector(
              onTap: () {
                controller.VerifyPhoneNumber();
              },
              child: Text(
                "Verifying: ${controller.Recievedialcodedigits},${controller.RecievephoneNumber}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.all(40),
              child: Pinput(
                length: 6,
                errorTextStyle: TextStyle(fontSize: 25, color: Colors.white),
                focusNode: controller.pinOtpCodeFocus,
                controller: controller.pinOtpCodeController,
                onSubmitted: (pin) async {
                  controller.otpRecieveing(pin);

                  // controller.otp = pin;
                  // print("pin.....$pin");
                  // //save(pin);
                  // try {
                  //   await FirebaseAuth.instance
                  //       .signInWithCredential(PhoneAuthProvider.credential(
                  //           verificationId: controller.verficationcode!,
                  //           smsCode: pin))
                  //       .then((value) {
                  //     if (value.user != null) {
                  //       Get.offAll(() => PhoneSignupScreen(), arguments: [
                  //         controller.id,
                  //         controller.phoneNumber,
                  //         controller.RecieveUserRole
                  //       ]);
                  //     }
                  //   });
                  // } catch (e) {
                  //   Fluttertoast.showToast(msg: "Error");
                  // }
                },
              ),
            ),
            Container(
              width: 160,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(30),
              ),
              child: MaterialButton(
                padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                minWidth: MediaQuery.of(context).size.width,
                onPressed: () async {
                  controller.otp = controller.pinOtpCodeController.text;

                  controller.otpRecieveing(controller.otp!);

                  print("pinotpcode.... ${controller.otp}");
                },
                child: Text(
                  "Submit",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
      ]),
    );
  }
}
