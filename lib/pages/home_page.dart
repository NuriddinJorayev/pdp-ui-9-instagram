import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pdpui9/anyWidgets/feed_panel.dart';




class Home extends StatefulWidget {
  final String id = "home_page";
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<FeedPanel> pages = [];

 bool isDark = true;
 int _BNbarselectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final _itemColor = isDark ? Colors.white : Colors.black;
    final  _panelColor = isDark ? Colors.black : Colors.white;

    pages = [
      FeedPanel(_itemColor, _panelColor),
      FeedPanel(_itemColor, _panelColor),
      FeedPanel(_itemColor, _panelColor),
      FeedPanel(_itemColor, _panelColor),
      FeedPanel(_itemColor, _panelColor),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: _panelColor,
        elevation: 0.0,
        centerTitle: true,
        leading: Icon(Feather.camera, color: _itemColor),
        title: Text('Instagram',
          style: TextStyle(color: _itemColor, letterSpacing: 1.1),),
        actions: [
          Row(
            children: [
              Icon(Feather.tv, color: _itemColor),
              SizedBox(width: 20.0),
              Icon(Feather.send, color: _itemColor),
              SizedBox(width: 15.0),
            ],
          )
        ],
      ),
      body: pages[_BNbarselectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (i){
          setState(() {
            _BNbarselectedIndex = i;
          });
        },
        currentIndex: _BNbarselectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,  // _itemColor
        // unselectedItemColor: Colors.grey[800],
        // backgroundColor: _panelColor,
        items: [
          BottomNavigationBarItem(icon: Icon(Foundation.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Feather.search), label: ""),
          BottomNavigationBarItem(icon: Icon(Feather.plus_square), label: ""),
          BottomNavigationBarItem(icon: Icon(Feather.heart), label: ""),
          BottomNavigationBarItem(icon: Icon(Feather.user), label: ""),
        ],
      ),
    );
  }
}
