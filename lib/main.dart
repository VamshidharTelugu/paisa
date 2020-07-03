import 'package:flutter/material.dart';
import 'package:paisa/mainScreens/BettingRooms.dart';
import 'package:paisa/mainScreens/Profile.dart';

import 'package:titled_navigation_bar/titled_navigation_bar.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: "Paisa")
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final screens = [BettingRooms(), Container(),Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000000),
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(widget.title,),//style: TextStyle(color: Color(0xffe43f5a)),),
      ),
      body: screens[_selectedIndex],
       bottomNavigationBar: BottomNavyBar(
         backgroundColor: Color(0xff000000),
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
   selectedIndex: _selectedIndex,
   showElevation: true, // use this to remove appBar's elevation
   onItemSelected: (index) => setState(() {
              _selectedIndex = index;
              // _pageController.animateToPage(index,
              //     duration: Duration(milliseconds: 300), curve: Curves.ease);
    }),
   items: [
     BottomNavyBarItem(
       icon: Icon(Icons.apps),
       title: Text('Home'),
       activeColor: Colors.white,
     ),
         BottomNavyBarItem(
         icon: Icon(Icons.show_chart),
         title: Text('Leader Board'),
         activeColor: Colors.white
     ),

     BottomNavyBarItem(
         icon: Icon(Icons.people),
         title: Text('Me'),
         activeColor: Colors.white
     ),
   

   ],
)
      
      // TitledBottomNavigationBar(
        
          
          
      //     currentIndex: _selectedIndex, // Use this to update the Bar giving a position
      //     onTap: (index) {
      //       setState(() {
      //          _selectedIndex = index;
      //       });
           
      //      // print("Selected Index: $index");
      //     },
      //     items: [
      //       TitledNavigationBarItem(
      //           title: Text('Betting Rooms'), icon: Icons.apps),
      //       // TitledNavigationBarItem(title: Text('Search'), icon: Icons.search),
      //       // TitledNavigationBarItem(title: Text('Bag'), icon: Icons.card_travel),
      //       // TitledNavigationBarItem(title: Text('Orders'), icon: Icons.shopping_cart),
      //       TitledNavigationBarItem(
      //           title: Text('Profile'), icon: Icons.person_outline),
      //     ]),
    );
  }
}
