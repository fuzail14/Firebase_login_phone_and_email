import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebaseproject/module/PhoneLogin/Controller/phone_login_controller.dart';

import 'package:firebaseproject/module/PhoneLogin/View/otp.dart';
import 'package:firebaseproject/widgets/custom_button.dart';
import 'package:firebaseproject/widgets/custom_textfield.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Otp Authentication'),
        centerTitle: true,
      ),
      body: GetBuilder<PhoneLoginController>(
          init: PhoneLoginController(),
          builder: (controller) {
            return Center(
              child: SingleChildScrollView(
                child: Form(
                  key: controller.formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                          height: 180,
                          child: Image.asset(
                            "assets/firebasepic.png",
                            fit: BoxFit.contain,
                          )),
                      SizedBox(height: 45),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Center(
                            child: Text(
                          'Phone(OTP) Authentication',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        width: 400,
                        height: 60,
//                         child: IntlPhoneField(
//     decoration: InputDecoration(
//         labelText: 'Phone Number',
//         border: OutlineInputBorder(
//             borderSide: BorderSide(),
//         ),
//     ),
//     initialCountryCode: 'IN',
//     onChanged: (phone) {
//         print(phone.completeNumber);
//     },
// ),
                        child: CountryCodePicker(
                          onChanged: (country) {
                            controller.countryCodePicker(country.dialCode!);
                          },
                          initialSelection: "PK",
                          showCountryOnly: false,
                          showOnlyCountryWhenClosed: false,
                          favorite: ["+1", "US", "+92", "PAK"],
                        ),
                      ),
                      CustomTextField(
                          text: 'Phone Number',
                          controller: controller.phonecontroller,
                          validator: (val) {}),
                      SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                          onTap: () {
                            Get.to(() => Otp(), arguments: [
                              controller.phonecontroller.text,
                              controller.dialcodedigits,
                            ]);
                          },
                          text: 'Next'),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
