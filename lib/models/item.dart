class Item{
  String itemId;
  String itemName;
  String itemDesc;

  Item(this.itemId,this.itemName,this.itemDesc);

  Map<String, dynamic> toJson() =>{
    'itemId':itemId,'itemName':itemName,'itemDesc':itemDesc};

  static Item fromJson(Map<String, dynamic> json) => Item(json['itemId'],json['itemName'],json['itemDesc']);
}