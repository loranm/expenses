import 'package:flutter/material.dart';

class ExpenseForm extends StatefulWidget {
  final Function addTransaction;

  ExpenseForm({@required this.addTransaction});

  @override
  _ExpenseFormState createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void onAddTransactionButton() {
    final title = titleController.text;
    final amount = double.parse(amountController.text);

    if (title.isEmpty || amount <= 0) {
      return;
    }

    return widget.addTransaction(title, amount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: titleController,
              onSubmitted: (_) => onAddTransactionButton(),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => onAddTransactionButton(),
            ),
            FlatButton(
              onPressed: onAddTransactionButton,
              textColor: Colors.purple,
              child: Text("Add Transaction"),
            ),
          ],
        ),
      ),
    );
  }
}
