import 'package:flutter/material.dart';
import 'transaction.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Personal Expense Tracker'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String? title;
  const MyHomePage({super.key, required String this.title});

  static List<Transaction> transactions = [
    Transaction(id: "t1", title: "shoes", cost: 50, date: DateTime.now()),
    Transaction(
        id: "t2", title: "something else", cost: 10, date: DateTime.now()),
    Transaction(id: "t4", title: "guitar", cost: 12, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title!)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('Chart!'),
              elevation: 5,
            ),
          ),
          Column(
            children: transactions.map((tx) {
              return Card(
                  child: Row(
                children: [
                  Container(child: Text(tx.cost.toString())),
                  Column(
                    children: [
                      Text(tx.title!),
                      Text(tx.date.toString()),
                    ],
                  )
                ],
              ));
            }).toList(),
          ),
        ],
      ),
    );
  }
}
