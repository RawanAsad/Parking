import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:parkingapp/core/domain/models/available_codes_model.dart';
import 'package:parkingapp/core/domain/models/basic_model.dart';
import 'package:parkingapp/core/domain/models/wallet_info_model.dart';
import 'package:parkingapp/core/domain/models/wallet_nodel.dart';
import 'package:parkingapp/core/domain/services/real_service/wallet_sevices.dart';
import 'package:parkingapp/feature/signup/bloc/signup_bloc.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';

 WalletService w = WalletService();

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  WalletBloc() : super(WalletInitial()) {
    on<create_the_wallet>((event, emit) async {
      var result = await w.createWallet(event.create_wallet_info);
      if (result is Successmodel) {
        print("success");
        emit(WalletCreatedSuccessfully());
      } else if (result is Erorr) {
        print("Error");
        emit(Erorrr());
      } else {
        print("Exception");
        emit(Exception());
      }
    });

     on<get_wallet_info>((event, emit) async {
      var result = await w.get_wallet();
      if (result is WalletInfoModel) {
        print("success");
        emit(GetWalletInfouccessfully(result));
      } else if (result is Erorr) {
        print("Error");
        emit(Erorrr());
      } else {
        print("Exception");
        emit(Exception());
      }
    });

    
     on<get_available_codes>((event, emit) async {
      var result = await w.get_codes();
      emit(Loading());
      if (result is ListModel<AvailableCodesModel>) {
        print("Sucsess bloc");
        emit(GetAvailableCodesSuccessfully(listCodes: result.list));
      }

    else  if (result is ErrorModel) {
        print("Erorrr");
        emit(Erorrr());
      } else {
        print("Exception");
        emit(Exception());
      }
    });


     on<Add_money_byCode>((event, emit) async {
      var result = await w.charge_wallet_byCode(code: event.code);
      if (result is Successmodel) {
        print("success");
        emit(MoneyAddedSuccessfully());
      } else if (result is Erorr) {
        print("Error");
        emit(Erorrr());
      } else {
        print("Exception22222222222222222");
        emit(Exception());
      }
    });

  }

    
}
