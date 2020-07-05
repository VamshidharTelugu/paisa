import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
// import 'package:paisa/mainScreens/DetailBettingRoom.dart';

// class LeaderBoard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         itemCount: 11,
//         itemBuilder: (context, index) {
//           return index == 0
//               ? SizedBox(
//                   height: 45,
//                   child: Padding(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//                     child: Row(
//                       children: <Widget>[
//                         Expanded(
//                             child: Text(
//                           "Rank",
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(color: Colors.red,),
//                         )),
//                         Expanded(
//                             flex: 2,
//                             child: Text(
//                               "User Name",
//                               overflow: TextOverflow.ellipsis,
//                               style:
//                                   TextStyle(color: Colors.red, ),
//                             )),
//                         Expanded(
//                             child: Text(
//                           "Won",
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(color: Colors.red,),
//                         )),
//                       ],
//                     ),
//                   ),
//                 )
//               : leaderList(index);
//           //        Container(height: 200,
//           //                     child: ListView.builder(
//           //   itemCount: 20,
//           //   itemBuilder: (context, index) {
//           // return ListTile(
//           //   title: Text(
//           //     "Vamshidhar",
//           //     style: TextStyle(color: Colors.white),
//           //   ),
//           // );
//           //  }
//           //  ),
//           //        );
//         });
//   }

//   Widget leaderList(int rank) {
//     return SizedBox(
//       height: 45,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//         child: Row(
//           children: <Widget>[
//             Expanded(
//                 child: Text(
//               "$rank",
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(color: Colors.white),
//             )),
//             Expanded(
//                 flex: 2,
//                 child: Text(
//                   "Vamshidhar",
//                   overflow: TextOverflow.ellipsis,
//                   style: TextStyle(
//                     color: Colors.white,
//                   ),
//                 )),
//             Expanded(
//                 child: Text(
//               "₹850",
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(color: Colors.amber),
//             )),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class DataTableSampleState extends StatelessWidget//State<DataTableSample>
//  {

//   void _getSelectedRowInfo() {
//     print('Selected Item Row Name Here...');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xff000000),
//       // appBar: AppBar(
//       //   title: Text('DataTable Sample'),
//       // ),
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         child: DataTable(
//             onSelectAll: (b) {},
//             sortAscending: true,
//             columns: <DataColumn>[
//               DataColumn(
//                 label: Text('Rank',style: TextStyle(color: Colors.red),),
//               ),
//               DataColumn(
//                 label: Text('Name',style: TextStyle(color: Colors.red),),
//               ),
//               DataColumn(label: Text("Won",style: TextStyle(color: Colors.red),))
//             ],
//             rows: items
//                 .map(
//         (itemRow) => DataRow(
//               cells: [
//                 DataCell(
//                   //ConstrainedBox()
//                   Text(itemRow.rank,style: TextStyle(color: Colors.white),),

//                   // showEditIcon: false,
//                   // placeholder: false,
//                 ),
//                 DataCell(
//                   Text(itemRow.name,style: TextStyle(color: Colors.white),overflow: TextOverflow.ellipsis,),

//                   // showEditIcon: true,
//                   // placeholder: false,
//                   onTap: _getSelectedRowInfo,
//                 ),
//                   DataCell(
//                   Text(itemRow.won,style: TextStyle(color: Colors.amber),),
//                   // showEditIcon: true,
//                   // placeholder: false,
//                   onTap: _getSelectedRowInfo,
//                 ),
//               ],
//             ),
//                 )
//                 .toList(),
//           ),
//       ),
//     );
//   }
// }

// class ItemInfo {
//   String rank;
//   String name;
//   String won;

//   ItemInfo({
//     this.rank,
//     this.name,
//     this.won,
//   });
// }

// var items = <ItemInfo>[
//   ItemInfo(
//     rank: '1',
//     name: 'Vamsidharrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr'.substring(0,10),
//     won: "₹856"
//   ),
//   ItemInfo(
//     rank: '2',
//     name: 'Tejesh',
//     won: "₹546"
//   ),
//   ItemInfo(
//     rank: '3',
//     name: 'Vamshidhar',
//     won: "₹7"
//   ),
// ];

class ShopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: shopContainer(context, "Get", "Refer A Friend"),
        ),
        Expanded(
          child: shopContainer(
            context,"Buy","₹10"
          ),
        ),
      ],
    );
  }
}

Widget shopContainer(BuildContext context, String text, String buttonTitle) {
  return Container(
    height: 225,
    color: Colors.grey[900],
    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: InkWell(
      onTap: () {},
      splashColor: Colors.amber,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.amber,
              ),

              // borderRadius: BorderRadius.circular(5),
              // image: DecorationImage(
              //     image: AssetImage(
              //       'assets/im.jpg',
              //     ),
              //     fit: BoxFit.cover)
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Center(
                  child: RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 30),
                  children: <TextSpan>[
                    TextSpan(
                        text: '$text ', style: TextStyle(color: Colors.white)),
                    TextSpan(text: '5 ', style: TextStyle(color: Colors.amber)),
                    TextSpan(
                        text: 'SafeCoins',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.amber),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print("ohohoo");
                            showDialog(
                                context: context,
                                builder: (BuildContext context) => SafeCoinDialog(context));
                          })
                  ],
                ),
                // textScaleFactor: ,
              )
                  // Text(
                  //   text,
                  //   overflow: TextOverflow.ellipsis,
                  //   style: GoogleFonts.lato(
                  //     textStyle: TextStyle(
                  //      // backgroundColor: Colors.black,
                  //         color: Colors.white, letterSpacing: .5, fontSize: 35),
                  //   ),
                  // ),
                  ),
              Center(
                child: Container(
                  width: 200,
                  child: RaisedButton(
                    color: Colors.amber,
                    onPressed: () {
                      print("hi");
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => DetailBettingRoom()));
                    },
                    child: Text(buttonTitle),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}


Dialog SafeCoinDialog(context) => Dialog(
  backgroundColor: Color(0xff000000),
  shape: RoundedRectangleBorder(
    
      borderRadius: BorderRadius.circular(12.0)), //this right here
  child: Container(
    height: 300.0,
    width: 300.0,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            'What are SafeCoins?',
            style: TextStyle(color: Colors.amber),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            'Use SafeCoins to get 50% of your money back when you loose a bet.\n\nExample: If you lost a bet of 100 rupees, Use safe coin to get 50 rupees back! \n\n Low risk | High Profit',
            style: TextStyle(color: Colors.white),
          ),
        ),
       // Padding(padding: EdgeInsets.only(top: 50.0)),
        FlatButton(
          color: Colors.amber,
            onPressed: () {
               Navigator.of(context).pop();
            },
            child: Text(
              'Got It!',
              style: TextStyle(color: Colors.black, fontSize: 18.0),
            ))
      ],
    ),
  ),
);
