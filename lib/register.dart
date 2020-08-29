import 'package:flutter/material.dart';
import 'package:sample/login.dart';

class Details extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DetailsState();
  }
}

class DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("click"),
      ),
      body: Center(
        child: RaisedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return LoginForm();
              }));
            },
            child: Text('click me'),
            color: Colors.brown),
      ),
    );
  }
}
