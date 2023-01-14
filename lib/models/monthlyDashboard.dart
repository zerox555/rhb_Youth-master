class MonthlyDashboard{
  //each item reward corresponds to a number on the board
  //snakes and ladders
  int boardSize;
  List<Map<int,String>> prizeMap;
  String dashboardId;

  MonthlyDashboard(this.dashboardId,this.boardSize,this.prizeMap);

  //TODO: fix nestedlist
  Map<String, dynamic> toJson() =>{
    'dashboardId':dashboardId,'boardSize':boardSize,'prizeMap':prizeMap};

  static MonthlyDashboard fromJson(Map<String, dynamic> json) => MonthlyDashboard(json['dashboardId'],json['boardSize'],json['prizeMap']);

}