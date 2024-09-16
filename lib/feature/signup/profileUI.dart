// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkingapp/core/domain/models/Signup.dart';
import 'package:parkingapp/core/domain/services/mock_service/mock_ser.dart';

import 'package:parkingapp/core/resourses/components.dart';
import 'package:parkingapp/feature/categories/bloc/CategoriesUi.dart';
import 'package:parkingapp/feature/signup/Signup_Ui.dart';
import 'package:parkingapp/feature/signup/bloc/signup_bloc.dart';

TextEditingController username_controller = TextEditingController();
TextEditingController birthDate_controller = TextEditingController();

class profileUi extends StatelessWidget {
  profileUi({
    Key? key,
    required this.firstname,
    required this.Lastname,
    required this.pass,
    required this.confirmpass,
    required this.phone,
  }) : super(key: key);

  final String firstname;
  final String Lastname;
  final String pass;
  final String confirmpass;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.arrow_back_ios),
            centerTitle: true,
            title: Text("Profile"),
          ),
          body: Column(
            children: [
              TextFieldContainer(
                controller: username_controller,
                hinttext: " User name",
              ),
              TextFieldContainer(
                controller: birthDate_controller,
                hinttext: " BirthDate",
              ),
              BlocBuilder<SignupBloc, SignupState>(builder: (context, state) {
                switch (state) {
                  case SuccessSignup_state():
                 return ElevatedButton(onPressed: (){  Navigator.push(context, MaterialPageRoute(builder: (context)=>CategorisUi()));}, child: Text("go on"));
                  case Erorr():
                    return Container(
                      width: 200,
                      height: 50,
                      child: Text(
                        "erorrrrrrrrrrrr",
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                  case SignupInitial():
                    return ElevatedButton(
                      onPressed: () {
                        context.read<SignupBloc>().add(
                              Signedup(
                                  user: Signupmodel(
                                      firstName: firstname,
                                      lastName: Lastname,
                                      phone: phone,
                                      username: username_controller.text,
                                      birthDate: birthDate_controller.text,
                                      password: pass,
                                      confirmPassword: confirmpass)),
                            );
                        print(Signupmodel(
                            firstName: firstname,
                            lastName: Lastname,
                            phone: phone,
                            username: username_controller.text,
                            birthDate: birthDate_controller.text,
                            password: pass,
                            confirmPassword: confirmpass));
                      },
                      child: const Text(
                        "Send",
                      ),
                    );
                  default:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                }
              })
            ],
          ),
        );
      }),
    );
  }
}
