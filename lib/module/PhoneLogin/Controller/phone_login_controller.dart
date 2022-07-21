import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneLoginController extends GetxController {
  String dialcodedigits = '+92';
  TextEditingController phonecontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();

  void countryCodePicker(var country) {
    dialcodedigits = country;
    update();
  }
}
