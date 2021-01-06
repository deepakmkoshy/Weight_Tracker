import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:wtfbtest/constants.dart';
import 'package:wtfbtest/screens/HomePage.dart';
import 'package:wtfbtest/components/auth.dart';
import 'package:wtfbtest/screens/loginNew.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await getCurrentUser();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
          
          return MaterialApp(
              title: 'Weight Tracker',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
         
                textTheme:GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
                primarySwatch: Colors.purple,
              ),
              home: SplashScreen(
                seconds: 1,
                photoSize: 40,
                image: Image.asset(logoURL),
      
                title: Text(
                  'Welcome to \nWeight Tracker',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      color: Colors.white),
                ),
                backgroundColor: Colors.purple,
      
                // For already logged in users, will skip the login page
                navigateAfterSeconds: (userMain != null) ? MyHomePage() : LoginNew(),
              ));
        }
      }
      
      