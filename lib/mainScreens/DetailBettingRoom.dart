import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailBettingRoom extends StatefulWidget {
  @override
  _DetailBettingRoomState createState() => _DetailBettingRoomState();


}




class _DetailBettingRoomState extends State<DetailBettingRoom> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
        child: Container(
          color: Color(0xff000000),
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                // color: Colors.grey[100],
                width: MediaQuery.of(context).size.width,
                //  decoration: BoxDecoration(border: Border.all(color: Colors.amber)),
                padding: EdgeInsets.only(top: 20),
                height: 120,
                child: Column(
                  children: <Widget>[
                    Text(
                      "Timer",
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    Text(
                      "0:54",
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(fontSize: 60, color: Colors.amber),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25),
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(bottom: 15),
                height: 20,
                child: Text(
                  "Wallet Balance : ₹560",
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25),
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(bottom: 10),
                height: 20,
                child: Text(
                  "Selected Color: Red",
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 80,
                        //color: Colors.white,
                        child: RaisedButton(
                          onPressed: () {},
                          color: Colors.blue,
                          child: Center(
                            child: Text(
                              "Bet On Blue",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        height: 80,
                        // color: Colors.red,
                        child: RaisedButton(
                          onPressed: () {},
                          color: Colors.red,
                          child: Center(
                            child: Text(
                              "Bet On Red",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                //  padding: EdgeInsets.symmetric(horizontal: 25),
                //  alignment: Alignment.topRight,
                margin: EdgeInsets.only(bottom: 10),
                height: 20,
                child: Text(
                  "How to Play?",
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(fontSize: 15, color: Colors.amber),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Text(
                        "Id",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      )),
                      Expanded(
                          flex: 2,
                          child: Text(
                            "Winning Percentage",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          )),
                      Expanded(
                          child: Text(
                        "Lucky Colour",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      )),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  // color: Colors.grey,
                  // height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      itemCount: 25,
                      itemBuilder: (context, index) {
                        return index % 2 == 0 ? historyList(Colors.red) :
                        historyList(Colors.blue);
                      }),
                  //child: C,
                ),
              ),
              //SizedBox(height: 80,)
            ],
          ),
        ),
      );
  }
}

Widget historyList(Color color) {
  return SizedBox(
    height: 40,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Text(
            "356788",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.white),
          )),
          Expanded(
              child: Text(
            "77%",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.white),
          )),
          Expanded(
              child: Container(
            // height: 15,
            //padding: EdgeInsets.symmetric(horizontal: 100),
            color: color,
          )),
        ],
      ),
    ),
  );
}
