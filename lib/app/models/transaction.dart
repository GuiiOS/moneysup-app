import 'package:flutter/material.dart';

@immutable
class Transaction {
  final String title;
  final String? description;
  final double value;
  final DateTime date;
  final String type;
  final String categorie;

  const Transaction({
    required this.title,
    required this.description,
    required this.value,
    required this.date,
    required this.type,
    required this.categorie,
  });

  Transaction copyWith({
    String? title,
    String? description,
    double? value,
    DateTime? date,
    String? type,
    String? categorie,
  }) {
    return Transaction(
      title: title ?? this.title,
      description: description ?? this.description,
      value: value ?? this.value,
      date: date ?? this.date,
      type: type ?? this.type,
      categorie: categorie ?? this.categorie,
    );
  }
}
