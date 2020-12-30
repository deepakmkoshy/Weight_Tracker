import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wtfbtest/Graph.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wtfbtest/auth.dart';
import 'package:wtfbtest/login.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var weight = <String>[];
  bool _showValidationError = false;
  final _controller = TextEditingController();
  String _errorMsg;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  void initState() {
    super.initState();
    initFs();
  }

  Future<void> initFs() async {
    users.doc(newUser.uid).get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        setState(() {
          if (documentSnapshot.data().containsKey('wt')) {
            weight = List<String>.from(documentSnapshot.data()['wt']);
          } else {
            createFs();
          }
        });
      } else {
        createFs();
      }
    });
  }

  Future<void> createFs() async {
    users
        .doc(newUser.uid)
        .set({"wt": weight})
        .then((value) => print("Added new user"))
        .catchError((onError) => print("Err"));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateInput() {
    setState(() {
      String input = _controller.text;
      print(input);
      try {
        double d = double.parse(input);
        _showValidationError = false;
        if (d < 0 || d > 200) {
          _showValidationError = true;
          _errorMsg = "Number should be less than 200";
        } else {
          weight.add(input);
          createFs();
        }
      } on Exception catch (e) {
        print('Error: $e');
        _errorMsg = "Invalid number entered";

        _showValidationError = true;
      }
    });
  }

  String _viewList() {
    String tmp = '';
    if (weight.isNotEmpty) {
      for (var text in weight) {
        tmp = tmp + ' ' + text;
      }
    }
    return tmp;
  }

  void clearDB() {
    setState(() {
      weight.clear();
      _controller.clear();
      createFs();
    });
  }

  @override
  Widget build(BuildContext context) {
  final width = MediaQuery.of(context).size.width;


    return Scaffold(
      appBar: AppBar(
        title: Text("WT Tracker-Firebase"),
        centerTitle: true,
        // automaticallyImplyLeading: false,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Stack(children: <Widget>[
              UserAccountsDrawerHeader(
                  accountName: Text(newUser.displayName),
                  accountEmail: Text(newUser.email),
                  currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(newUser.photoURL))),
              Container(
                margin: EdgeInsets.fromLTRB(width*0.45, 20, 0, 0),
                child: RaisedButton(
                  onPressed: () {
                    signOutGoogle();
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) {
                      return Login();
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
                      // side: BorderSide(width: 1.0, color: Colors.deepPurple[900]),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,

              children: <Widget>[
                Padding(padding: EdgeInsets.only(left: 20)),
                Icon(Icons.info_outline),
                Padding(padding: EdgeInsets.only(left: 20)),
                Text("About", style: TextStyle(fontSize: 20)),
              ],
              //  title: Text('About'),
              //  leading: Icon(Icons.info_outline),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      style: Theme.of(context).textTheme.headline5,
                      decoration: InputDecoration(
                        labelText: "Enter your current weight",
                        errorText: _showValidationError ? _errorMsg : null,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Ink(
                      decoration: ShapeDecoration(
                        shadows: [
                          BoxShadow(
                              color: Color(0x40000000),
                              blurRadius: 4,
                              offset: Offset(0, 4))
                        ],
                        shape: CircleBorder(),
                        gradient: LinearGradient(
                          colors: <Color>[
                            Colors.purple,
                            Colors.deepPurpleAccent,
                            // Colors.deepOrange,
                          ],
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {
                          _updateInput();
                          _controller.clear();
                        },
                        icon: Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Container(
                  child: InputDecorator(
                    child: Text(_viewList(),
                        style: Theme.of(context).textTheme.headline5),
                    decoration: InputDecoration(
                      labelText: 'The weight list',
                      labelStyle: Theme.of(context).textTheme.headline5,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ),
                ),
              ),
              Graph(weight),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: FlatButton(
                  onPressed: clearDB,
                  padding: EdgeInsets.all(0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0x40000000),
                            blurRadius: 4,
                            offset: Offset(0, 4))
                      ],
                      gradient: LinearGradient(
                        colors: <Color>[
                          Colors.purple,
                          Colors.deepPurpleAccent,
                        ],
                      ),
                    ),
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "CLEAR",
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(color: Colors.white, fontSize: 25.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
