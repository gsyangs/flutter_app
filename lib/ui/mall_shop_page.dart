import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//小店
class SmallShopPage extends StatefulWidget{
  @override
  SmallShopPageState createState() => new SmallShopPageState();
}

class SmallShopPageState extends State<SmallShopPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("商品列表"),
        centerTitle: true,
        backgroundColor: Color(0xffe62d2d),
      ),
      body: new Center(
        child: new Text("这是第二个界面"),
      ),
    );
  }

}