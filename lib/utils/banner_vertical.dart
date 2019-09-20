import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';

class VerticalBanner extends StatefulWidget {

  VerticalBanner({Key key,this.bannerData}) : super(key: key);

  final List<String> bannerData;

  @override
  _VerticalBanner createState() => new _VerticalBanner();

}

class _VerticalBanner extends State<VerticalBanner>{


//  List<String> bannerData = new List();

  @override
  Widget build(BuildContext context) {

//    bannerData
//      ..add("太疯狂！IPhone X首批1分钟卖光。")
//      ..add("家人给2岁孩子喝这个，孩子智力倒退10岁!");

    return new Container(
        child: marqueeeView(),
    );
  }

  //滚动的marquee
  Widget marqueeeView(){
    return Swiper(
      itemCount: 2,
      itemBuilder: (BuildContext context,int index){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: this.widget.bannerData.map((data){
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
        );
      },
      controller: SwiperController(),
      scrollDirection: Axis.vertical,
      autoplay: true,
    );
  }

}