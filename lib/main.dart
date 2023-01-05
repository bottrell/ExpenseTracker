import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title!)),
      body: Column(
        children: [
          Card(
              elevation: 5,
              child: Container(
                  width: double.infinity, child: Text("CHART GOES HERE"))),
          Card(
              child: Container(
                  width: double.infinity, child: Text("LIST OF TRANSACTIONS"))),
        ],
      ),
    );
  }
}
