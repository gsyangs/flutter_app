import 'package:flutter/material.dart';

import 'firstPage.dart';
import 'secondPage.dart';
import 'thirdPage.dart';
import 'fourPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.deepOrange[300]),
      home: new Tabs(),
    );
  }
}

class Tabs extends StatefulWidget{
  @override
  _Tab createState() => new _Tab();
}

class _Tab extends State<Tabs>{

  var _currentIndex = 0;

  var _children = [new FirstPage(),new SecondPage(),new ThirdPage(),new FourPage()];

  var _list_bar = [
    new BottomNavigationBarItem(icon: new Icon(Icons.camera),title: Text('camera'),backgroundColor: Colors.deepOrange[300],),
    new BottomNavigationBarItem(icon: new Icon(Icons.wifi),title: Text('wifi'),backgroundColor: Colors.deepOrange[300],),
    new BottomNavigationBarItem(icon: new Icon(Icons.access_alarm),title: Text('alarm'),backgroundColor: Colors.deepOrange[300],),
    new BottomNavigationBarItem(icon: new Icon(Icons.sms),title: Text('sms'),backgroundColor: Colors.deepOrange[300],)
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      bottomNavigationBar: new BottomNavigationBar(
        items: _list_bar,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _children,
      ),
    );
  }
}
