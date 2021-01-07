import 'package:flutter/material.dart';
import 'package:flutter_expenses/data/transactions.dart';
import 'package:flutter_expenses/models/transaction.dart';

import 'expense-form.dart';
import 'expenses-list.dart';

class Expenses extends StatefulWidget {
  const Expenses({
    Key key,
  }) : super(key: key);

  @override
  _ExpensesState createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  void _addTransaction(String title, double amount) {
    final newTransaction = Transaction(
        id: 'id', title: title, amount:amount, date: DateTime.now());

    setState(() => {transactions.add(newTransaction)});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ExpenseForm(addTransaction: _addTransaction),
          ExpensesList(transactions: transactions)
        ]);
  }
}
