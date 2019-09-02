import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../entity/wchat_q_model.dart';
import '../mock/mock_data.dart';

class MallStorePage extends StatefulWidget{
  @override
  MallStorePageState createState() => new MallStorePageState();
}

class MallStorePageState extends State<MallStorePage>{

  FriendCircleViewModel data = friendCircleData;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(20, 40, 20, 20),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius:BorderRadius.circular(6),
              child: Image.network(
                data.userImgUrl,
                width: 50,
                height: 50,
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 15),),
            Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                        data.userName,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                        ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10),),
                    Text(
                      data.saying,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10),),
                    Image.asset("assets/images/home_banner.png"),
                    Padding(padding: EdgeInsets.only(top: 10),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          this.data.publishTime,
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF999999),
                          ),
                        ),
                        Icon(
                          Icons.comment,
                          size: 16,
                          color: Color(0xFF999999),
                        ),
                      ],
                    ),
                    renderComments()
                  ],
                )
            )
          ],
        )
      ),
    );
  }

  Widget renderComments(){
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(10),
      color: Color(0xFFF3F3F5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: this.data.comments.map((comment){
          return Text.rich(
              TextSpan(
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xff333333),
                ),
                children: [
                  TextSpan(
                    text: comment.fromUser + "：",
                    style: TextStyle(
                      color: Color(0xFF636F80),
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  TextSpan(text: comment.content)
                ]..insertAll(1, comment.source ? [TextSpan()]:[
                  TextSpan(text: '回复'),
                  TextSpan(
                    text: comment.toUser,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF636F80),
                    ),
                  ),
                ])
              )
          );
        }).toList(),
      ),
    );
  }

}