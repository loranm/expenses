import 'package:flutter/material.dart';
import 'package:flutter_expenses/models/transaction.dart';
import 'package:flutter_expenses/widgets/chart_bar.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  Chart(this.recentTransactions);
  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.00;
      final formatedWeekDay = DateFormat.E().format(weekday);
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekday.day) {
          totalSum += recentTransactions[i].amount;
        }
      }

      return {'day': formatedWeekDay, 'amount': totalSum};
    });
  }

  double get weekSpending {
    return groupedTransactionValues.fold(
        0.0, (previousValue, element) => previousValue + element['amount']);
  }

  @override
  Widget build(BuildContext context) {
    return Card(elevation: 6, margin: EdgeInsets.all(20),
    child: Container(
      padding: EdgeInsets.all(10),
      child: Row(
          children: groupedTransactionValues
              .map((transaction) => ChartBar(
                    day: transaction['day'],
                    amount: transaction['amount'],
                    weekSpending: weekSpending
                  ))
              .toList(),
          mainAxisAlignment: MainAxisAlignment.spaceEvenly),
    ));
  }
}
