import 'package:app/app/models/transaction.dart';
import 'package:app/app/repositories/transactions.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Transaction> transactions = ref.watch(transactionsProvider);

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, size) {
          return SizedBox(
            height: size.maxHeight,
            width: size.maxWidth,
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final transaction = transactions[index];

                return GestureDetector(
                  onTap: () {
                    ref.read(transactionsProvider.notifier).delete(transaction);
                  },
                  child: ListTile(
                    title: Text(transaction.title),
                    subtitle: Text(transaction.description ?? ''),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(transactionsProvider.notifier).add(
                Transaction(
                  title: 'Salário',
                  description: 'b',
                  value: 1500.00,
                  date: DateTime.now(),
                  type: 'revenue',
                  categorie: 'wage',
                ),
              );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
