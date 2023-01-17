import 'package:flutter/material.dart';
import 'transaction.dart';
import 'package:intl/intl.dart';

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
      home: MyHomePage(title: 'Personal Expense Tracker'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String? title;
  MyHomePage({super.key, required String this.title});
  final titleController = TextEditingController();
  final amountController = TextEditingController();

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
          // Transaction Input card
          Card(
              child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: "Title"),
                  controller: titleController,
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Amount"),
                  controller: amountController,
                ),
                TextButton(
                    child: const Text(
                        style: TextStyle(color: Colors.purple),
                        "Add Transaction"),
                    onPressed: () => print(titleController.text)),
              ],
            ),
          )),
          // Transactions List
          Column(
            children: transactions.map((tx) {
              return Card(
                  child: Row(
                children: [
                  Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.purple,
                          width: 2,
                        ),
                      ),
                      child: Text(
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple,
                          ),
                          "\$${tx.cost.toString()}")),
                  Column(
                    //
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(tx.title!,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                      Text(
                        DateFormat.yMMMMd().format(tx.date!),
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
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
