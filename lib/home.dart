// dart async library you will refer to when setting up real time updates
import 'dart:async';

// flutter and ui libraries
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rhb_youth/models/user.dart';
import 'package:rhb_youth/pages/homePage.dart';
import 'package:rhb_youth/pages/investmentPage.dart';
import 'package:rhb_youth/pages/recordPage.dart';
import 'package:rhb_youth/pages/weeklyGoalPage.dart';
import 'package:sizer/sizer.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var currentSelectecUserId;
  int _selectedIndex = 0;

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screens = [
      recordPage(),
      investmentPage(),
      homePage(),
      //marketplace(),
      //tabung(),
    ];
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
            theme: ThemeData(fontFamily: 'Skranji'),
            home: Builder(
                builder: (context) => Scaffold(
                      backgroundColor: Colors.blue[900],
                      appBar: PreferredSize(
                        preferredSize: Size.fromHeight(18.h),
                        // here the desired height
                        child: AppBar(
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                          flexibleSpace: Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.vertical(
                                bottom: Radius.circular(20),
                              ),
                              color: Colors.blue[200],
                            ),
                            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 33.h,
                                  width: 33.w,
                                  child: Image.asset(
                                    'Image/profile.png',
                                    height: 38.h,
                                    width: 38.w,
                                  ),
                                ),
                                Container(
                                  width: 35.w,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 6.h),
                                      Text("LEVEL 12", //userLevel
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              //fontFamily: 'Inter',
                                              fontSize: 20.sp)),
                                      Text("Ming Xuan", //userName
                                          style: TextStyle(
                                              color: Colors.white,
                                              //fontWeight: FontWeight.w100,
                                              //fontFamily: 'Luky',
                                              fontSize: 16.sp)),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 3.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 5.6.h),
                                    Container(
                                      height: 5.h,
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'Image/pts.png',
                                            height: 10.h,
                                            width: 10.w,
                                          ),
                                          Text("1000", //userName
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16.sp)),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 5.h,
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'Image/coins.png',
                                            height: 10.h,
                                            width: 10.w,
                                          ),
                                          Text("100", //userName
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16.sp))
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      body: Center(
                        child: screens[_selectedIndex]
                      ),
                      bottomNavigationBar: Container(
                        height: 15.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black38,
                                spreadRadius: 0,
                                blurRadius: 10),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          ),
                          child: BottomNavigationBar(
                            backgroundColor: Colors.blue[200],
                            type: BottomNavigationBarType.fixed,
                            selectedItemColor: Colors.blue[900],
                            //unselectedItemColor: Colors.blue[100],
                            items: const <BottomNavigationBarItem>[
                              BottomNavigationBarItem(
                                  icon: Icon(Icons.wallet, size: 40),
                                  label: "Record"),
                              BottomNavigationBarItem(
                                  icon: Icon(Icons.money, size: 40),
                                  label: "Investment"),
                              BottomNavigationBarItem(
                                  icon: Icon(Icons.home, size: 40),
                                  label: "Home"),
                              BottomNavigationBarItem(
                                  icon: Icon(
                                    Icons.store,
                                    size: 40,
                                  ),
                                  label: "Market"),
                              BottomNavigationBarItem(
                                  icon: Icon(Icons.monetization_on, size: 40),
                                  label: "Tabung"),
                            ],
                            currentIndex: _selectedIndex,
                            onTap: _onItemTapped,
                          ),
                        ),
                      ),
                    )));
      },
    );
  }


}
