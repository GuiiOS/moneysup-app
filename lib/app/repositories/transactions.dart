import 'package:app/app/models/transaction.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TransactionsRepository extends StateNotifier<List<Transaction>> {
  TransactionsRepository() : super([]);

  void add(Transaction transaction) {
    state = [...state, transaction];
  }

  void delete(Transaction transaction) {
    state = [
      for (final tr in state)
        if (tr != transaction) tr,
    ];
  }
}

final transactionsProvider =
    StateNotifierProvider<TransactionsRepository, List<Transaction>>(
  (ref) => TransactionsRepository(),
);
