import 'package:dio/dio.dart';
import 'package:parkingapp/core/config/option.dart';
import 'package:parkingapp/core/domain/models/Signup.dart';
import 'package:parkingapp/core/domain/models/basic_model.dart';

late String token;

class UserService {
  Future<ResultModel> sign_service(Signupmodel user) async {
    Dio dio = Dio();
    //late String token;
    //String baseurl="";
    Response response;

    try {
      response = await dio.post(
        "https://rideshare.devscape.online/api/v1/auth/register",
        data: user.toMap(),
      );
      if (response.statusCode == 200) {
        print("responsecode::${response.statusCode}");

        print(response.data["body"]["token"]);
        token = response.data["body"]["token"];


        return Successmodel();
      } else {
        print(response.data["message"]);
        return ErrorModel();
      }
    } on DioException catch (e) {
      print("Exception massage is :${e.message}");
      return ExceptionModel();
    }
  }
}
