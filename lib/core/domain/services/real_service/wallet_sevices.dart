import 'package:dio/dio.dart';
import 'package:parkingapp/core/config/option.dart';
import 'package:parkingapp/core/domain/models/Signup.dart';
import 'package:parkingapp/core/domain/models/available_codes_model.dart';
import 'package:parkingapp/core/domain/models/basic_model.dart';
import 'package:parkingapp/core/domain/models/wallet_info_model.dart';
import 'package:parkingapp/core/domain/models/wallet_nodel.dart';

String token =
    'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIyMzAyNTYzMjU4IiwiaWF0IjoxNzI2NTEzNjU4LCJleHAiOjE3MjY2MDAwNTh9.ciJhydRox00l3JqBnSWRCWYPcfW6eTPIm7R8qxIml3A';

class WalletService {
  /////////////////////////////////////////////////////////////////////
  Future<ResultModel> createWallet(Wallet_Model mod) async {
    Dio dio = Dio();
    Response response;

    try {
      response =
          await dio.post("https://rideshare.devscape.online/api/v1/wallet",
              data: mod.toMap(),
              options: Options(headers: {
                "accept": "*/*",
                "Authorization": " Bearer ${token}",
                "Content-Type": "application/json"
              }));
      if (response.statusCode == 201) {
        print("${response.statusCode}");
        print(response.data);
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

  /////////////////////////////////////////////////////////////////////
  Future<Object> get_wallet() async {
    Dio dio = Dio();
    Response response;

    response = await dio.get("https://rideshare.devscape.online/api/v1/wallet",
        options: Options(headers: {
          "accept": "*/*",
          "Authorization": " Bearer ${token}",
        }));
    try {
      if (response.statusCode == 200) {
        WalletInfoModel wallet_data =
            WalletInfoModel.fromMap(response.data['body']);

        return wallet_data as WalletInfoModel;
      } else {
        print(response.data["message"]);
        return ErrorModel();
      }
    } catch (e) {
      print(response.data["message"]);
      return ExceptionModel();
    }
  }

/////////////////////////////////////////////////////////////////
  Future<Object> get_codes() async {
    Dio dio = Dio();
    Response response;

    response = await dio.get(
        "https://rideshare.devscape.online/api/v1/wallet/All-valid-codes",
        options: Options(headers: {
          "accept": "*/*",
          "Authorization": " Bearer ${token}",
        }));
    try {
      if (response.statusCode == 200) {
        //List<AvailableCodesModel> available_codes=(response.data["body"]as List).map((e) => AvailableCodesModel.fromMap.toList());
        print(response.data["message"]);
        print(response.data['body']);
        List<AvailableCodesModel> codes = List.generate(
            response.data.length,
            (index) =>
                AvailableCodesModel.fromMap(response.data['body'][index]));

        ListModel<AvailableCodesModel> ListOFcodes = ListModel(list: codes);
        return ListOFcodes;
      } else {
        print(response.data["message"]);
        return ErrorModel();
      }
    } catch (e) {
      print(response.data["message"]);
      return ExceptionModel();
    }
  }

  ////////////////////////////////////////////////////////////////////
  Future<ResultModel> charge_wallet_byCode({required code}) async {
    Dio dio = Dio();
    Response response;

    try {
      response =
          await dio.put("https://rideshare.devscape.online/api/v1/wallet",
              data: {"code": code},
              options: Options(headers: {
                "accept": "*/*",
                "Authorization": " Bearer ${token}",
                "Content-Type": "application/json"
              }));
      if (response.statusCode == 202) {
        print("${response.statusCode}");
        print(response.data);
        return Successmodel();
      } else if(response.statusCode == 403){
         print("${response.statusCode}");
        print(response.data);
        return ErrorModel();
      }
      else {
        print("${response.statusCode}");
        print(('bjbbjjbbjbjbb'));
        print(response.data["message"]);
        return ErrorModel();
      }
    } on DioException catch (e) {
      print(('ololllllllllll'));
      print("Exception massage is :${e.message}");
      return ExceptionModel();
    }
  }
  ///////////////////////////////////////////////////////////////////
}
