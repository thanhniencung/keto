import 'item_type.dart';

class Item {
  int id;
  int cateId;
  int cateName;
  String description;
  ItemType itemType;
  double money;

  Item({this.id, this.cateName, this.description, this.itemType, this.money});
}