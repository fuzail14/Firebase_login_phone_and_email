import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({required this.onTap, required this.text});
  void Function()? onTap;
  String? text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(text!),
        ),
      ),
    );
  }
}
