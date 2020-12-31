import 'package:flutter/material.dart';

import 'HomePage.dart';
import '../components/auth.dart';

class LoginNew extends StatefulWidget {
  LoginNew({Key key}) : super(key: key);

  @override
  _LoginNewState createState() => _LoginNewState();
}

class _LoginNewState extends State<LoginNew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.grey[100],
            ),

            Positioned(
              top: -MediaQuery.of(context).size.height * 0.2,
              right: -MediaQuery.of(context).size.width * 0.1,
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width * 1.2,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Colors.purple,
                          Colors.deepPurpleAccent,
                        ],
                      ),
                      color: Colors.purple,
                      borderRadius: BorderRadius.all(Radius.circular(300)))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment(0, -0.6),
                  child: Text(
                    'Weight Tracker',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),

            Align(
              alignment: Alignment(0, -0.22),
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Color(0x40000000),
                          blurRadius: 4,
                          offset: Offset(0, 4))
                    ],
                    border: Border.all(width: 5, color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Image(
                  image: AssetImage("assets/icons/weight-scale.png"),
                  width: MediaQuery.of(context).size.height * 0.1,
                ),
              ),
            ),

            Align(
              alignment: Alignment(0, 0.1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.black,
                      indent: MediaQuery.of(context).size.width*0.1,
                      endIndent: MediaQuery.of(context).size.width*0.05,
                    ),
                  ),
                  Text("Sign in",style: TextStyle(fontSize: MediaQuery.of(context).size.height / 40, 
                  ),),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.black,
                      indent: MediaQuery.of(context).size.width*0.05,
                      endIndent: MediaQuery.of(context).size.width*0.1,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment(0, 0.4),
              child: RaisedButton(
                onPressed: () {
                  signInWithGoogle().then((result) {
                    if (result != null) {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return MyHomePage();
                      }));
                    }
                  }).catchError((onError) {
                    // Navigator.of(context)
                    //     .push(MaterialPageRoute(builder: (context) {
                    //   return Center(child: Text("Error"));
                    // }));
                  });
                },
                splashColor: Colors.grey,
                color: Colors.white,
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                          image: AssetImage("assets/icons/google_logo.png"),
                          height: 35.0),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Sign in with Google',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 40,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment(0,0.9),
              child: Text("V 0.3.0"),
            )
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: <Widget>[
            //         ClipRRect(
            //           borderRadius: BorderRadius.all(Radius.circular(20)),
            //           child: Container(
            //              height: MediaQuery.of(context).size.height * 0.6,
            // width: MediaQuery.of(context).size.width * 0.8,
            // decoration: BoxDecoration(
            //   color: Colors.white,
            // ),
            // child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: <Widget>[
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: <Widget>[
            //         Text(
            //           "Login",
            //           style: TextStyle(
            //             fontSize: MediaQuery.of(context).size.height / 30,))])
            // ],),
            //           ),
            //         )
            //       ],
            //     )
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
