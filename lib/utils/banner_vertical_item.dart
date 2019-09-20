import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class VerticalBannerItem extends StatelessWidget {

  VerticalBannerItem({Key key,this.bannerData}) : super(key: key);

  final List<String> bannerData;

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: bannerData.map((data){
            return GestureDetector(
                onTap:(){
                  Fluttertoast.showToast(
                      msg: data,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      fontSize: 16.0
                  );
                },
                child: Text(data,style: TextStyle(color: Colors.black)),
              );
          }).toList(),
        )
    );
  }
}