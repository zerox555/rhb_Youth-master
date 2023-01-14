import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class weeklyGoalPage extends StatefulWidget {
  const weeklyGoalPage({Key? key}) : super(key: key);

  @override
  State<weeklyGoalPage> createState() => _weeklyGoalPage();
}

class _weeklyGoalPage extends State<weeklyGoalPage> {
  List<dynamic> weeklyGoals = [];
  List<double> progressGoals = [0.5, 0.8, 0.3];
  List<int> index = [0, 1, 2];

  @override
  Widget build(BuildContext context) {
    buildWeeklyGoals();
    return Scaffold(
        body: Center(
            child: ListView.builder(
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1.0, color: Colors.black),
              color: Colors.black.withOpacity(0.7),
            ),
            child: ListTile(
                title: const Text(
                  "Goals . . .",
                ),
                subtitle: SizedBox(
                  height: 20,
                  child: Stack(children: <Widget>[
                    LinearProgressIndicator(
                      backgroundColor: Colors.blueGrey,
                      value: progressGoals[index],
                      valueColor: const AlwaysStoppedAnimation(Colors.blue),
                      minHeight: 25,
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text("${(progressGoals[index] * 100).toInt()}%"),
                    )
                  ]),
                )));
      },
    )));
  }

  Future buildWeeklyGoals() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("WeeklyGoals")
        .doc("elFTYN0IChRCZO1fMLhY")
        .get();
    weeklyGoals = snapshot.get("goals");
    print(weeklyGoals[1]);
  }
}
