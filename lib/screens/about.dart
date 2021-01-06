import 'package:flutter/material.dart';
import 'package:wtfbtest/constants.dart';

class About extends StatelessWidget {
  const About({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('About',
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: Colors.white)),
        centerTitle: true,
      ),
      body: DefaultTextStyle(
        style: Theme.of(context).textTheme.bodyText2,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: CircleAvatar(
                      radius: 80, backgroundImage: AssetImage(aboutPhotoURL)),
                ),
              ),
              Text(
                "This app was developed by Deepak Mathews Koshy",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: height / 40),
              ),
              SizedBox(
                height: height * 0.5,
              ),
              Text("Weight Tracker",
                  style: TextStyle(
                    fontSize: height / 50,
                  )),
              Text(
                ver,
                style: TextStyle(
                    fontSize: height / 50),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
