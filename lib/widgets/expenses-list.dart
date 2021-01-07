import 'package:flutter/material.dart';
import 'package:flutter_expenses/models/transaction.dart';
import 'expense.dart';

class ExpensesList extends StatelessWidget {
  final List<Transaction> transactions;
  ExpensesList({this.transactions});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: transactions
            .map((transaction) => ExpenseWidget(
                  transaction: transaction,
                ))
            .toList());
  }
}
