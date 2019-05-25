import 'package:flutter/material.dart';
import '../shared/app_color.dart';

class TakeNote extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Take note"),
        backgroundColor: primary,
        leading: IconButton(
          icon: Icon(Icons.close),
          padding: EdgeInsets.all(4.0),
          iconSize: 34.0,
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: TakeNodeStateFulWidget(),
    );
  }
}


class TakeNodeStateFulWidget extends StatefulWidget {
  TakeNodeStateFulWidget({Key key}) : super(key: key);

  @override
  _TakeNodeState createState() => _TakeNodeState();
}

class _TakeNodeState extends State<TakeNodeStateFulWidget> {

  static List<String> _categorys = ["Shopping", "Income", "Timisoara", "Brasov", "Constanta"];
  static List<String>  _types = ["Outcome", "Income"];

  List<DropdownMenuItem<String>> _cateDropDownMenuItems;
  List<DropdownMenuItem<String>> _typeDropDownMenuItems;

  String _currentCate;
  String _currentType;

  @override
  void initState() {
    _cateDropDownMenuItems = getDropDownMenuItems(_categorys);
    _typeDropDownMenuItems = getDropDownMenuItems(_types);

    _currentCate = _cateDropDownMenuItems[0].value;
    _currentType = _typeDropDownMenuItems[0].value;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      return new Container(
        margin: EdgeInsets.only(top: 15.0),
        padding: EdgeInsets.all(15.0),
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child:  DropdownButton(
                  iconEnabledColor: primary,
                  isExpanded: true,
                  value: _currentCate,
                  items: _cateDropDownMenuItems,
                  onChanged: changedCateDropDownItem,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child:  DropdownButton(
                  iconEnabledColor: primary,
                  isExpanded: true,
                  value: _currentType,
                  items: _typeDropDownMenuItems,
                  onChanged: changedTypeDropDownItem,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: TextFormField(
                  decoration: new InputDecoration(
                    labelText: "Description",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(7.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 40,
              ),
              RaisedButton(
                onPressed: () {
                  print("click");
                },
                color: primary,
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(7.0)),
                child: SizedBox(
                  width: 250,
                  height: 50,
                  child: Center(
                    child: Text(
                      "Submit",
                      style: TextStyle(fontSize: 17, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems(List<String> data) {
    List<DropdownMenuItem<String>> items = new List();
    for (String city in data) {
      items.add(new DropdownMenuItem(
          value: city,
          child: new Text(city)
      ));
    }
    return items;
  }

  void changedCateDropDownItem(String itemSelected) {
    setState(() {
      _currentCate = itemSelected;
    });
  }

  void changedTypeDropDownItem(String itemSelected) {
    setState(() {
       _currentType = itemSelected;
    });
  }

}
