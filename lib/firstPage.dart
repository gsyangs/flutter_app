import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget{
  @override
  FirstPageState createState() => new FirstPageState();
}

class FirstPageState extends State<FirstPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("界面1"),
      ),
      body: new Center(
        child: new Text("这是第一个界面"),
      ),
    );
  }

}