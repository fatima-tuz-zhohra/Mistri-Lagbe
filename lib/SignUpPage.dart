import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'SignInPage.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FullApp();
  }

  Widget FullApp() {
    return new MaterialApp(
        title: "Sign Up",
        home: new Scaffold(
          appBar: createAppBar(),
          body: Builder(
              builder: (context) => SingleChildScrollView(
                  child: new Container(
                      padding: EdgeInsets.all(16),
                      child: new Column(
                        children: [
                          createInputField(
                              Icon(Icons.account_circle), 'Enter Full Name'),
                          const SizedBox(height: 12),
                          createInputField(Icon(Icons.map), 'Enter Address'),
                          const SizedBox(height: 12),
                          createInputField(
                              Icon(Icons.phone), 'Enter Phone Number'),
                          const SizedBox(height: 12),
                          createInputField(Icon(Icons.email), 'Enter Email'),
                          const SizedBox(height: 12),
                          createInputField(Icon(Icons.lock), 'Enter Password'),
                          const SizedBox(height: 12),
                          createSignUpButton(),
                          SizedBox(height: 12),
                          Text(
                            "Already Have An Account!",
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            "Then",
                            style: TextStyle(fontSize: 15),
                          ),
                          createSignInButton(context),
                          SizedBox(height: 70),
                          Text(
                            "Or Sign Up with",
                            style: TextStyle(fontSize: 15),
                          ),
                          new Row(
                            children: [
                              SizedBox(width: 30),
                              createFbSignInButton(),
                              SizedBox(width: 30),
                              createGoogleSignInButton()
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

  Widget createAppBar() {
    return new AppBar(
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
    );
  }

  Widget createInputField(Icon icon, String hint) {
    return TextField(
        decoration: new InputDecoration(
            prefixIcon: icon,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.0),
            ),
            hintText: hint));
  }

  Widget createSignUpButton() {
    return RaisedButton(
      onPressed: () {},
      color: Colors.blueGrey,
      textColor: Colors.white,
      child: Text(
        "Sign Up",
        style: TextStyle(fontStyle: FontStyle.italic),
      ),
    );
  }

  Widget createSignInButton(BuildContext context) {
    return RaisedButton(
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
    );
  }

  Widget createFbSignInButton() {
    return RaisedButton(
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
        ]));
  }

  Widget createGoogleSignInButton() {
    return RaisedButton(
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
    );
  }
}
