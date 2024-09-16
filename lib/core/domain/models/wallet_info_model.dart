// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:parkingapp/core/domain/models/basic_model.dart';

class WalletInfoModel extends ResultModel{
  num id;
  num balance;
  String bankAccount;
  WalletInfoModel({
    required this.id,
    required this.balance,
    required this.bankAccount,
  });

  WalletInfoModel copyWith({
    num? id,
    num? balance,
    String? bankAccount,
  }) {
    return WalletInfoModel(
      id: id ?? this.id,
      balance: balance ?? this.balance,
      bankAccount: bankAccount ?? this.bankAccount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'balance': balance,
      'bankAccount': bankAccount,
    };
  }

  factory WalletInfoModel.fromMap(Map<String, dynamic> map) {
    return WalletInfoModel(
      id: map['id'] as num,
      balance: map['balance'] as num,
      bankAccount: map['bankAccount'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WalletInfoModel.fromJson(String source) => WalletInfoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'WalletInfoModel(id: $id, balance: $balance, bankAccount: $bankAccount)';

  @override
  bool operator ==(covariant WalletInfoModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.balance == balance &&
      other.bankAccount == bankAccount;
  }

  @override
  int get hashCode => id.hashCode ^ balance.hashCode ^ bankAccount.hashCode;
}
