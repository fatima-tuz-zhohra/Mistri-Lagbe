

import 'package:Mistri_Lagbe/SignUpPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class HomePageContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomepageContentState();
  }
}

class HomepageContentState extends State<HomePageContent> {
  @override
  Widget build(BuildContext context) {
    User user = _auth.currentUser;
    if(user != null) {
      return Text(user.displayName + " is logged in");
    } else {
      Future.microtask(() =>
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Signup())));
      return Text("Not logged in");
    }
  }
}
