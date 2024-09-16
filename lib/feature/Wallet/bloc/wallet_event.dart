// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'wallet_bloc.dart';

@immutable
sealed class WalletEvent {}

class create_the_wallet extends WalletEvent {
  final Wallet_Model create_wallet_info;
  create_the_wallet({
    required this.create_wallet_info,
  });
}

class Add_money_byCode extends WalletEvent {
  String code;
  Add_money_byCode({
    required this.code,
  });
}

class get_wallet_info extends WalletEvent {}

class get_available_codes extends WalletEvent {}
