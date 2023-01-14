class Task{
  String taskID;
  String taskName;
  int taskPoints;
  List<int> taskProgress;
  //[currentprogress,endprogress]

  Task(this.taskID,this.taskName,this.taskPoints,this.taskProgress);

  Map<String, dynamic> toJson() =>{
    'taskID':taskID, 'taskName': taskName, 'taskPoints': taskPoints.toString(), 'taskProgress' : taskProgress};

  static Task fromJson(Map<String, dynamic> json) => Task(json['goalId']!,
      json['taskName']!,json['taskPoints'], json['taskProgress']);
}