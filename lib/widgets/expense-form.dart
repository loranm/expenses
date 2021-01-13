import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseForm extends StatefulWidget {
  final Function addTransaction;

  ExpenseForm({@required this.addTransaction});

  @override
  _ExpenseFormState createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _expenseDate;

  void _onAddTransactionButton() {
    final title = _titleController.text;
    final amount = double.parse(_amountController.text);

    if (title.isEmpty || amount <= 0 || _expenseDate == null) {
      return;
    }

    return widget.addTransaction(title, amount, _expenseDate);
  }

  void _presentDatePicker() {
    print("pick a date");
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((date) {
      setState(()  {
        _expenseDate = date;
      });
    });
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
              controller: _titleController,
              onSubmitted: (_) => _onAddTransactionButton(),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _onAddTransactionButton(),
            ),
            Container(
              child: Row(
                children: [
                  Expanded(child: Text(_expenseDate != null ?DateFormat.yMd().format(_expenseDate): "No date chosen")),
                  FlatButton(
                      onPressed: _presentDatePicker,
                      child: Text(
                        "Pick dated",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                      ))
                ],
              ),
            ),
            RaisedButton(
              onPressed: _onAddTransactionButton,
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,
              child: Text("Add Transaction"),
            ),
          ],
        ),
      ),
    );
  }

  void onPressed() {}
}
