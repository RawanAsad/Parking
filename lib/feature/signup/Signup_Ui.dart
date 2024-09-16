import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkingapp/core/resourses/components.dart';
import 'package:parkingapp/feature/signup/Set_pasUi.dart';
import 'package:parkingapp/feature/signup/bloc/signup_bloc.dart';

TextEditingController fname_controller = TextEditingController();
TextEditingController lname_controller = TextEditingController();
TextEditingController phone_controller = TextEditingController();



class SignupUI extends StatelessWidget {
  SignupUI({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(leading: Icon(Icons.arrow_back_ios),
          title: Text("Back",style: TextStyle(fontSize: 18),),),
          body: Column(
           // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Sign up with your \n phone number ",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 25),),
              ),
            ),
            
              TextFieldContainer(controller: fname_controller,hinttext:" First name " ,),
            TextFieldContainer(controller: lname_controller,hinttext:" Last name " ,),
            TextFieldContainer(controller: phone_controller,hinttext:" Phone number" ,)
            ,InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SetPassUI(fname: fname_controller, Lname: lname_controller, phone: phone_controller)));
              },
              child: GreenContainer(text: " Sign Up",))
            ],
          ),
        );
      }),
    );
  }
}
