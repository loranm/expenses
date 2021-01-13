import 'package:flutter_expenses/models/transaction.dart';

final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: "New Shoes", amount: 100.00, date: DateTime.now()),
    Transaction(
        id: 't2',
        title: "Weekly Groceries",
        amount: 13.44,
        date: DateTime.now())
  ];
// final List<Transaction> transactions = [];
