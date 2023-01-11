import 'package:flutter/foundation.dart';

// a blueprint for a dart object
class Transaction {
  final String? id;
  final String? title;
  final double? cost;
  final DateTime? date;

  Transaction(
      {
      required String this.id,
      required String this.title,
      required double this.cost,
      required DateTime this.date
      });
}
