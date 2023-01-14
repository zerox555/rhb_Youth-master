class MoneyRecordM{

  double allowance;
  double amountSpent;


  MoneyRecordM(this.allowance, this.amountSpent);

  Map<String, dynamic> toJson() => {'month': DateTime.now().month, 'allowance': allowance, 'amountSpent': amountSpent, 'balance': calculateBalance()};

  static MoneyRecordM fromJson(Map<String, dynamic> json) => MoneyRecordM(json['allowance'], json['amountSpent']);


  double calculateBalance() {
    double balance = allowance - amountSpent;
    return balance;
  }

  double calculateAmountSpent() {
    // works with moneyRecordD, if month matches, then calculate amountSpent
    return amountSpent;
  }
}