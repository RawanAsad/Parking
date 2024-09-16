import 'dart:async';

import 'package:mockito/mockito.dart';
import 'package:parkingapp/core/domain/models/Signup.dart';
import 'package:parkingapp/core/domain/models/basic_model.dart';
import 'package:parkingapp/core/domain/services/real_service/sign_service.dart';

class MockSign extends Mock implements UserService {
  Future<ResultModel> sign_service(Signupmodel user) async {
    try {
      if (user.firstName.isNotEmpty &&
          user.lastName.isNotEmpty &&
          user.birthDate.isNotEmpty &&
          user.password.isNotEmpty &&
          user.confirmPassword.isNotEmpty &&
          user.phone.isNotEmpty &&
          user.username.isNotEmpty) {
        print(" if success in mock sign");
        return Successmodel();
      } else if (user.firstName.isEmpty ||
          user.lastName.isEmpty ||
          user.birthDate.isEmpty ||
          user.password.isEmpty ||
          user.confirmPassword.isEmpty ||
          user.phone.isEmpty ||
          user.username.isEmpty) {
        print("  else if error in mock sign");
        return ErrorModel();
      }
      return ErrorModel();
    } catch (e) {
      print(" else Exception in mock sign");
      print(e.toString());
      return ExceptionModel();
    }
  }
}
