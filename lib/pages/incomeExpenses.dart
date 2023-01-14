import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class incomeExpenses extends StatefulWidget {
  const incomeExpenses({Key? key}) : super(key: key);

  @override
  State<incomeExpenses> createState() => _incomeExpenses();
}

class _incomeExpenses extends State<incomeExpenses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(10.h),
          child: AppBar(title: Text("Hey"))),
      body: Text("Hey"),
    );
  }
}
