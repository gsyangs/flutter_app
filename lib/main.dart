import 'package:flutter/material.dart';

import 'home_page.dart';
import 'mall_shop_page.dart';
import 'mall_store_page.dart';
import 'wholesale_page.dart';
import 'mine_age.dart';

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
  var _children = [new HomePage(),new SmallShopPage(),new MallStorePage(),new WholesalePage(),new MinePage()];
  var _list_bar = [
    new BottomNavigationBarItem(icon: Image.asset("assets/images/home_icon_homepage_normal.png"),
        title: Text('首页'),
        activeIcon: Image.asset("assets/images/home_icon_homepage_selected.png")),
    new BottomNavigationBarItem(icon: Image.asset("assets/images/home_icon_mall_normal.png"),
        title: Text('小店'),
        activeIcon: Image.asset("assets/images/home_icon_mall_selected.png")),
    new BottomNavigationBarItem(icon: Image.asset("assets/images/home_icon_store_normal.png"),
        title: Text('商城'),
        activeIcon: Image.asset("assets/images/home_icon_store_selected.png")),
    new BottomNavigationBarItem(icon: Image.asset("assets/images/home_icon_wholesale_normal.png"),
        title: Text('批发'),
        activeIcon: Image.asset("assets/images/home_icon_wholesale_selected.png")),
    new BottomNavigationBarItem(icon: Image.asset("assets/images/home_icon_mine_normal.png"),
        title: Text('我的'),
        activeIcon: Image.asset("assets/images/home_icon_mine_selected.png"))
  ];



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      bottomNavigationBar: new BottomNavigationBar(
        items: _list_bar,
        type: BottomNavigationBarType.shifting,
        selectedItemColor: const Color(0xffe62d2d),
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
