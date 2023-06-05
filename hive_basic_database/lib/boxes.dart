import 'package:hive/hive.dart';
import 'package:hive_basics/model/transaction.dart';
import 'package:hive_basics/page/transaction_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Boxes {
  static Box<Transaction> getTransactions() =>
      Hive.box<Transaction>('transactions');
}