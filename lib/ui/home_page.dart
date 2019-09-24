import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../entity/goods_item_model.dart';

//首页
class HomePage extends StatefulWidget{
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage>{

  //滚动banner图片
  List<Widget> imageList = List();
  //跑马灯广告
  List<List<String>> bannerData = new List();
  //预售商品
  List<GoodsItem> goodsData = new List();
  //限时特价
  List<GoodsItem> goodsData1 = new List();

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

    bannerData
    ..add(new List()..add("太疯狂！IPhone X首批1分钟卖光。")..add("家人给2岁孩子喝这个，孩子智力倒退10岁!"))
    ..add(new List()..add("自助餐里面的潜规则，想要吃回本其实很简单。")..add("简直是白菜价！日本玩家33万甩卖15万张游戏王卡游戏王卡游戏王卡"))
    ..add(new List()..add("iPhone 11三摄像头怎么样？余承东：抄华为的。"));

    goodsData
      ..add(new GoodsItem(goodsId: "",goodsName: "8月预售组合特惠活动",goodsImage: "http://www.lkhs.cn/UserFile/ProductMain/20160505112642527f.gif",goodsPrice: 88.88,goodsSpec: "",isSelect: false,minNumber: 1,maxNumber: 10,number: 1))
      ..add(new GoodsItem(goodsId: "",goodsName: "8月预售组合特惠活动",goodsImage: "http://www.lkhs.cn/UserFile/ProductMain/20160505112642527f.gif",goodsPrice: 88.88,goodsSpec: "",isSelect: false,minNumber: 1,maxNumber: 10,number: 1))
      ..add(new GoodsItem(goodsId: "",goodsName: "8月预售组合特惠活动",goodsImage: "http://www.lkhs.cn/UserFile/ProductMain/20160505112642527f.gif",goodsPrice: 88.88,goodsSpec: "",isSelect: false,minNumber: 1,maxNumber: 10,number: 1));

    goodsData1
      ..add(new GoodsItem(goodsId: "",goodsName: "8月预售组合特惠活动",goodsImage: "http://www.lkhs.cn/UserFile/ProductMain/20160505112642527f.gif",goodsPrice: 88.88,goodsSpec: "",isSelect: false,minNumber: 1,maxNumber: 10,number: 1))
      ..add(new GoodsItem(goodsId: "",goodsName: "8月预售组合特惠活动",goodsImage: "http://www.lkhs.cn/UserFile/ProductMain/20160505112642527f.gif",goodsPrice: 88.88,goodsSpec: "",isSelect: false,minNumber: 1,maxNumber: 10,number: 1))
      ..add(new GoodsItem(goodsId: "",goodsName: "8月预售组合特惠活动",goodsImage: "http://www.lkhs.cn/UserFile/ProductMain/20160505112642527f.gif",goodsPrice: 88.88,goodsSpec: "",isSelect: false,minNumber: 1,maxNumber: 10,number: 1))
      ..add(new GoodsItem(goodsId: "",goodsName: "8月预售组合特惠活动",goodsImage: "http://www.lkhs.cn/UserFile/ProductMain/20160505112642527f.gif",goodsPrice: 88.88,goodsSpec: "",isSelect: false,minNumber: 1,maxNumber: 10,number: 1));

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
                  menuListBuilder(),
                  contextList(),
                  Image.asset("assets/images/home_images_derocation_presale.png",height: 40,),
                  goodsListBuilder1(),
                  Image.asset("assets/images/home_images_derocation_special.png",height: 40,),
                  goodsListBuilder2()
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
      height: 70,
      margin: EdgeInsets.fromLTRB(10,20,10,10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow:[
            BoxShadow(
                blurRadius: 6,
                color: Color.fromARGB(20, 0, 0, 0),
                spreadRadius: 4
            )
          ]
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset("assets/images/home_images_inform.png",height: 40, width: 40,),
          new Expanded(child: marqueeeView()),
        ],
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

  List<String> parseJson(int index) {
    return bannerData[index];
  }

  //滚动的marquee
  Widget marqueeeView(){
    return Container(
      height: 70,
      margin: EdgeInsets.only(left: 10),
      child: Swiper(
        itemCount: bannerData.length,
        scrollDirection: Axis.vertical,
        autoplay: true,
        itemBuilder: (BuildContext context,int index){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: parseJson(index).map((data){
              return GestureDetector(
                onTap:(){
                  Fluttertoast.showToast(
                      msg: data,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      fontSize: 16.0
                  );
                },
                child: Text(data,style: TextStyle(color: Colors.black),maxLines: 1,overflow: TextOverflow.ellipsis,),
              );
            }).toList(),
          );
        },
      ),
    );
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
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow:[
              BoxShadow(
                  blurRadius: 6,
                  color: Color.fromARGB(20, 0, 0, 0),
                  spreadRadius: 4
              )
            ]
        ),
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

  //预售商品
  Widget goodsListBuilder1(){
    return Container(
      height: 430,
      margin: EdgeInsets.only(bottom: 15),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.93
        ),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(10),
        itemCount: goodsData.length,
        itemBuilder: (BuildContext context,int index){
          return initGoodsItem(goodsData[index]);
        },
      ),
    );
  }

  //特价商品
  Widget goodsListBuilder2(){
    return Container(
      height: 430,
      margin: EdgeInsets.only(bottom: 35),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.93
        ),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(10),
        itemCount: goodsData1.length,
        itemBuilder: (BuildContext context,int index){
          return initGoodsItem(goodsData1[index]);
        },
      ),
    );
  }

  //初始化每项
  Widget initGoodsItem(GoodsItem goodsItem){
    return Container(
      margin: EdgeInsets.all(4),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow:[
            BoxShadow(
                blurRadius: 6,
                color: Color.fromARGB(20, 0, 0, 0),
                spreadRadius: 4
            )
          ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(goodsItem.goodsImage),
          Text(goodsItem.goodsName),
          Container(
            margin: EdgeInsets.only(top: 5),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "¥${goodsItem.goodsPrice}",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                  ),
                ),
                Image.asset("assets/images/home_icon_buy_normal.png")
              ],
            )
          )
        ],
      ),
    );
  }

}