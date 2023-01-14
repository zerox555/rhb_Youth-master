import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String id;
  String name;
  int age;
  DateTime birthday;
  int rhbPoints;
  int level;
  int ranking;
  int monthlyProgress;

  User(this.id, this.name, this.age, this.birthday,this.rhbPoints,this.level,this.ranking,this.monthlyProgress);

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'age': age, 'birthday': birthday,'rhbPoints':rhbPoints,'level':level,'ranking':ranking,'monthlyProgress':monthlyProgress};

  static User fromJson(Map<String, dynamic> json) => User(json['id'],
      json['name'], json['age'], (json['birthday'] as Timestamp).toDate(),json['rhbPoints'],json['level'],json['ranking'],json['monthlyProgress']);
}
