import 'package:flutter/material.dart';

import 'Methods.dart';
import 'homescreen.dart';

class CreateAccount extends StatefulWidget {


  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.brown[100],
      body: isLoading ?  Center(
        child: Container(
          height: size.height / 20,
          width: size.height / 20,
          child: CircularProgressIndicator(),
        ),
      ) : SingleChildScrollView(
        child: Column(
        children: [
           SizedBox(
        height: size.height / 20,
    ),

           SizedBox(
            height: size.height / 50,
           ),
          Container(
            width: size.width / 1.1,
            child: Text(
              "Welcome",
              style: TextStyle(
                color: Colors.brown[900],
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: size.width / 1.1,
            child: Text(
              "Sign Up to Continue!",
              style: TextStyle(
                color: Colors.brown[900],
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: size.height / 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: Container(
              width: size.width,
              alignment: Alignment.center,
              child: field(size, "Please enter your name", Icons.account_box,_name),
            ),
          ),
          Container(
            width: size.width,
            alignment: Alignment.center,
            child: field(size, "Enter your email address", Icons.email_outlined,_email),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: Container(
              width: size.width,
              alignment: Alignment.center,
              child: field(size,"Enter your password", Icons.lock_outline,_password),
            ),
          ),
          SizedBox(
            height: size.height / 20,
          ),
          customButton(size),
          SizedBox(
            height: size.height / 45,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.brown[400],
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )

        ],
        )
      ),
    );
  }
      Widget customButton(Size size) {
        return GestureDetector(
          onTap: (){
            if (_name.text.isNotEmpty &&
                _email.text.isNotEmpty &&
                _password.text.isNotEmpty) {
              setState(() {
                isLoading = true;
              });

              createAccount(_name.text, _email.text, _password.text).then((user) {
                if (user != null) {
                  setState(() {
                    isLoading = false;
                  });
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => HomeScreen()));
                  print("Account Created Sucessfull");
                } else {
                  print("Sign up Failed");
                }
              });
            } else {
              print("Please enter Fields");
            }
          },
          child: Container(
              height: size.height / 14,
              width: size.width / 1.9,
              decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.brown[400],
          ),
          alignment: Alignment.center,
          child: Text(
            "Create Account",
            style: TextStyle(
              color: Colors.brown[100],
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )),
        );
  }


  Widget field(
      Size size, String hintText, IconData icon, TextEditingController cont) {
    return Container(
      height: size.height / 14,
      width: size.width / 1.1,
      child: TextField(
        cursorColor: Colors.brown[400],
        controller: cont,
        decoration: InputDecoration(
          prefixIcon: Icon(icon,
            color: Colors.brown[400],),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.brown[400],),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color:Colors.brown),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color:Colors.brown),
          ),
        ),
      ),
    );
  }

}




