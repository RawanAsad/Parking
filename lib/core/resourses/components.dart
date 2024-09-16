// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:parkingapp/core/resourses/colors.dart';

class TextFieldContainer extends StatelessWidget {
  TextFieldContainer({Key? key, required this.controller, this.hinttext})
      : super(key: key);
  String? hinttext;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            border: Border.all(width: 0.3),
            borderRadius: BorderRadius.circular(7)),
        width: double.infinity,
        height: 60,
        child: TextFormField(
          controller: controller,
          decoration:
              InputDecoration(hintText: hinttext, border: InputBorder.none),
        ));
  }
}

class GreenContainer extends StatelessWidget {
  GreenContainer({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      height: 54,
      decoration: BoxDecoration(
          color: darkgreen, borderRadius: BorderRadius.circular(10)),
      child: Center(
          child: Text(
        text,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),
      )),
    );
  }
}
