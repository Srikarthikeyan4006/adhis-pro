import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'login.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _auth = FirebaseAuth.instance;
  final _store = FirebaseFirestore.instance;
  bool spinner =false;
  List<Map> Details=List();
  String name="null";
  String num="null";
  String type="null";
  String fine="null";
  String mail;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getuser();
    getdata();

  }
  void getuser() async{
    setState(() {
      spinner=true;
    });
    final User user = _auth.currentUser;
    mail = user.email;

  }
  void getdata() async{
    final snapshots = await _store.collection("Users").where('MailId', isEqualTo:mail ).get();
    for (var m in snapshots.docs) {
      var t = m.data();
      name=t['Vehicle_Name'];
      type=t['Vehicle_Type'];
      fine=t['Fine'];
      num =t['Vehicle_Number'];

    }
    setState(() {
      spinner=false;
    });

  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App'),
        actions: [
          IconButton(
              icon: Icon(
                Icons.close,
              ),
              onPressed: () {
                _auth.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Login()));
              }),
        ],
      ),
      body: ModalProgressHUD(
        inAsyncCall: spinner,
        child: Container(
           child:Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.stretch,
             children: [
               Text('Hello  '+ mail ,textAlign: TextAlign.center,style: TextStyle(
                 fontSize: 40.0
               ),),
               SizedBox(
                 height: 30.0,
               ),
               Text('Vehicle Number  :'+ num ,textAlign: TextAlign.center,style: TextStyle(
                   fontSize: 30.0
               ),),
               SizedBox(
                 height: 10.0,
               ),
               Text('Vehicle Type  :'+type ,textAlign: TextAlign.center,style: TextStyle(
                   fontSize: 30.0
               ),),
               SizedBox(
                 height: 10.0,
               ),
               Text('Vehicle Name  :'+ name,textAlign: TextAlign.center,style: TextStyle(
                   fontSize: 30.0
               ),),
               Text('Fine  :'+ fine,textAlign: TextAlign.center,style: TextStyle(
                   fontSize: 30.0
               ),),




             ],
           ),
        ),
      ),
    );
  }
}
