import 'dart:convert';

import 'package:hive/hive.dart';

part 'transaction.g.dart';

@HiveType(typeId: 2)
class Transaction {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String? description;

  @HiveField(3)
  final double value;

  @HiveField(4)
  final DateTime date;

  @HiveField(5)
  final String type;

  @HiveField(6)
  final String categorie;

  const Transaction({
    required this.id,
    required this.title,
    required this.description,
    required this.value,
    required this.date,
    required this.type,
    required this.categorie,
  });

  String toJson() => json.encode(toMap());

  factory Transaction.fromMap(Map<String, dynamic> json) => Transaction(
        id: json["id"] ? int.parse(json["id"]) : null,
        title: json["title"] ? json["title"] : '',
        description: json["description"] ? json["description"] : null,
        value: json["value"] ? double.parse(json["value"]) : 0.0,
        date: json["date"] ? json["date"] : DateTime.now(),
        type: json["type"] ? json["type"] : '',
        categorie: json["categorie"] ? json["categorie"] : '',
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "value": value,
        "date": date,
        "type": type,
        "categorie": categorie,
      };
}
