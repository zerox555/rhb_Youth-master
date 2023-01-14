class Listing{
  String listerId;
  DateTime listTime;
  int listedPrice;

  Listing(this.listerId,this.listTime,this.listedPrice);

  Map<String, dynamic> toJson() =>{
    'listerId':listerId,'listTime':listTime,'listedPrice':listedPrice};

  static Listing fromJson(Map<String, dynamic> json) => Listing(json['listerId'],json['listTime'],json['listedPrice']);
}