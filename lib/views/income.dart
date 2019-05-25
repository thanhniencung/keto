import 'package:flutter/material.dart';
import '../shared/app_color.dart';

class Income extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: backgroundGray,
      body: IncomeWidget(),
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

  final List<String> entries = <String>["1", "1", "1", "1", "1", "1", "1", "1"];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(9.5),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 12.0),
                  child: new Image.asset('assets/images/shopping_bag.png',
                    width: 50.0,
                    height: 50.0,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Shopping",
                      style: TextStyle(color: Colors.black,fontSize: 16, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                      textDirection: TextDirection.rtl,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5.0),
                      child: Text(
                          "Buy a new t-shirt",
                          style: TextStyle(color: Colors.black,fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
    );
  }
}

