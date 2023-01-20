import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Newtransaction extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final Function(String, double) callback;

  Newtransaction({required this.callback, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: const InputDecoration(labelText: "Title"),
            controller: titleController,
          ),
          TextField(
            decoration: const InputDecoration(labelText: "Amount"),
            controller: amountController,
          ),
          TextButton(
              child: const Text(
                  style: TextStyle(color: Colors.purple), "Add Transaction"),
              onPressed: () => callback(
                  titleController.text, double.parse(amountController.text))),
        ],
      ),
    ));
  }
}
