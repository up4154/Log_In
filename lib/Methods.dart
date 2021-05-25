import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'LoginScreen.dart';

Future<User?> createAccount(String name,String email,String password) async{
  FirebaseAuth _auth = FirebaseAuth.instance;

  try{
    User? user = (await _auth.createUserWithEmailAndPassword(
        email: email, password: password))
        .user;
    if(user !=null){
      print("Account created Succesfull");
      return user;
    }else{
      print("Account creation failed");
      return user;
    }

  }catch(e){
    print(e);
    return null;
  }
}
Future<User?> logIn(String email,String password) async{
  FirebaseAuth _auth = FirebaseAuth.instance;

  try{
    User? user =(await _auth.signInWithEmailAndPassword(
        email: email, password: password))
        .user;
    if(user !=null){
      print("Login Succesfull");
      return user;
    }else{
      print("Login failed");
      return user;
    }

  }catch(e){
    print(e);
    return null;
  }
}

Future logOut(BuildContext context) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    await _auth.signOut().then((value) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
    });
  } catch (e) {
    print("error");
  }
}
