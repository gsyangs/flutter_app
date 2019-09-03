import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


//首页
class HomePage extends StatefulWidget{
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage>{

  List<Widget> imageList = List();

  @override
  void initState() {
    imageList
    ..add(Image.asset(
      "assets/images/home_banner.png",
      fit: BoxFit.fill,
    ))
    ..add(Image.asset(
      "assets/images/home_banner.png",
      fit: BoxFit.fill,
    ))
    ..add(Image.asset(
      "assets/images/home_banner.png",
      fit: BoxFit.fill,
    ))
    ..add(Image.asset(
      "assets/images/home_banner.png",
      fit: BoxFit.fill,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          children: <Widget>[
            firstSwiperView(),
            Positioned(
              left: 0,
              top: 185,
              right: 0,
              bottom: 0,
              child: _menuListBuilder(),
            )
          ],
        ),
      ),
    );
  }

  Widget firstSwiperView() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: Swiper(
        itemCount: 4,
        itemBuilder: _swiperBuilder,
        pagination: SwiperPagination(
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            builder: DotSwiperPaginationBuilder(
                color: Colors.white,
                activeColor: Colors.white54,
                size: 5,
                activeSize: 7
            )
        ),
        controller: SwiperController(),
        scrollDirection: Axis.horizontal,
        autoplay: true,
        onTap: (index) => print('点击了第$index'),
      ),
    );
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return (imageList[index]);
  }

  Widget _menuListBuilder(){
    return Stack(
      fit: StackFit.passthrough,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(25,20,25,10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.asset(
                    "assets/images/home_icon_regularpurchase.png",
                    width: 55,
                    height: 55,
                  ),
                  Image.asset(
                    "assets/images/home_icon_collect.png",
                    width: 55,
                    height: 55,
                  ),
                  Image.asset(
                    "assets/images/home_icon_order.png",
                    width: 55,
                    height: 55,
                  ),
                  Image.asset(
                    "assets/images/home_icon_refund.png",
                    width: 55,
                    height: 55,
                  ),
                ],
              ),
            ),
              new Container(
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(25,10,25,0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(
                      "assets/images/home_icon_coupon.png",
                      width: 55,
                      height: 55,
                    ),
                    Image.asset(
                      "assets/images/home_icon_presale.png",
                      width: 55,
                      height: 55,
                    ),
                    Image.asset(
                      "assets/images/home_icon_special.png",
                      width: 55,
                      height: 55,
                    ),
                    Image.asset(
                      "assets/images/home_icon_all.png",
                      width: 55,
                      height: 55,
                    ),
                  ],
                ),
              ),
            ],
          )
        )
      ],
    );
  }

}