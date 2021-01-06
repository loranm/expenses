import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_expenses/transaction.dart';
import "package:intl/intl.dart";

class ExpenseList extends StatelessWidget {
  final List<Transaction> transactions;

  ExpenseList({this.transactions});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: transactions
            .map((transaction) => Card(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.purple, width: 5)),
                        child: Text(
                          '\$${transaction.amount}',
                          style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(transaction.title,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            Text(
                             DateFormat.yMMMd().format(transaction.date),
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ))
            .toList());
  }
}
