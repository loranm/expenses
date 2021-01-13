import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String day;
  final double amount;
  final double weekSpending;

  ChartBar({this.day, this.amount, this.weekSpending});
  @override
  Widget build(BuildContext context) {
    return Flexible(
        fit: FlexFit.tight,
          child: Column(
        children: [
          FittedBox(
            child: Text('\$${amount.toStringAsFixed(0)}'),
          ),
          SizedBox(
            height: 4,
          ),
          Container(
            height: 60,
            width: 10,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      color: Color.fromRGBO(220, 220, 200, 1),
                      borderRadius: BorderRadius.circular(20)),
                ),
                FractionallySizedBox(
                  heightFactor: weekSpending == 0 ? 0 : (amount / weekSpending),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(day),
        ],
      ),
    );
  }
}
