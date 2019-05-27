import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class TakeNoteModel extends ChangeNotifier {
  static List<String>  _types = ["Outcome", "Income"];

  String _description;
  String _currentCate;
  String _currentLabelCate;
  String _errorMsg;
  String _done;
  String _currentType = _types[0];
  bool _isSubmitingData = false;

  String get getCurrentCate => _currentCate;
  String get getCurrentType => _currentType;
  String get getDescription => _description;
  String get getErrorMsg => _errorMsg;
  bool get isSubmitingData => _isSubmitingData;

  List<String> get getTypes => _types;

  static TakeNoteModel of(BuildContext context) {
    return Provider.of<TakeNoteModel>(context);
  }
  
  Stream<QuerySnapshot> syncCateList() {
    return Firestore.instance.collection('cate').snapshots();
  }

  void changedCateDropDownItem(String itemKeySelected, String itemLabelSelected) {
    _currentCate = itemKeySelected;
    _currentLabelCate = itemLabelSelected;

    print(itemLabelSelected);

    notifyListeners();
  }

  void changedTypeDropDownItem(String itemSelected) {
    _currentType = itemSelected;
    notifyListeners();
  }

  void currentCate(String newItem) {
    _currentCate = newItem;
  }

  void currentCateLabel(String newItem) {
    _currentLabelCate = newItem;
  }

  void description(String newItem) {
    _description = newItem;
  }

  void validateAndSubmit() {
    _errorMsg = null;

    if (_description == null || _currentCate == null || _currentType == null) {
      _errorMsg = "Please fill in all fields";
    }

    if (_description.length < 6) {
      _errorMsg = "Description too short";
    }

    if (_errorMsg == null) {
      save();
    }
  }

  void save() {
    print("add data to firestore");
    _isSubmitingData = true;
    notifyListeners();

    Firestore.instance
    .collection('transactions')
    .add({
      "cateId": _currentCate,
      "cateName": _currentLabelCate,
      "type": _currentType, // income or outcome
      "icon": "assets/images/shopping_bag.png"
    })
    .then((result) => {
      _isSubmitingData = false,
      notifyListeners()
    })
    .catchError((err) => {
      _errorMsg = "Internal error",
      _isSubmitingData = false,
      notifyListeners()
    });
  }
}