import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'infinite_listview.dart';

class FirstPage extends StatefulWidget{
  @override
  FirstPageState createState() => new FirstPageState();
}

class FirstPageState extends State<FirstPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("首页"),
        centerTitle: true,
      ),
      body: InfiniteListView.separated(
          itemBuilder: _buildItem,
          separatorBuilder: (BuildContext context, int index) => const Divider(height: 2.0),
          itemCount: 50,
      ),
    );
  }
  
  Widget _buildItem(BuildContext context,int index){
    return Material(
      child: InkWell(
        onTap: (){},
        child: ListTile(
          title: Text('item $index'),
          subtitle: Text('subtitle $index'),
          trailing: const Icon(Icons.chevron_right),
        ),
      ),
    );
  }

}