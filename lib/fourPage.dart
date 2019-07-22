import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FourPage extends StatefulWidget{
  @override
  FourPageState createState() => new FourPageState();
}

class FourPageState extends State<FourPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new Center(
        child: new Text("这是第四个界面"),
      ),
    );
  }

}