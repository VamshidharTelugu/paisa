import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paisa/services/DatabaseMethods.dart';
//import 'package:paisa/services/DatabaseMethods.dart';
import 'package:paisa/utilities/constants.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  var verificationId;
  bool codeSent = false;

  // Dialog SafeCoinDialog(context, String id) => Dialog(
  //       backgroundColor: Color(0xff000000),
  //       shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(12.0)), //this right here
  //       child: Container(
  //         height: 300.0,
  //         width: 300.0,
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: <Widget>[
  //             ListTile(
  //                 title: Text(
  //               'Enter the OTP sent to your mobile',
  //               style: GoogleFonts.lato(
  //                 textStyle: TextStyle(color: Colors.white),
  //               ),
  //             )),
  //             TextField(
  //               controller: otpc,
  //               cursorColor: Colors.white,
  //              // keyboardType: TextInputType.number,
  //               style: TextStyle(
  //                 color: Colors.white,
  //               ),
  //               decoration: InputDecoration(
  //                   // hintStyle: TextStyle(color: Colors.grey),

  //                   border: OutlineInputBorder(),
  //                   enabledBorder: OutlineInputBorder(
  //                     borderSide: BorderSide(color: Colors.amber, width: 1.0),
  //                   ),
  //                   // hintText: '',
  //                   // hints
  //                   // icon: Icon(Icons.phone,color: Colors.white),
  //                   labelText: 'OTP',
  //                   labelStyle: TextStyle(color: Colors.white)),
  //             ),
  //             SizedBox(
  //               height: 10,
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.symmetric(horizontal: 50),
  //               child: RaisedButton(
  //                 onPressed: () async {
  //                   final code = otpc.text.trim() ;
  //                     AuthCredential credential =
  //                         PhoneAuthProvider.getCredential(
  //                             verificationId: id, smsCode: code);

  //                     AuthResult result =
  //                         await _auth.signInWithCredential(credential);

  //                     FirebaseUser user = result.user;

  //                     if (user != null) {
  //                       // Navigator.push(
  //                       //     context,
  //                       //     MaterialPageRoute(
  //                       //         builder: (context) => HomeScreen(
  //                       //               user: user,
  //                       //             )));
  //                       print("vamsiiii");
  //                       Navigator.pop(context);

  //                       setState(() {
  //                         log = true;
  //                         print("$log");
  //                       });
  //                     } else {
  //                       print("Error");
  //                       print("yabba'):");
  //                     }
  //                 },
  //                 color: Colors.amber,
  //                 child: Text(
  //                   "Done",
  //                   style: GoogleFonts.lato(
  //                     textStyle: TextStyle(fontSize: 20, color: Colors.black),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     );

  // Future<bool> loginUser(String phone, BuildContext context) async {
  //   print("entered");

  //   _auth.verifyPhoneNumber(
  //       phoneNumber: phone,
  //       timeout: Duration(seconds: 60),
  //       verificationCompleted: (AuthCredential credential) async {
  //         //Navigator.of(context).pop();

  //         AuthResult result = await _auth.signInWithCredential(credential);

  //         FirebaseUser user = result.user;

  //         if (user != null) {
  //           // Navigator.push(
  //           //     context, MaterialPageRoute(builder: (context) => TabbedView()));
  //           print("fuck");

  //           // isLoggedIn = true;
  //           // return  true;
  //           setState(() {
  //             log = true;
  //           });

  //         } else {
  //           print("Error");
  //         }

  //         //This callback would gets called when verification is done auto maticlly
  //       },
  //       verificationFailed: (AuthException exception) {

  //         print(exception.toString());
  //         print("failes");
  //       },
  //       codeSent: (String verificationId, [int forceResendingToken]) {
  //         print("codesent");
  //         showDialog(
  //             context: context,
  //             builder: (BuildContext context) =>
  //                 SafeCoinDialog(context, verificationId));
  //       },
  //       codeAutoRetrievalTimeout: null);
  // }
  Widget customListViewForProfile(
      String heading, String valuevalue, IconData iconData, bool hasEnding) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: 65,
      child: Row(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            iconData,
            size: 25,
            color: Colors.white,
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "$heading",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                        //Color(0xff2b2f77),
                        fontSize: 13),
                  ),
                  Container(
                    // decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey,),),),
                    padding: EdgeInsets.symmetric(vertical: 5),
                    height: 35,
                    //  width: double.infinity,

                    child: Text(valuevalue,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.lato(
                          textStyle:
                              TextStyle(fontSize: 18, color: Colors.white),
                        )),
                  )
                ]),
          ),
          hasEnding
              ? Container(
                  width: 55,
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text(
                      "Add",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                    color: Colors.amber,
                  ),
                )
              : Container()

          //Icon(Icons.add,color: Colors.white,)
        ],
      ),
    );
  }

  Future<void> loginWithPhoneNumber(phoneNumber) async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      DatabaseMethods().signIn(authResult);
      setState(() {
        isLoggedIn = true;
      });
    };

    final PhoneVerificationFailed verificationFailed =
        (AuthException authException) {
      print('${authException.message}');
    };

    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
      this.verificationId = verId;
      setState(() {
        codeSent = true;
      });
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeOut = (String verId) {
      this.verificationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 10),
        verificationCompleted: verified,
        verificationFailed: verificationFailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeOut);
  }

  @override
  Widget build(BuildContext context) {
    //double height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: this._scaffoldKey,
      backgroundColor: Color(0xff000000),
      body: isLoggedIn
          ? ListView(
              children: <Widget>[
                Container(
                  // color: Colors.grey[100],
                  // decoration: BoxDecoration(border: Border.all(color: Colors.amber)),
                  padding: EdgeInsets.only(top: 20),
                  height: 150,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Total Winnings",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.lato(
                          textStyle:
                              TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                      Text(
                        "₹470",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.lato(
                          textStyle:
                              TextStyle(fontSize: 60, color: Colors.amber),
                        ),
                      ),
                    ],
                  ),
                ),
                customListViewForProfile("Account Balance", "₹380",
                    Icons.account_balance_wallet, true),
                customListViewForProfile(
                    "Name", "Vamshidhar", Icons.person_outline, false),
                customListViewForProfile(
                    "Email", "teluguvamshi77@gmail.com", Icons.mail, false),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 60),
                  //minWidth: 150.0,
                  height: 50.0,

                  child: RaisedButton(
                    color: Colors.amber,
                    onPressed: () {},
                    child: Text(
                      "Withdraw",
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 60),
                  //minWidth: 150.0,
                  height: 50.0,
                  child: RaisedButton(
                    splashColor: Colors.grey[50],
                    color: Colors.grey[900],
                    onPressed: () {},
                    child: Text(
                      "Histrory",
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: Text(
                  "All Rights Reserved",
                  style: TextStyle(color: Colors.grey, fontSize: 10),
                ))
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  // color: Colors.red,
                  height: 200,
                  child: ListView(
                    children: <Widget>[
                      ListTile(
                          title: Text(
                        codeSent
                            ? "Enter the OTP sent to your mobile!"
                            : 'Join with your Mobile Number',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(color: Colors.white),
                        ),
                      )),

                      TextField(
                        controller:
                            codeSent ? otpController : mobileNumberController,
                        cursorColor: Colors.white,
                        //  keyboardType: TextInputType.text,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                            // hintStyle: TextStyle(color: Colors.grey),

                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.amber, width: 1.0),
                            ),
                            // hintText: '',
                            // hints
                            // icon: Icon(Icons.phone,color: Colors.white),
                            labelText: codeSent ? "OTP" : 'Mobile Number',
                            labelStyle: TextStyle(color: Colors.white)),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: RaisedButton(
                          onPressed: () async {
                            if (codeSent) {
                              bool finalResult = await DatabaseMethods()
                                  .signInWithOTP(
                                      otpController.text, verificationId);
                              if (finalResult) {
                                setState(() {
                                  isLoggedIn = true;
                                });
                              } else {
                                print("this is bad");
                              }
                            } else {
                              loginWithPhoneNumber(
                                  '+91${mobileNumberController.text}');
                            }
                          },
                          color: Colors.amber,
                          child: Text(
                            codeSent ? "Join" : "Verify",
                            style: GoogleFonts.lato(
                              textStyle:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      //  ListTile(title: Text('An OTP will be sent to this number',style: GoogleFonts.lato(
                      //               textStyle: TextStyle( color: Colors.white),
                      //             ),)),
                    ],
                  ),
                ),
              ],
            ),
      // child: Container(
      //   // width: 50,
      //   height: 50,
      //   child: RaisedButton(
      //     color: Colors.amber,
      //     onPressed: ()  { _buildBottomSheet(context);},
      //     child: Text(
      //       "My Account",
      //       style: GoogleFonts.lato(
      //         textStyle: TextStyle(fontSize: 20, color: Colors.black),
      //       ),
      //     ),
      //   ),
      // ),
    );

// Container _buildBottomSheet(BuildContext context) {
//   showModalBottomSheet(
//       isScrollControlled: true,
//       context: context,
//       builder: (builder) {
//         return SingleChildScrollView(
//           child: Container(
//             height: 500,

//             padding: EdgeInsets.all(8.0),
//             color: Color(0xff000000),
//             //color: Color(0xff272121),
//             //color: Colors.grey[850],
//             // decoration: BoxDecoration(
//             //   border: Border.all(color: Colors.blue, width: 2.0),
//             //   borderRadius: BorderRadius.circular(8.0),
//             //   color: Color(0xff000000)
//             // ),
//             child: ListView(
//               children: <Widget>[
//                 ListTile(
//                     title: Text(
//                   'An OTP will be sent to this number',
//                   style: GoogleFonts.lato(
//                     textStyle: TextStyle(color: Colors.white),
//                   ),
//                 )),
//                 TextField(
//                   cursorColor: Colors.white,
//                   keyboardType: TextInputType.number,
//                   style: TextStyle(
//                     color: Colors.white,
//                   ),
//                   decoration: InputDecoration(
//                       // hintStyle: TextStyle(color: Colors.grey),

//                       border: OutlineInputBorder(),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.amber, width: 1.0),
//                       ),
//                       // hintText: '',
//                       // hints
//                       // icon: Icon(Icons.phone,color: Colors.white),
//                       labelText: 'Mobile Number',
//                       labelStyle: TextStyle(color: Colors.white)),
//                 ),
//                 Container(
//                   alignment: Alignment.center,
//                   // child: RaisedButton.icon(
//                   //   icon: Icon(Icons.save),
//                   //   label: Text('Save and close'),
//                   //   onPressed: () => Navigator.pop(context),
//                   // ),
//                   child: RaisedButton(
//                     onPressed: () {},
//                     color: Colors.amber,
//                     child: Text(
//                       "Send",
//                       style: GoogleFonts.lato(
//                         textStyle: TextStyle(fontSize: 20, color: Colors.black),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       });
// }
  }
}
