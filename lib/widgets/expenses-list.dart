import 'package:flutter/material.dart';
import './no-expense.dart';

import '../models/transaction.dart';
import './expense.dart';

class ExpensesList extends StatelessWidget {
  final List<Transaction> transactions;
  ExpensesList({this.transactions});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child:
      transactions.isEmpty ?
      NoExpense() :
      ListView.builder(
        itemBuilder: itemBuilder,
        itemCount: transactions.length,
      ),
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    return ExpenseWidget(transaction: transactions[index]);
  }
}
