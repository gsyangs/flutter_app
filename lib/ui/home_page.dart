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
  List<Widget> marqueeData = new List();

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

    marqueeData
    ..add(Text("太疯狂！IPhone X首批1分钟卖光。",style: TextStyle(color: Colors.black),))
    ..add(Text("家人给2岁孩子喝这个，孩子智力倒退10岁!",style: TextStyle(color: Colors.black),))
    ..add(Text("自助餐里面的潜规则，想要吃回本其实很简单。",style: TextStyle(color: Colors.black),))
    ..add(Text("简直是白菜价！日本玩家33万甩卖15万张游戏王卡。",style: TextStyle(color: Colors.black),));

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              //AppBar，包含一个导航栏
              SliverAppBar(
                backgroundColor: Color(0xffe62d2d),
                pinned: true,
                expandedHeight: 220,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    child: headList(),
                  )
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  contextList(),
                ]),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Container(
                alignment: Alignment.center,
                height: 40,
                margin: EdgeInsets.only(left: 20,top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/images/home_nav_icon_scan.png",
                      width: 22,
                      height: 22,
                    ),
                    Text(
                      "扫一扫",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10
                      ),
                    )
                  ],
                )
              ),
              textFieldView(),
              new Container(
                alignment: Alignment.center,
                height: 40,
                margin: EdgeInsets.only(right: 20,top: 30),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/images/home_nav_icon_cart.png",
                      width: 22,
                      height: 22,
                    ),
                    Text(
                      "购物车",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10
                      ),
                    )
                  ]
                )
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget headList(){
    return Container(
      child: new Stack(
        //statck
        children: <Widget>[
          Container(
            height: 220,
            child: bannerSwiperView(),
          ),
          bannerBottom(),
        ],
      ),
    );
  }

  Widget contextList(){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          marqueeeView(),
//          Container(
//            height: 100,
//            child: marqueeeView(),
//          ),
        ],
      ),
    );
  }

  //初始化输入框
  Widget textFieldView(){
    final controller = TextEditingController();
    controller.addListener(() {
      print('input ${controller.text}');
    });
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.only(left: 15,right: 15),
        width: 250,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.all(Radius.circular(5))
        ),
        child: buildTextField(controller)
    );
  }

  //输入框样式
  Widget buildTextField(TextEditingController controller) {
    return TextField(
      style: TextStyle(
          fontSize: 14,
          color: Colors.black87
      ),
      maxLines: 1,
      controller: controller,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintMaxLines: 1,
          hintText: "请输入要要查询的商品",
          hintStyle: TextStyle(
              fontSize: 14,
              color: Colors.black38
          )
      ),
    );
  }

  //滚动的banner
  Widget bannerSwiperView() {
    return Swiper(
        itemCount: imageList.length,
        itemBuilder: swiperBuilder,
        pagination: SwiperPagination(
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            builder: DotSwiperPaginationBuilder(
                color: Colors.white,
                activeColor: Colors.white54,
                size: 4,
                activeSize: 7
            )
        ),
        controller: SwiperController(),
        scrollDirection: Axis.horizontal,
        autoplay: true,
        onTap: (index) => print('点击了第$index'),
    );
  }

  //设置banner 对应的值
  Widget swiperBuilder(BuildContext context, int index) {
    return (imageList[index]);
  }

  //滚动的marquee
  Widget marqueeeView(){
    return Swiper(
      itemCount: marqueeData.length,
      itemBuilder: marqueeeBuilder,
      pagination: SwiperPagination(
          alignment: Alignment.bottomCenter,
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
          builder: DotSwiperPaginationBuilder(
              color: Colors.white,
              activeColor: Colors.white54,
              size: 4,
              activeSize: 7
          )
      ),
      controller: SwiperController(),
      scrollDirection: Axis.vertical,
      autoplay: true,
      onTap: (index) => print('点击了第$index'),
    );
  }

  //设置banner 对应的值
  Widget marqueeeBuilder(BuildContext context, int index) {
    return marqueeData[index];
  }

  //banner 下弧度
  Widget bannerBottom(){
    return Container(
      margin: EdgeInsets.only(top: 205),
      child: Stack(
        fit: StackFit.passthrough,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Container(
              padding: EdgeInsets.fromLTRB(25,20,25,10),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  //初始化 功能菜单
  Widget menuListBuilder(){
    return Container(
      child: Column(
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
    );
  }



}