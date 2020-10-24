import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'register.dart';
import 'login.dart';
import 'home.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    String s = (FirebaseAuth.instance.currentUser != null) ? 'home' : 'login';
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: s,
      routes: {
        'login': (context) => Login(),
        'register': (context) => Register(),
        'home': (context) => Home(),
      },
    );
  }
}
