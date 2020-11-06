import 'dart:ui';

import 'package:flutter/material.dart';


class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SignIn'),
        ),
        body: Builder(
            builder: (context) => new SingleChildScrollView(
                child: new Container(
                    padding: EdgeInsets.all(16),
                    child: new Column(children: [
                      TextField(
                          decoration: new InputDecoration(
                              prefixIcon: Icon(Icons.email),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.green, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.red, width: 1.0),
                              ),
                              hintText: 'E-mail')),
                      const SizedBox(height: 12),
                      TextField(
                          decoration: new InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.green, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.red, width: 1.0),
                              ),
                              hintText: 'Password')),
                      const SizedBox(height: 12),

                      RaisedButton(
                        onPressed: () {},
                        color: Colors.blueGrey,
                        textColor: Colors.white,
                        child: Text(
                          "Sign In",
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        "Forgotten Password?",
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "OR",
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Now in here",
                        style: TextStyle(fontSize: 15),
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: Colors.blueGrey,
                        textColor: Colors.white,
                        child: Text(
                          "Sign Up",
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                      SizedBox(height: 12)
                    ]
                    )
                )
            )
        )
    );
  }
}