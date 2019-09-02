import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../mock/mock_data.dart';
import '../entity/bank_card_model.dart';

class WholesalePage extends StatefulWidget{
  @override
  WholesalePageState createState() => new WholesalePageState();
}

class WholesalePageState extends State<WholesalePage>{

  CreditCardViewModel data = bankCardData;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.fromLTRB(16,50,16,0),
      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: this.data.cardColors
        ),
        boxShadow:[
          BoxShadow(
            blurRadius: 6,
            spreadRadius: 4,
            color: Color.fromARGB(20, 0, 0, 0),
          )
        ],
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            right: -100,
            bottom: -100,
            child: Image.asset(
              this.data.bankLogoUrl,
              width: 250,
              height: 250,
              color: Colors.white10,
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            bottom: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: Image.asset(
                        this.data.bankLogoUrl,
                        width: 36,
                        height: 36,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 15),),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                            data.bankName,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.bold
                            ),
                        ),
                        Text(
                            data.cardType,
                            style: TextStyle(
                                color: Color.fromARGB(200,255,255,255),
                                fontSize: 14,
                                fontWeight: FontWeight.bold
                            )
                        )
                      ],
                    )
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(left: 51,top: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                            data.cardNumber,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.bold
                            ),
                        ),
                        Text(
                            data.validDate,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.bold
                            ),
                        )
                      ],
                    ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}