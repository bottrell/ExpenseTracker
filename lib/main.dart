import 'package:expensetracker/widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'models/transaction.dart';
import 'widgets/transaction_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expense Tracker',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(title: 'Personal Expense Tracker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String? title;
  MyHomePage({super.key, required String this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // even though this is final, we can edit the list since this is stateful
  final List<Transaction> _userTransactions = [
    Transaction(id: "t1", title: "shoes", cost: 50, date: DateTime.now()),
    Transaction(
        id: "t2", title: "something else", cost: 10, date: DateTime.now()),
    Transaction(id: "t4", title: "guitar", cost: 12, date: DateTime.now()),
  ];

  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(
        cost: amount,
        date: DateTime.now(),
        title: title,
        id: "t${_userTransactions.length}");

    setState(() => _userTransactions.add(newTx));
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return Newtransaction(callback: _addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title!),
          actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () => _startAddNewTransaction(context)),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Top level Chart to display transactions
            Container(
              width: double.infinity,
              child: const Card(
                color: Colors.blue,
                elevation: 5,
                child: Text('Chart!'),
              ),
            ),
            TransactionList(transactions: _userTransactions)
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context),
        ));
  }
}
