import 'package:flutter/material.dart';

class NoExpense extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "no transactions",
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(
          height: 30,
        ),
        Container(
            height: 200,
            child: Image.asset(
              'assets/images/waiting.png',
              fit: BoxFit.cover,
            ))
      ],
    );
  }
}
