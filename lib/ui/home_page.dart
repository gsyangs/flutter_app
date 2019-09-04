import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/wholesale_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return  ListView(
      children: <Widget>[
        headView(),
        menuListBuilder1(),
        menuListBuilder1(),
      ],
    );
  }

  Widget wholesaleView(){
    return new WholesalePage();
  }

  Widget headView(){
    return Container(
      height: 405,
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          children: <Widget>[
            Positioned(
              child: firstSwiperView(),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 185,
              child: menuListBuilder(),
            ),
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

  Widget menuListBuilder(){
    return Container(
      height: 220,
      color: Colors.white,
      child:  Stack(
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              "assets/images/home_icon_regularpurchase.png",
                              width: 55,
                              height: 55,
                            ),
                            Text("我常购买"),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              "assets/images/home_icon_collect.png",
                              width: 55,
                              height: 55,
                            ),
                            Text("我的收藏")
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              "assets/images/home_icon_order.png",
                              width: 55,
                              height: 55,
                            ),
                            Text("我的订单")
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              "assets/images/home_icon_refund.png",
                              width: 55,
                              height: 55,
                            ),
                            Text("我的退货")
                          ],
                        ),
                      ],
                    ),
                  ),
                  new Container(
                    color: Colors.white,
                    padding: EdgeInsets.fromLTRB(25,10,25,20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              "assets/images/home_icon_coupon.png",
                              width: 55,
                              height: 55,
                            ),
                            Text("优惠券"),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              "assets/images/home_icon_presale.png",
                              width: 55,
                              height: 55,
                            ),
                            Text("预售活动")
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              "assets/images/home_icon_special.png",
                              width: 55,
                              height: 55,
                            ),
                            Text("特价商品")
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              "assets/images/home_icon_all.png",
                              width: 55,
                              height: 55,
                            ),
                            Text("全部商品")
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
          )
        ],
      )
    );
  }

  Widget menuListBuilder1(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Container(
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(25,0,25,10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/home_icon_regularpurchase.png",
                    width: 55,
                    height: 55,
                  ),
                  Text("我常购买"),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/home_icon_collect.png",
                    width: 55,
                    height: 55,
                  ),
                  Text("我的收藏")
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/home_icon_order.png",
                    width: 55,
                    height: 55,
                  ),
                  Text("我的订单")
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/home_icon_refund.png",
                    width: 55,
                    height: 55,
                  ),
                  Text("我的退货")
                ],
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/home_icon_coupon.png",
                    width: 55,
                    height: 55,
                  ),
                  Text("优惠券"),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/home_icon_presale.png",
                    width: 55,
                    height: 55,
                  ),
                  Text("预售活动")
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/home_icon_special.png",
                    width: 55,
                    height: 55,
                  ),
                  Text("特价商品")
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/home_icon_all.png",
                    width: 55,
                    height: 55,
                  ),
                  Text("全部商品")
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}