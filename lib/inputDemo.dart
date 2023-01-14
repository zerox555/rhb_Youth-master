import 'dart:async';

// flutter and ui libraries
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rhb_youth/models/listing.dart';
import 'package:rhb_youth/models/marketplace.dart';
import 'package:rhb_youth/models/monthlyDashboard.dart';
import 'package:rhb_youth/models/user.dart';
import 'package:rhb_youth/models/weeklyGoal.dart';
import 'package:rhb_youth/pages/weeklyGoalPage.dart';

import 'models/item.dart';
import 'models/leaderboard.dart';
import 'models/moneyRecordD.dart';
import 'models/moneyRecordM.dart';
import 'models/tabung.dart';
import 'models/task.dart';

class inputDemo extends StatefulWidget {
  const inputDemo({Key? key}) : super(key: key);

  @override
  State<inputDemo> createState() => _inputDemoState();
}

class _inputDemoState extends State<inputDemo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Builder(
            builder: (context) => Scaffold(
                    body: Center(
                        child: Column(
                  children: [
                    ElevatedButton(
                        onPressed: () => {_insertDummyTask("task 1")},
                        child: Text("task")),
                    ElevatedButton(onPressed: () {}, child: Text("avatar")),
                    ElevatedButton(
                        onPressed: () {
                          _insertDummyWeeklyGoal();
                          _navigateToNextScreen(context, weeklyGoalPage());
                        },
                        child: Text("WeeklyGoal")),
                    ElevatedButton(
                        onPressed: () {
                          _insertDummyItem("gold of malice");
                        },
                        child: Text("item")),
                    ElevatedButton(
                        onPressed: () {
                          _insertDummyDashboard();
                        },
                        child: Text("MonthlyDashboard")),
                    ElevatedButton(
                        onPressed: () {
                          _insertDummyListing();
                        },
                        child: Text("Listing")),
                    ElevatedButton(
                        onPressed: () {
                          _insertDummyMarketPlace();
                        },
                        child: Text("marketplace")),
                    ElevatedButton(
                        onPressed: () {
                          _insertDummyUser("df");
                        },
                        child: Text("user")),
                    ElevatedButton(
                        onPressed: () {
                          _insertLeaderboard();
                        },
                        child: Text("leaderboard")),
                    ElevatedButton(
                        onPressed: () {
                          _insertTabung();
                        },
                        child: Text("tabung")),
                    ElevatedButton(
                        onPressed: () {
                          _insertMoneyRecordD();
                        },
                        child: Text("MoneyRecordD")),
                    ElevatedButton(
                        onPressed: () {
                          _insertMoneyRecordM();
                        },
                        child: Text("MoneyRecordM")),
                  ],
                )))));
  }

  Future _insertDummyTask(String taskName) async {
    final docTask = FirebaseFirestore.instance.collection('tasks').doc();
    final task = Task(docTask.id, taskName, 12, [1, 2]);
    final json = task.toJson();

    await docTask.set(json);
  }

  Future _insertDummyUser(String name) async {
//reference to document
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    final user =
        User(docUser.id, name, 21, DateTime(2001, 7, 28), 1000, 1, 23, 12);
    final json = user.toJson();

    await docUser.set(json);
  }

  Future _insertDummyWeeklyGoal() async {
    final docWeeklyGoal =
        FirebaseFirestore.instance.collection("WeeklyGoals").doc();
    final goal =
        WeeklyGoals("weekgoals", ["Goal #1", "Goal #2", "Goal #3"]);
    final json = goal.toJson();

    await docWeeklyGoal.set(json);
  }

  Future _insertDummyItem(String itemName) async {
    final docItem = FirebaseFirestore.instance.collection("items").doc();
    final item = Item(docItem.id, itemName, "This is an item");
    final json = item.toJson();

    await docItem.set(json);
  }

  Future _insertDummyDashboard() async {
    final docDashboard =
        FirebaseFirestore.instance.collection('MonthlyDashboards').doc();
    final dashboard = MonthlyDashboard(docDashboard.id, 30, [
      {1: "G2FjDTLZUIa5upI1g0i2"},
      {9: "TCYnXDFuEqMaPInDAh8D"}
    ]);
    final json = dashboard.toJson();
    //
    await docDashboard.set(json);
  }

  Future _insertDummyListing() async {
    final docListing = FirebaseFirestore.instance.collection("listings").doc();
    final listing = Listing(docListing.id, DateTime(2001, 2, 4), 500);
    final json = listing.toJson();

    await docListing.set(json);
  }

  Future _insertDummyMarketPlace() async {
    final docMarketPlace =
        FirebaseFirestore.instance.collection("marketPlace").doc();
    final marketPlace =
        MarketPlace(['3r9F8bIVdcMsDln3ZrHs', 'Xv5uL7qgAaIfmfjRbKQU']);
    final json = marketPlace.toJson();

    await docMarketPlace.set(json);
  }

  Future _insertLeaderboard() async {
    final docLeaderboard =
        FirebaseFirestore.instance.collection('leaderboard').doc();
    final leaderboard = Leaderboard(
        ["ihfpMhJmqfnQhKacBfey", "XEUJYhQYlGxOYeSn1l2A"], DateTime.now());
    final json = leaderboard.toJson();

    await docLeaderboard.set(json);
  }

  Future _insertTabung() async {
    final docLeaderboard =
        FirebaseFirestore.instance.collection('tabung').doc();
    final tabung =
        Tabung(5300.00, 'Get a life', 'ihfpMhJmqfnQhKacBfey', 10500.00);
    final json = tabung.toJson();

    await docLeaderboard.set(json);
  }

  Future _insertMoneyRecordD() async {
    final docMoneyRecordD =
        FirebaseFirestore.instance.collection('moneyRecordD').doc();
    final moneyRecordD =
        MoneyRecordD(DateTime.now(), 100.00, 50.00, 25.00, 5.00);
    final json = moneyRecordD.toJson();

    await docMoneyRecordD.set(json);
  }

  Future _insertMoneyRecordM() async {
    final docMoneyRecordM =
        FirebaseFirestore.instance.collection('moneyRecordM').doc();
    final moneyRecordM = MoneyRecordM(200.00, 180.00);
    final json = moneyRecordM.toJson();

    await docMoneyRecordM.set(json);
  }

// Future _insertDummyAvatar(String avatarName) async {
//   final docAvatar = FirebaseFirestore.instance.collection('avatar').doc();
//   final goal = Goal(docGoal.id,goalName,12,[1,2]);
//   final json = goal.toJson();
//
//   await docGoal.set(json);
// }

  // Future _insertDummyAvatar(String avatarName) async {
  //   final docAvatar = FirebaseFirestore.instance.collection('avatar').doc();
  //   final goal = Goal(docGoal.id,goalName,12,[1,2]);
  //   final json = goal.toJson();
  //
  //   await docGoal.set(json);
  // }

  void _navigateToNextScreen(BuildContext context, page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
  }
}
