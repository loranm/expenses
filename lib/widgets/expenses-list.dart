import 'package:flutter/material.dart';
import './no-expense.dart';

import '../models/transaction.dart';
import './expense.dart';

class ExpensesList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;
  ExpensesList({this.transactions, this.deleteTransaction});

  List<Transaction> get reversedTransactions {
    return transactions.reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: transactions.isEmpty
          ? NoExpense()
          : ListView.builder(
              itemBuilder: itemBuilder,
              itemCount: transactions.length,
            ),
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    return ExpenseWidget(transaction: reversedTransactions[index], deleteTransaction: deleteTransaction);
  }
}
