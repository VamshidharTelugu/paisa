import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paisa/mainScreens/TabbedView.dart';
import 'DetailBettingRoom.dart';

class BettingRooms extends StatelessWidget {

  List<String> mainHeadings = ["Bet with ₹10","Bet with ₹20","Bet with ₹40","Bet with ₹80","Bet with ₹160"];
  List<String> subHeadings = ["If lost, GET ₹5 back with SAFECOIN","If lost, GET ₹10 back with SAFECOIN","If lost, GET ₹20 back with SAFECOIN","If lost, GET ₹40 back with SAFECOIN","If lost, GET ₹80 back with SAFECOIN"];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        //scrollDirection: Axis.horizontal,
        itemCount: mainHeadings.length,
        itemBuilder: (context, index) {
          return roomContainer(context,mainHeadings[index],subHeadings[index]);
        });
  }
}

Widget roomContainer(BuildContext context,String mainHeading,String subHeading) {
  return Container(
    height: 225,
    //decoration: BoxDecoration(borderRadius: BorderRadius.circular(500)),

   margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    child: Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
             border: Border.all(color: Colors.amber,),
              
            // borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                  image: AssetImage(
                    'assets/im.jpg',
                  ),
                  fit: BoxFit.cover)),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                '$mainHeading',
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                   // backgroundColor: Colors.black,
                      color: Colors.white, letterSpacing: .5, fontSize: 35),
                ),
              ),
            ),
              Center(
              child: Text(
                '$subHeading',
                overflow: TextOverflow.clip,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                   // backgroundColor: Colors.black,
                      color: Colors.white, fontSize: 10),
                ),
              ),
            ),
            Center(
              child: Container(
                width: 200,
                child: RaisedButton(
                  color: Colors.amber,
                  onPressed: () {
                    print("hi");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TabbedView()));
                  },
                  child: Text("Play"),
                ),
              ),
            )
          ],
        )
      ],
    ),
  );
}
