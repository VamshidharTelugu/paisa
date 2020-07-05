import 'package:flutter/material.dart';
import 'package:paisa/mainScreens/DetailBettingRoom.dart';
//import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class TabbedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xff000000),
        appBar: AppBar(
          //elevation: 0.0,
          title: Text("Bet with ₹10"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: "Betting Room",
              ),
              Tab(
                text: "History",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            DetailBettingRoom(),
            courseFilesListView(),
          ],
        ),
      ),
    );
  }
}

Widget courseFilesListView() {
  //List<int> trialList = [1,2,3,6,5,4,7,8,9];
  return ListView.builder(
    itemCount: 20,
    itemBuilder: (context, index) {
      return Container(
       margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
       padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        height: 120,
        //color: Color(0xff000000),
        decoration: BoxDecoration(border: Border.all(color:Colors.amber)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: Text(
                    "Id",
                    style: TextStyle(color: Colors.amber),
                  ),
                ),
                Expanded(
                  child: Text(
                    ": 45623"
                    ,style: TextStyle(color: Colors.white),
                  ),
                  flex: 2,
                ),
                 Expanded(
                  // flex: 2,
                  child: Text("SCoin",style: TextStyle(color: Colors.amber),),
                  
                ),
                Expanded(
                  child: Text(": NO",style: TextStyle(color: Colors.white),),
                  flex: 2,
                ),
             
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(child: Text("Paid",style: TextStyle(color: Colors.amber),)),
                Expanded(
                  child: Text(": ₹10",style: TextStyle(color: Colors.white),),
                  flex: 2,
                ),
                Expanded(child: Text("Fee",style: TextStyle(color: Colors.amber),)),
                Expanded(
                  child: Text(": ₹1",style: TextStyle(color: Colors.white),),
                  flex: 2,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                  Expanded(
                    child: Text(
                  "Bet On",style: TextStyle(color: Colors.amber),
                )),
                Expanded(
                  child: Text(
                    ": Red",style: TextStyle(color: Colors.white),
                  ),
                  flex: 2,
                ),
                Expanded(child: Text("Result",style: TextStyle(color: Colors.amber),)),
                Expanded(
                  child: Text(": Blue",style: TextStyle(color: Colors.white),),
                  flex: 2,
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Expanded(
                child: Container(
              width: 100,
              child: Center(child: Text("Won ₹55",style: TextStyle(color: Colors.white),)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.amber),
            )),
          ],
        ),
      );
      //  ListTile(

      //  // leading: Text("51642"),
      //   title: Text("Lost ₹5, Used SAFECOIN",overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.white),),
      //   trailing: Text("+₹16",style: TextStyle(color: Colors.green),)
      // );
    },
    // separatorBuilder: (context, index) {
    //   return Divider();
    // },
  );
}
