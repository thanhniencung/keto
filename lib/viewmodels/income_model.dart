import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class IncomeModel extends ChangeNotifier {
  String _cateName;
  String _description;


  String get cateName => _cateName;

  set cateName(String value) {
    _cateName = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  static IncomeModel of(BuildContext context) {
    return Provider.of<IncomeModel>(context);
  }

  Stream<QuerySnapshot> syncIncomeTransactions() {
    return Firestore.instance.collection('transactions')
        .where('type', isEqualTo: "Income")
        //.orderBy("timestamp", descending: true)
        .limit(100)
        .snapshots();
  }

}