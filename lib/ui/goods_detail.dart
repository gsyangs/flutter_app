
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class GoodsDetailState extends StatefulWidget{
  @override
  GoodsDetailPageState createState() => new GoodsDetailPageState();
}

class GoodsDetailPageState extends State<GoodsDetailState>{

  //滚动banner图片
  List<Widget> imageList = List();

  @override
  void initState() {
    imageList
      ..add(Image.asset(
        "assets/images/goods_detail.png",
        fit: BoxFit.fill,
      ))
      ..add(Image.asset(
        "assets/images/goods_detail.png",
        fit: BoxFit.fill,
      ))
      ..add(Image.asset(
        "assets/images/goods_detail.png",
        fit: BoxFit.fill,
      ))
      ..add(Image.asset(
        "assets/images/goods_detail.png",
        fit: BoxFit.fill,
      ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("商品详情"),
        centerTitle: true,
        backgroundColor: Color(0xffe62d2d),
      ),
      body: Row(
        children: <Widget>[
          Flexible(
            child: Container(
              height: 350,
              padding: EdgeInsets.only(top: 10,bottom: 10),
              child: bannerSwiperView(),
            ),
          ),
        ],
      )
    );
  }

  //滚动的banner
  Widget bannerSwiperView() {
    return Swiper(
      itemCount: imageList.length,
      itemBuilder: swiperBuilder,
      pagination: SwiperPagination(
          alignment: Alignment.bottomRight,
          margin: const EdgeInsets.fromLTRB(0, 0, 10, 20),
          builder: FractionPaginationBuilder(
            color: Colors.black45,
            fontSize: 18,
            activeColor: Colors.black,
            activeFontSize: 22,
          ),
      ),
      controller: SwiperController(),
      scrollDirection: Axis.horizontal,
      autoplay: true,
      onTap: (index) => print('点击 了第$index'),
    );
  }

  //设置banner 对应的值
  Widget swiperBuilder(BuildContext context, int index) {
    return (imageList[index]);
  }

}