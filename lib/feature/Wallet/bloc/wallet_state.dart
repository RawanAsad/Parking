part of 'wallet_bloc.dart';

@immutable
sealed class WalletState {}

final class WalletInitial extends WalletState {}

final class Erorrr extends WalletState {}

final class Exception extends WalletState {}

final class Loading extends WalletState {}

final class WalletCreatedSuccessfully extends WalletState {}

final class GetWalletInfouccessfully extends WalletState {
 WalletInfoModel wallet_result;

  GetWalletInfouccessfully(this.wallet_result);
}

final class GetAvailableCodesSuccessfully extends WalletState {
   List<AvailableCodesModel> listCodes;
     GetAvailableCodesSuccessfully({required this.listCodes});
}

final class MoneyAddedSuccessfully extends WalletState {}