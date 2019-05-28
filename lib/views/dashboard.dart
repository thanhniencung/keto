import 'package:flutter/material.dart';
import 'package:keto/viewmodels/dashboard_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ChangeNotifierProvider<DashboardModel>(
        builder: (_) => DashboardModel(),
        child: DashboardWidget(),
      )
    );
  }
}

class DashboardWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DashboaStateWidget();
  }
}

class _DashboaStateWidget extends State<DashboardWidget> {
  @override
  Widget build(BuildContext context) {
    final model = DashboardModel.of(context);

    return new Container(
      padding: EdgeInsets.all(20.0),
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  new Text(
                    "Statistics",
                    style: new TextStyle(color: Colors.red, fontSize: 17.0),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 15,
            ),
            FutureBuilder(
              future: model.statistics("Income"),
              builder: (context, snapshot) {

                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                FlutterMoneyFormatter fmf = FlutterMoneyFormatter(amount: snapshot.data);
                MoneyFormatterOutput fo = fmf.output;

                return Row(
                  children: <Widget>[
                    new Text(
                      "   Total income : ${fo.compactNonSymbol}",
                      style: new TextStyle(color: Colors.blue, fontSize: 22.0),
                    ),
                  ],
                );
              }
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 20,
            ),
            FutureBuilder(
                future: model.statistics("Outcome"),
                builder: (context, snapshot) {

                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }

                  FlutterMoneyFormatter fmf = FlutterMoneyFormatter(amount: snapshot.data);
                  MoneyFormatterOutput fo = fmf.output;

                  return Row(
                    children: <Widget>[
                      new Text(
                        "   Total outcome : ${fo.compactNonSymbol}",
                        style: new TextStyle(color: Colors.blue, fontSize: 22.0),
                      ),
                    ],
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}