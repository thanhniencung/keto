import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardModel extends ChangeNotifier {

  static DashboardModel of(BuildContext context) {
    return Provider.of<DashboardModel>(context);
  }

  Future<double> statistics(String type) async {
    double result = 0;

    QuerySnapshot _myDoc =
    await Firestore.instance.collection('transactions')
                   .where('type', isEqualTo: type)
                   .getDocuments();

    List<DocumentSnapshot> docs = _myDoc.documents;
    docs.forEach(((doc) {
      result += doc['amount'];
    }));

    return result;
  }
}