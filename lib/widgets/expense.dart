import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class ExpenseWidget extends StatelessWidget {
  final Transaction transaction;

  const ExpenseWidget({
     this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: ListTile(
        leading: CircleAvatar(
          child: Padding(
            padding: const EdgeInsets.all(3),
            child: FittedBox(child:
            Text('\$${transaction.amount.toStringAsFixed(2)}'),)

          ),
        ),
      title: Text(transaction.title, style: Theme.of(context).textTheme.headline6,),
      subtitle: Text(DateFormat.yMMMd().format(transaction.date)),
      ),
    );
  }
}
