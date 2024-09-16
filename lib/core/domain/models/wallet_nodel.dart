// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:parkingapp/core/domain/models/basic_model.dart';

class Wallet_Model extends ResultModel {
  String securityCode;
  String confirmSecurityCode;
  String bankAccount;
  Wallet_Model({
    required this.securityCode,
    required this.confirmSecurityCode,
    required this.bankAccount,
  });

  Wallet_Model copyWith({
    String? securityCode,
    String? confirmSecurityCode,
    String? bankAccount,
  }) {
    return Wallet_Model(
      securityCode: securityCode ?? this.securityCode,
      confirmSecurityCode: confirmSecurityCode ?? this.confirmSecurityCode,
      bankAccount: bankAccount ?? this.bankAccount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'securityCode': securityCode,
      'confirmSecurityCode': confirmSecurityCode,
      'bankAccount': bankAccount,
    };
  }

  factory Wallet_Model.fromMap(Map<String, dynamic> map) {
    return Wallet_Model(
      securityCode: map['securityCode'] as String,
      confirmSecurityCode: map['confirmSecurityCode'] as String,
      bankAccount: map['bankAccount'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Wallet_Model.fromJson(String source) => Wallet_Model.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Wallet(securityCode: $securityCode, confirmSecurityCode: $confirmSecurityCode, bankAccount: $bankAccount)';

  @override
  bool operator ==(covariant Wallet_Model other) {
    if (identical(this, other)) return true;
  
    return 
      other.securityCode == securityCode &&
      other.confirmSecurityCode == confirmSecurityCode &&
      other.bankAccount == bankAccount;
  }

  @override
  int get hashCode => securityCode.hashCode ^ confirmSecurityCode.hashCode ^ bankAccount.hashCode;
}
