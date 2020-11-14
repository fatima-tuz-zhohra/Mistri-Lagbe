import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'homepage_content.dart';

class HomepageWidget extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        // Initialize FlutterFire:
        future: _initialization,
        builder: (context, snapshot) {
          return new MaterialApp(
              home: new Scaffold(
                  appBar: createPageTitle(),
                  body: getWidgetFromSnapshot(context, snapshot)));
        });
  }

  Widget getWidgetFromSnapshot(BuildContext context, AsyncSnapshot snapshot) {
    // Check for errors
    if (snapshot.hasError) {
      return SomethingWentWrong(snapshot.error);
    }

    // Once complete, show your application
    if (snapshot.connectionState == ConnectionState.done) {
      return HomePageContent();
    }

    // Otherwise, show something whilst waiting for initialization to complete
    return Loading();
  }

  Widget SomethingWentWrong(Object error) {
    return Text("Something went wrong! $error}");
  }

  Widget Loading() {
    return CircularProgressIndicator();
  }

  Widget createPageTitle() {
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
        backgroundColor: Color(0xFF1976D2));
  }
}
