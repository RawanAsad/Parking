// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:parkingapp/core/domain/models/basic_model.dart';

class CategoryModel  extends ResultModel {

List body;
  CategoryModel({
    required this.body,
  });


  CategoryModel copyWith({
    List? body,
  }) {
    return CategoryModel(
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'body': body,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      body: List.from((map['body'] as List),
    ));
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) => CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CategoryModel(body: $body)';

  @override
  bool operator ==(covariant CategoryModel other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.body, body);
  }

  @override
  int get hashCode => body.hashCode;
}
