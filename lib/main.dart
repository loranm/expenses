import 'package:flutter/material.dart';
import 'package:flutter_expenses/widgets/expense-form.dart';
import 'package:flutter_expenses/widgets/expenses-list.dart';
import 'data/transactions.dart';
import 'models/transaction.dart';
import 'widgets/appbar-actions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'QuickSand',
        // ignore: deprecated_member_use
        appBarTheme: AppBarTheme(textTheme: ThemeData.light().textTheme.copyWith(headline6: TextStyle(fontFamily: 'BigShoulder', fontSize: 20, fontWeight: FontWeight.bold,color: Colors.amberAccent))),
        textTheme: ThemeData.light().textTheme.copyWith(headline6: TextStyle(fontFamily: 'BigShoulder', fontWeight: FontWeight.bold, fontSize: 20))

      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _openNewTransactionSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return ExpenseForm(addTransaction: _addTransaction);
        });
  }

  void _addTransaction(String title, double amount) {
    final newTransaction = Transaction(
        id: 'id', title: title, amount: amount, date: DateTime.now());

    setState(() => {transactions.add(newTransaction)});
    Navigator.of(context).pop();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Personal Expenses"),
          actions: <Widget>[AppbarActions(openDialog: () => _openNewTransactionSheet(context))],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _openNewTransactionSheet(context),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  child: Card(
                elevation: 5,
                color: Theme.of(context).primaryColor,
                child: Text("charts"),
              )),
              ExpensesList(transactions: transactions),
            ],
          ),
        ));
  }
}
