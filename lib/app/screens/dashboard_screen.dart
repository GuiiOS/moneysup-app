import 'package:app/app/models/transaction.dart';
import 'package:app/app/repositories/transactions.dart';
import 'package:app/app/repositories/users.dart';
import 'package:app/app/theme/colors_theme.dart';
import 'package:app/app/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactions = ref.watch(transactionProvider).transactions;

    return Scaffold(
      appBar: AppBar(
        title: Text(ref.watch(userProvider).user.nickName),
      ),
      body: LayoutBuilder(
        builder: (context, size) {
          return Container(
            height: size.maxHeight,
            width: size.maxWidth,
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 16,
            ),
            child: transactions.isEmpty
                ? Center(
                    child: Text(
                      'Nenhuma transação realizada',
                      style: context.textStyles.textBold.copyWith(
                        fontSize: 16,
                        color: ColorsApp.instance.textWhite,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: transactions.length,
                    itemBuilder: (context, index) {
                      final transaction = transactions[index];

                      return ListTile(
                        title: Text(
                          transaction.title,
                          style: context.textStyles.textBold.copyWith(
                            fontSize: 16,
                            color: ColorsApp.instance.textWhite,
                          ),
                        ),
                        subtitle: Text(
                          'Algo',
                          style: context.textStyles.textBold.copyWith(
                            fontSize: 16,
                            color: ColorsApp.instance.textWhite,
                          ),
                        ),
                      );
                    },
                  ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(transactionProvider).addTransaction(
                Transaction(
                  id: null,
                  title: 'Salário',
                  description: null,
                  value: 1500.00,
                  date: DateTime.now(),
                  type: 'revenue',
                  categorie: 'wage',
                ),
              );
        },
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}
