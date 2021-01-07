import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_expenses/transaction.dart';

import 'expense.dart';

class ExpenseList extends StatelessWidget {
  final List<Transaction> transactions;

  ExpenseList({this.transactions});

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

