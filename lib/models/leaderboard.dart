class Leaderboard{
  List<String> userList;
  DateTime lastUpdatedTime;

  Leaderboard(this.userList, this.lastUpdatedTime);

  Map<String, dynamic> toJson() => {'users': userList, 'lastUpdatedTime': lastUpdatedTime};

  static Leaderboard fromJson(Map<String, dynamic> json) => Leaderboard(json['users'], json['lastUpdatedTime']);
}