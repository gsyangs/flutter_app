import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MallStorePage extends StatefulWidget{
  @override
  MallStorePageState createState() => new MallStorePageState();
}

class MallStorePageState extends State<MallStorePage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new Center(
        child: new Text("这是第三个界面"),
      ),
    );
  }

}