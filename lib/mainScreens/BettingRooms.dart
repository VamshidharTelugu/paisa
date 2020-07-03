import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BettingRooms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        //scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (context, index) {
          return ListTile(
            title: roomContainer(),
          );
        });
  }
}

Widget roomContainer() {
  return Container(
    height: 250,
    child: Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/betting.jpg',
                    ),
                    fit: BoxFit.cover)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(
                  'Bet With 10',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(color: Colors.white,letterSpacing: .5,fontSize: 45),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: Container(
                  width: 300,
                  child: RaisedButton(
                    color: Colors.amber,
                    onPressed: () {
                      print("hi");
                    },
                    child: Text("Play"),
                  ),
                ),
              )
            ],
          )
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      margin: EdgeInsets.all(10),
    ),
  );
}
