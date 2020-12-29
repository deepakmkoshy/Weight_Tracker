import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:wtfbtest/HomePage.dart';
import 'auth.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  auth.User user;

  @override
  void initState() {
    super.initState();
  }

  Widget googleLoginButton() {
    return OutlineButton(
      onPressed: () {
        signInWithGoogle().then((result) {
          if (result != null) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return MyHomePage();
            }));
          }
        }).catchError((onError) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return Center(child: Text("Error"));
          }));
        });
      },
      splashColor: Colors.grey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/icons/google_logo.png"), height: 35.0),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            Image.asset("assets/icons/weight-scale.png", width: 100,),
            SizedBox(height: 40,),

            Text("LOGIN", style: TextStyle(fontSize: 30),),
            SizedBox(height: 50),
            googleLoginButton(),
          ],
        ),
      ),
    ));
  }
}
