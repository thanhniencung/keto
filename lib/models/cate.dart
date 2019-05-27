class Cate {
  int cateId;
  String cateName;

  Cate({this.cateId, this.cateName});

  Cate.fromMap(Map<String, dynamic> map) {
    this.cateId = map['cateId'];
    this.cateName = map['cateName'];
  }
}