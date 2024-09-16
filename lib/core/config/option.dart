import 'package:parkingapp/core/domain/services/real_service/sign_service.dart';

option(){
  return {
     "accept":"*/*",
  "Authorization":" Bearer ${token}"
  };
}
UserService u=UserService();