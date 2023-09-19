import 'dart:developer';

import 'package:app/app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TransactionsRepository with ChangeNotifier {
  final db = Hive.box<Transaction>('transaction_db');

  void getData() {
    transactions;
  }

  List<Transaction> get transactions {
    return db.values.toList();
  }

  List<Transaction> get recentTransactions => [...transactions.sublist(0, 5)];

  List<Transaction> get revenueTransactions =>
      [...transactions.where((tr) => tr.type == "revenue")];

  List<Transaction> get expenseTransactions =>
      [...transactions.where((tr) => tr.type == "expense")];

  double get revenue => revenueTransactions.fold(
      0, (previousValue, element) => previousValue + element.value);

  double get expense => expenseTransactions.fold(
      0, (previousValue, element) => previousValue + element.value);

  double get balance => revenue - expense;

  void addTransaction(Transaction transaction) {
    try {
      transactions.add(transaction);
      db.add(transaction);
    } catch (e) {
      log('deu ruim: $e');
    }

    notifyListeners();
  }
}

final transactionProvider =
    ChangeNotifierProvider<TransactionsRepository>((ref) {
  return TransactionsRepository();
});
