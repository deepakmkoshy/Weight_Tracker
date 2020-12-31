import 'package:flutter/material.dart';
import 'package:wtfbtest/about.dart';
import 'package:wtfbtest/auth.dart';
import 'package:wtfbtest/loginNew.dart';

Widget drawer(BuildContext context) {
  final width = MediaQuery.of(context).size.width;

  return Drawer(
    child: ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text(newUser.displayName),
                accountEmail: Text(newUser.email),
                currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(newUser.photoURL))),
            Container(
              margin: EdgeInsets.fromLTRB(width * 0.5, 20, 0, 0),
              child: RaisedButton(
                onPressed: () {
                  signOutGoogle();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) {
                    return LoginNew();
                  }), ModalRoute.withName('/'));
                },
                color: Colors.purpleAccent[70],
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    'Logout',
                    style: TextStyle(fontSize: 15, color: Colors.purple),
                  ),
                ),
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => About()));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(left: 10)),
              Icon(Icons.info_outline),
              Padding(padding: EdgeInsets.only(left: 20)),
              Text("About",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 35)),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
        ),
        Text(
          "Weight Tracker",
          textAlign: TextAlign.center,
        ),
        Text(
          "V0.3.0",
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
