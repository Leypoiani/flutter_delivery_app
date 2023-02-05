import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PaymentsTypeModel {
  final int id;
  final String name;
  final String acronym;
  final bool enabled;
  PaymentsTypeModel({
    required this.id,
    required this.name,
    required this.acronym,
    required this.enabled,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'acronym': acronym,
      'enabled': enabled,
    };
  }

  factory PaymentsTypeModel.fromMap(Map<String, dynamic> map) {
    return PaymentsTypeModel(
      id: map['id'] as int,
      name: map['name'] as String,
      acronym: map['acronym'] as String,
      enabled: map['enabled'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentsTypeModel.fromJson(String source) =>
      PaymentsTypeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
