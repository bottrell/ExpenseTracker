import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({super.key});

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
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
  
    setState( 
      () => _userTransactions.add(newTx)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Newtransaction(callback: _addNewTransaction),
      TransactionList(transactions: _userTransactions),
    ]);
  }
}
