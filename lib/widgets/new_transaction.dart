import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Newtransaction extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final Function(String, double) callback;

  Newtransaction({required this.callback, super.key});

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = !amountController.text.isEmpty
        ? double.parse(amountController.text)
        : -1.0;

    // doing some null checking
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      print("Input is invalid");
      return;
    }

    callback(enteredTitle, enteredAmount);
  }

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
            onSubmitted: (_) => submitData(),
          ),
          TextField(
            decoration: const InputDecoration(labelText: "Amount"),
            controller: amountController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitData(),
          ),
          TextButton(
            child:
                Text(style: TextStyle(color: Colors.purple), "Add Transaction"),
            onPressed: submitData,
          )
        ],
      ),
    ));
  }
}
