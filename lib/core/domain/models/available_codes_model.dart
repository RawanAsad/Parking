// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:parkingapp/core/domain/models/basic_model.dart';

class AvailableCodesModel extends ResultModel {
  num id;
  String code;
  num amount;
  AvailableCodesModel({
    required this.id,
    required this.code,
    required this.amount,
  });

  AvailableCodesModel copyWith({
    num? id,
    String? code,
    num? amount,
  }) {
    return AvailableCodesModel(
      id: id ?? this.id,
      code: code ?? this.code,
      amount: amount ?? this.amount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'code': code,
      'amount': amount,
    };
  }

  factory AvailableCodesModel.fromMap(Map<String, dynamic> map) {
    return AvailableCodesModel(
      id: map['id'] as num,
      code: map['code'] as String,
      amount: map['amount'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory AvailableCodesModel.fromJson(String source) => AvailableCodesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AvailableCodesModel(id: $id, code: $code, amount: $amount)';

  @override
  bool operator ==(covariant AvailableCodesModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.code == code &&
      other.amount == amount;
  }

  @override
  int get hashCode => id.hashCode ^ code.hashCode ^ amount.hashCode;
}
