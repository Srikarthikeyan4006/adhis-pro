import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _auth = FirebaseAuth.instance;
  final _store = FirebaseFirestore.instance;
  bool spinner = false;
  bool _showPassword = true;
  String UserName;
  String email;
  String password;
  String  Vec_Name,Vec_Num,Vec_Type;
  int Fine;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: spinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Register ',
                style: TextStyle(fontSize: 50.0, color: Colors.black),
              ),
              SizedBox(
                height: 25.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                cursorColor: Colors.black,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Architects',
                    fontSize: 20.0),
                onChanged: (value) {
                  //Do something with the user input.
                  UserName = value;
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'Enter your name',
                  labelStyle: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Architects',
                      fontSize: 20.0),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey, width: 4.0),
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                cursorColor: Colors.black,
                style: TextStyle(color: Colors.black, fontSize: 20.0),
                onChanged: (value) {
                  //Do something with the user input.
                  email = value;
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'Enter your email',
                  labelStyle: TextStyle(color: Colors.black, fontSize: 20.0),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey, width: 4.0),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                obscureText: _showPassword,
                cursorColor: Colors.black,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Architects',
                    fontSize: 20.0),
                onChanged: (value) {
                  password = value;
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'Password',
                  labelStyle: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Architects',
                      fontSize: 20.0),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.remove_red_eye,
                      color:this._showPassword ? Colors.blue : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() => this._showPassword = !this._showPassword);
                    },
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey, width: 4.0),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                cursorColor: Colors.black,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Architects',
                    fontSize: 20.0),
                onChanged: (value) {
                  //Do something with the user input.
                  Vec_Name = value;
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'Enter your Vehicle Name',
                  labelStyle: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Architects',
                      fontSize: 20.0),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey, width: 4.0),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                cursorColor: Colors.black,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Architects',
                    fontSize: 20.0),
                onChanged: (value) {
                  //Do something with the user input.
                  Vec_Num = value;
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'Enter your Vehicle Number',
                  labelStyle: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Architects',
                      fontSize: 20.0),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey, width: 4.0),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                cursorColor: Colors.black,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Architects',
                    fontSize: 20.0),
                onChanged: (value) {
                  //Do something with the user input.
                  Vec_Type = value;
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'Enter your Vehicle Type',
                  labelStyle: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Architects',
                      fontSize: 20.0),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey, width: 4.0),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  color: Colors.blue,
                  elevation: 5.0,
                  child: MaterialButton(
                    minWidth: 200.0,
                    height: 50.0,
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontFamily: 'Architects',
                        color: Colors.black,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: () async {
                      setState(() {
                        spinner = true;
                      });
                      try {
                        final newUser =
                            await _auth.createUserWithEmailAndPassword(
                                email: email, password: password);
                        if (newUser != null) {
                          _store.collection('Users').doc(email).set({
                            'MailId': email,
                            'User': UserName,
                            'Vehicle_Number':Vec_Num,
                            'Vehicle_Type':Vec_Type,
                            'Vehicle_Name':Vec_Name,
                            'Fine':'0'
                          });
                          Navigator.pushNamed(context, 'home');
                        }
                        setState(() {
                          spinner = false;
                        });
                      } catch (e) {
                        var error = e.message;
                        print(error);
                        if (error == null)
                          error = "Some fields are empty fill it";
                        setState(() {
                          spinner = false;
                        });
                      }
                    },
                  ),
                ),
              ),
              GestureDetector(
                  child: Text(
                    "Already have an account",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontFamily: 'Architects',
                        fontSize: 25.0,
                        color: Colors.blue),
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, 'login');
                  })
            ],
          ),
        ),
      ),
    );

  }
}
