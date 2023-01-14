class MoneyRecordD{
  DateTime date;
  double foodAmount;
  double shoppingAmount;
  double entertainmentAmount;
  double othersAmount;

  MoneyRecordD(this.date, this.foodAmount, this.shoppingAmount, this.entertainmentAmount, this.othersAmount);

  Map<String, dynamic> toJson() => {'date': date, 'foodAmount': foodAmount, 'shoppingAmount': shoppingAmount, 'entertainmentAmount': entertainmentAmount, 'othersAmount': othersAmount, 'totalSpent': calculateTotalSpent()};

  static MoneyRecordD fromJson(Map<String, dynamic> json) => MoneyRecordD(json['date'], json['foodAmount'], json['shoppingAmount'], json['entertainmentAmount'], json['othersAmount']);


  double calculateTotalSpent() {
    double totalSpent = foodAmount + shoppingAmount + entertainmentAmount + othersAmount;
    return totalSpent;
  }
}