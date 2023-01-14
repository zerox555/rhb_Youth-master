// dart async library you will refer to when setting up real time updates
import 'dart:async';

// flutter and ui libraries
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rhb_youth/home.dart';
import 'package:rhb_youth/models/user.dart';

import 'inputDemo.dart';

Future main() async {
  //initialize firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//
//   var currentSelectecUserId;
//
//   final controller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//           body: StreamBuilder(
//             stream: readUsers(),
//             builder: (context, snapshot){
//               if(snapshot.hasData){
//                 final users = snapshot.data!;
//
//                 return ListView(
//                   children: users.map(buildUser).toList(),
//                 );
//               }else{
//                 return Center(child:CircularProgressIndicator());
//               }
//             }
//           ),
//           appBar: AppBar(
//             title: TextField(controller: controller),
//             actions: [IconButton(onPressed: () {
//               final name= controller.text;
//
//               createUser(name);
//             }, icon: Icon(Icons.add))],
//           ),
// floatingActionButton: FloatingActionButton(
//   onPressed: (){
//
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => const inputDemo()),
//     );
//   },
// ),
//         ),
//
//     );
//
//   }
//
// //   Widget buildUser(User user) => ListTile(
// //     leading: CircleAvatar(child: Text('${user.age}')),
// //     title: Text(user.name),
// //     subtitle: Text(user.birthday.toIso8601String()),
// //     onLongPress: () =>{ _deleteUser(user)} ,
// // onTap: () => {_updateUser(user)},
// //   );
// //
// //   Future _deleteUser(User user) async {
// //     //get the document id of the user object
// //     var data = await FirebaseFirestore.instance
// //         .collection("users")
// //         .where("id",isEqualTo: user.id)
// //         .get();
// //     setState(() {
// //       //because the query returns a list of docs, even if the result is 1 document. You need to access it using index[0].
// //       FirebaseFirestore.instance.collection("users").doc(data.docs[0].id).delete();
// //     });
// //   }
// //
// //   Future _updateUser(User user) async {
// //     //get the document id of the user object
// //     var data = await FirebaseFirestore.instance
// //         .collection("users")
// //         .where("id",isEqualTo: user.id)
// //         .get();
// //     setState(() {
// //       //because the query returns a list of docs, even if the result is 1 document. You need to access it using index[0].
// //       FirebaseFirestore.instance.collection("users").doc(data.docs[0].id).update(
// //           {
// //             'age' : 23
// //           });
// //     });
// //   }
// //   Stream<List<User>> readUsers() =>FirebaseFirestore.instance
// //       .collection('users')
// //   .snapshots()
// //   .map((snapshot) =>
// //   snapshot.docs.map((doc) =>User.fromJson(doc.data())).toList());
//
// //   Future createUser(String name) async {
// // //reference to document
// //     final docUser = FirebaseFirestore.instance.collection('users').doc();
// //     final user = User(docUser.id,name,21,DateTime(2001,7,28));
// //     final json = user.toJson();
// //
// //     await docUser.set(json);
// //   }
// }
