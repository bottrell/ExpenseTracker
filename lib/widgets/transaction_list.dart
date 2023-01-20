import 'package:expensetracker/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList({required this.transactions, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
              child: Row(
            children: [
              Container(
                  padding: const EdgeInsets.all(10),
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
                      "\$${transactions[index].cost.toString()}")),
              Column(
                //
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(transactions[index].title!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15)),
                  Text(
                    DateFormat.yMMMMd().format(transactions[index].date!),
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              )
            ],
          ));
        },
        itemCount: transactions.length,
      ),
    );
  }
}
