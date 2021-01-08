import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class ExpenseWidget extends StatelessWidget {
  final transaction;

  const ExpenseWidget({
    Transaction this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColor, width: 5,)),
            child: Text(
              '\$${transaction.amount.toStringAsFixed(2)}',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
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
                    style:Theme.of(context).textTheme.headline6),
                Text(
                  DateFormat.yMMMd().format(transaction.date),
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
