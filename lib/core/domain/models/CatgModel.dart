// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:parkingapp/core/domain/models/basic_model.dart';

class catgModel  extends ResultModel{

String body;
  catgModel({
    required this.body,
  });


  catgModel copyWith({
    String? body,
  }) {
    return catgModel(
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'body': body,
    };
  }

  factory catgModel.fromMap(Map<String, dynamic> map) {
    return catgModel(
      body: map['body'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory catgModel.fromJson(String source) => catgModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'catgModel(body: $body)';

  @override
  bool operator ==(covariant catgModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.body == body;
  }

  @override
  int get hashCode => body.hashCode;
}
