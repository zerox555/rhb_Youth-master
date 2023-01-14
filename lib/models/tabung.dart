class Tabung{
  double savedMoney;
  String goalDescription;
  String goalID;
  double goalAmount;

  Tabung(this.savedMoney, this.goalDescription, this.goalID, this.goalAmount);

  Map<String, dynamic> toJson() => {'savedMoney': savedMoney, 'goal': goalDescription, 'goalID': goalID, 'goalAmount': goalAmount, 'goalProgress': calculateGoalProgress()};

  static Tabung fromJson(Map<String, dynamic> json) => Tabung(json['savedMoney'], json['goal'], json['goalID'], json['goalAmount']);

  int calculateGoalProgress() {
    int goalProgress = (savedMoney/goalAmount * 100).toInt();
    return goalProgress;
  }
}



