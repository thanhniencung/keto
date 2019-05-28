import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:keto/shared/app_color.dart';
import 'package:keto/viewmodels/income_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

class Income extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: backgroundGray,
      body: ChangeNotifierProvider<IncomeModel>(
        builder: (_) => IncomeModel(),
        child: IncomeWidget(),
      ),
    );
  }
}

class IncomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IncomeStateWidget();
  }
}

class _IncomeStateWidget extends State<IncomeWidget> {
  @override
  Widget build(BuildContext context) {
    final model = IncomeModel.of(context);

    return StreamBuilder<QuerySnapshot>(
        stream: model.syncIncomeTransactions(),
        builder: (context, snapshot) {

          if (snapshot.hasError) {
            return showEmptyView(snapshot.error.toString());
          }

          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());

            default:
              if (snapshot.data.documents.isEmpty) {
                return showEmptyView("Empty transaction");
              }

              return new ListView.builder(
                  itemCount: snapshot.data.documents.length ,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot document = snapshot.data.documents[index];

                    FlutterMoneyFormatter fmf = FlutterMoneyFormatter(amount: document['amount']);
                    MoneyFormatterOutput fo = fmf.output;

                    return  new Card(
                      child: new ListTile(
                          onTap:null,
                          leading: new CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: new Image.asset(document['icon']),
                          ),
                          title: Row(
                            children: <Widget>[
                              Text(document['cateName']),
                              Text("  +${fo.compactNonSymbol}", style: TextStyle(fontSize: 13, color: Colors.green, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          subtitle: Text(document['des']),
                      )
                    );
                  }
              );
          }
        }
    );
  }

  Widget showEmptyView(msg) {
    return Center(
      child: Text(msg),
    );
  }
}

