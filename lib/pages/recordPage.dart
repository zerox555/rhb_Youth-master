import 'package:flutter/material.dart';
import 'package:rhb_youth/pages/incomeExpenses.dart';

class recordPage extends StatefulWidget {
  const recordPage({Key? key}) : super(key: key);

  @override
  State<recordPage> createState() => _recordPage();
}

class _recordPage extends State<recordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => incomeExpenses()));
          },
        ),
        body: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(children: [
                  Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.blue)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            boxes("Income"),
                            divider(),
                            boxes("Expenses"),
                            divider(),
                            boxes("Balance"),
                            // cardStuff(),
                          ])),
                ])),
            cardStuff("pocket money", "20", Colors.green),
            cardStuff("food", "50", Colors.red),
          ],
        ));
  }

  Column boxes(String text) {
    return Column(children: [
      Text(
        text,
        style: const TextStyle(fontSize: 15, color: Colors.white),
      ),
      const Text("0", style: TextStyle(fontSize: 15, color: Colors.white))
    ]);
  }

  SizedBox divider() {
    return const SizedBox(
      height: 26,
      width: 20,
      child: VerticalDivider(thickness: 1, width: 1, color: Colors.grey),
    );
  }

  SizedBox cardStuff(String title, String amount, Color? color) {
    return SizedBox(
        height: 40,
        child: ListTile(
            title: Text(title),
            trailing: Text(
              amount,
              style: TextStyle(fontSize: 20, color: color),
            )));
  }
}
