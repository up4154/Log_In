import 'package:flutter/material.dart';
import 'package:my_app/Methods.dart';

class HomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        actions: <Widget>[
          FlatButton(

              onPressed: () => logOut(context),
               child:
               Text("Log Out"),
              )
        ],
      ),

      body: Center(
    child: Text(
    'Welcome! You are logged in ',
    style: TextStyle(color: Colors.deepOrange,fontSize: 20.0),
    )
      ),
    );
  }
}
