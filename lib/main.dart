import 'package:flutter/material.dart';
import 'package:paisa/mainScreens/BettingRooms.dart';
import 'package:paisa/mainScreens/Shop.dart';

import 'package:paisa/mainScreens/Profile.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Color Bet',
        theme: ThemeData(
          primarySwatch: Colors.amber,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: 
         MyHomePage(title: "Color Bet")
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
  final screens = [BettingRooms(), ShopScreen(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff000000),
        appBar: AppBar(
          // elevation: 0,
          backgroundColor: Colors.amber[500],
          title: Text(
            widget.title,
          ), //style: TextStyle(color: Color(0xffe43f5a)),),
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
                icon: Icon(Icons.store),
                title: Text('Shop'),
                activeColor: Colors.white),
            BottomNavyBarItem(
                icon: Icon(Icons.person_outline),
                title: Text('My Profile'),
                activeColor: Colors.white),
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
        //           title: Text('Betting Rooms'), icon: Icons.apps),gi
        //       // TitledNavigationBarItem(title: Text('Search'), icon: Icons.search),
        //       // TitledNavigationBarItem(title: Text('Bag'), icon: Icons.card_travel),
        //       // TitledNavigationBarItem(title: Text('Orders'), icon: Icons.shopping_cart),
        //       TitledNavigationBarItem(
        //           title: Text('Profile'), icon: Icons.person_outline),
        //     ]),
        );
  }
}
