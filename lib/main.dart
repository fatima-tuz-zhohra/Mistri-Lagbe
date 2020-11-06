import 'dart:ui';

import 'package:Mistri_Lagbe/user/user.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_core/firebase_core.dart';

import 'SignInPage.dart';
//import 'database.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(new Signup());
}

class Signup extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        // Initialize FlutterFire:
        future: _initialization,
        builder: (context, snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            return SomethingWentWrong(snapshot.error);
          }

          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return FullApp();
          }

          // Otherwise, show something whilst waiting for initialization to complete
          return Loading();
        });
  }
}

Widget SomethingWentWrong(Object error) {
  return new MaterialApp(
      home: new Scaffold(
          appBar: new AppBar(),
          body: Text("Something went wrong! $error}")
      )
  );
}

Widget Loading() {
  return new MaterialApp(home: CircularProgressIndicator());
}

Widget FullApp() {
  return new MaterialApp(
      title: "Sign Up",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Row(children: [
            Image.asset(
              "images/app_icon.png",
              height: 24,
              width: 24,
            ),
            new SizedBox(width: 8),
            new Text("Mistri Lagbe")
          ]),
          backgroundColor: Color(0xFF1976D2),
        ),
        body: Builder(
            builder: (context) => SingleChildScrollView(
                child: new Container(
                    padding: EdgeInsets.all(16),
                    child: new Column(
                      children: [
                        TextField(
                            decoration: new InputDecoration(
                                prefixIcon: Icon(Icons.account_circle),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.green, width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 1.0),
                                ),
                                hintText: 'Enter Full Name')),
                        const SizedBox(height: 12),
                        TextField(
                            decoration: new InputDecoration(
                                prefixIcon: Icon(Icons.map),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.green, width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 1.0),
                                ),
                                hintText: 'Enter Address')),
                        const SizedBox(height: 12),
                        TextField(
                            decoration: new InputDecoration(
                                prefixIcon: Icon(Icons.phone),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.green, width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 1.0),
                                ),
                                hintText: 'Enter Phone Numer')),
                        const SizedBox(height: 12),
                        TextField(
                            decoration: new InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.green, width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 1.0),
                                ),
                                hintText: 'Enter Email')),
                        const SizedBox(height: 12),
                        TextField(
                            decoration: new InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.green, width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 1.0),
                                ),
                                hintText: 'Enter Password')),
                        const SizedBox(height: 12),
                        RaisedButton(
                          onPressed: () {
                            /* var user = User();
                            user.name = "Elma";
                            user.email = "test@test.com";
                            user.address = "Address";
                            user.phone = "017xxxxxx";
                            saveUser(user);*/
                          },
                          color: Colors.blueGrey,
                          textColor: Colors.white,
                          child: Text(
                            "Sign Up",
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          "Already Have An Account!",
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          "Then",
                          style: TextStyle(fontSize: 15),
                        ),
                        RaisedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignIn()),
                            );
                          },
                          color: Colors.blueGrey,
                          textColor: Colors.white,
                          child: Text(
                            "Sign In",
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        SizedBox(height: 70),
                        Text(
                          "Or Sign Up with",
                          style: TextStyle(fontSize: 15),
                        ),
                        new Row(
                          children: [
                            SizedBox(width: 30),
                            RaisedButton(
                                onPressed: () {
                                  _launchURL("fb://profile");
                                },
                                color: Color(0xFF1976D2),
                                textColor: Colors.white,
                                child: new Row(children: [
                                  Image.asset(
                                    "images/facebook_icon.png",
                                    height: 24,
                                    width: 24,
                                  ),
                                  new SizedBox(width: 8),
                                  new Text("Facebook")
                                ])),
                            SizedBox(width: 30),
                            RaisedButton(
                              onPressed: () {
                                _launchURL("http://www.google.com/account");
                              },
                              color: Color(0xFF1976D2),
                              textColor: Colors.white,
                              child: new Row(children: [
                                Image.asset(
                                  "images/google_icon.png",
                                  height: 24,
                                  width: 24,
                                ),
                                new SizedBox(width: 8),
                                new Text("Google")
                              ]),
                            ),
                            //SizedBox(width: 30),
                          ],
                        )
                      ],
                    )))),
      ));
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
