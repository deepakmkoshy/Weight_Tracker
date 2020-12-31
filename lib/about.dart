import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        centerTitle: true,
      ),
      body: DefaultTextStyle(
        style: Theme.of(context).textTheme.headline6,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: CircleAvatar(
                      radius: 80,
                      backgroundImage:
                          AssetImage('assets/images/about_photo.jpg')),
                ),
              ),
              Text(
                "This app was developed by Deepak Mathews Koshy",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height / 35
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.5,
              ),
              Text("Weight Tracker", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 50),),
              Text("V0.3.0", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 50),),

            ],
          ),
        ),
      ),
    );
  }
}
