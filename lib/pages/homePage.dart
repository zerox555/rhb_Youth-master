import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rhb_youth/pages/weeklyGoalPage.dart';
import 'package:sizer/sizer.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePage();
}
class _homePage extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //Left Row
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  Container(
                    //alignment: Alignment.center,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(0),
                    height: 20.h,
                    width: 30.w,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors
                            .blue[200], // Background color
                      ),
                      onPressed: () {},
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.center,
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 5.h),
                          Expanded(
                            child: Image.asset(
                              "Image/montlydashboard.jpeg",
                              height: 40.h,
                              width: 40.w,
                            ),
                          ),
                          Expanded(
                              child: Text("DASHBOARD",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight:
                                      FontWeight.bold,
                                      fontSize: 8.sp)))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    //alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        left: 10, right: 10),
                    padding: EdgeInsets.all(0),
                    height: 20.h,
                    width: 30.w,
                    child: TextButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors
                            .blue[200], // Background color
                      ),
                      onPressed: () {},
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.center,
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 5.h),
                          Expanded(
                            child: Image.asset(
                              "Image/items.png",
                              height: 40.h,
                              width: 40.w,
                            ),
                          ),
                          Expanded(
                              child: Text("ITEMS",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight:
                                      FontWeight.bold,
                                      fontSize: 8.sp)))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
                height: 60.h,
                width: 35.w,
                child: Image.asset(
                  'Image/avatar.jpg',
                  //height: 50.h,
                  // width: 50.w,
                )),
          ),
          Column(
            children: [
              SizedBox(height: 10.h),
              Container(
                //alignment: Alignment.center,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(0),
                height: 20.h,
                width: 30.w,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors
                        .blue[200], // Background color
                  ),
                  onPressed: () {
                    _navigateToNextScreen(
                        context, weeklyGoalPage());
                  },
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.center,
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 5.h),
                      Expanded(
                        child: Image.asset(
                          "Image/achievement.png",
                          height: 40.h,
                          width: 40.w,
                        ),
                      ),
                      Expanded(
                          child: Text("WEEKLY \n GOALS",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight:
                                  FontWeight.bold,
                                  fontSize: 8.sp)))
                    ],
                  ),
                ),
              ),
              Container(
                //alignment: Alignment.center,
                height: 20.h,
                width: 30.w,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors
                        .blue[200], // Background color
                  ),
                  onPressed: () {},
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.center,
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 5.h),
                      Expanded(
                        child: Image.asset(
                          "Image/leaderboard.jpeg",
                          height: 40.h,
                          width: 40.w,
                        ),
                      ),
                      Expanded(
                          child: Text("LEADERBOARD",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight:
                                  FontWeight.bold,
                                  fontSize: 8.sp)))
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void _navigateToNextScreen(BuildContext context, page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
  }
}