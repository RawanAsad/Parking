// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:parkingapp/core/resourses/components.dart';
import 'package:parkingapp/feature/signup/Signup_Ui.dart';
import 'package:parkingapp/feature/signup/profileUI.dart';
TextEditingController pass_controller = TextEditingController();
TextEditingController confirmPassword_controller = TextEditingController();
class SetPassUI extends StatelessWidget {
  SetPassUI({
    Key? key,
    required this.fname,
    required this.Lname,
    required this.phone,
  }) : super(key: key);
 final TextEditingController fname;
  final TextEditingController Lname;
  final TextEditingController phone;

 



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Set password",
            style: TextStyle(fontSize: 25),
          ),
          Text(
            "Set your password",
            style: TextStyle(fontSize: 15, color: Colors.grey),
          ),
          TextFieldContainer(controller: pass_controller,hinttext: " Enter Your Password",),
          TextFieldContainer(controller: confirmPassword_controller,hinttext: " Confirm Password",),
          Text(
            "Atleast 1 number or a special character",
            style: TextStyle(fontSize: 10, color: Colors.grey),
            
          ),
          SizedBox(height: 30,),

          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>profileUi(firstname: fname.text, Lastname: Lname.text, pass: pass_controller.text, confirmpass: confirmPassword_controller.text, phone:phone.text)));
            },
            child: GreenContainer(text: "Register")),
        ],
      ),
    );
  }
}
