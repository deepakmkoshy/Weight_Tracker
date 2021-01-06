import 'package:flutter/material.dart';
import 'package:wtfbtest/constants.dart';
import 'package:wtfbtest/screens/about.dart';
import 'package:wtfbtest/components/auth.dart';
import 'package:wtfbtest/screens/loginNew.dart';

Widget drawer(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;

  return Drawer(
    child: ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text(newUser.displayName,
                style: Theme.of(context).textTheme.headline6.copyWith(
          color: Colors.white
        ),),
                accountEmail: Text(newUser.email,
                style: Theme.of(context).textTheme.subtitle2.copyWith(
          color: Colors.white),),
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
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: Colors.purple,
                      fontWeight: FontWeight.w800,
                      fontSize: 15
                    ),
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
                  style: Theme.of(context).textTheme.headline5.copyWith(
                      fontSize: height / 35,
                  )
                      ),
            ],
          ),
        ),
        SizedBox(
          height: height * 0.6,
        ),
        Text(
          "Weight Tracker",
          textAlign: TextAlign.center,
        ),
        Text(
          ver,
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
