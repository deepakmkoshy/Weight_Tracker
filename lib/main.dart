import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:wtfbtest/HomePage.dart';
import 'package:wtfbtest/auth.dart';
import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await getCurrentUser();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Weight Tracker',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: SplashScreen(
          seconds: 1,
          title: Text(
            'Welcome to \nWeight Tracker',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                color: Colors.white),
          ),
          backgroundColor: Colors.purple,
          navigateAfterSeconds: (userMain != null) ? MyHomePage() : Login(),
        ));
  }
}
