class WeeklyGoals{
  String weeklyGoalId;
  List<String> goalList;
  //store id of all goals in a week
  WeeklyGoals(this.weeklyGoalId,this.goalList);

  Map<String, dynamic> toJson() =>{'weeklyGoalId':weeklyGoalId,
    'goals':goalList};

  static WeeklyGoals fromJson(Map<String, dynamic> json) => WeeklyGoals(json['weeklyGoalId'],json['goals']);
}

