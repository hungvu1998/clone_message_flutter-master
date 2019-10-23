import 'package:clone_message_flutter/src/widget/list_channel.dart';
import 'package:clone_message_flutter/src/widget/list_chat.dart';
import 'package:clone_message_flutter/src/widget/list_story.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    ListChat(),
    ListStory(),
    ListChannel(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
      selectedIconTheme: IconThemeData(color: Colors.black87),
      unselectedIconTheme: IconThemeData(color: Colors.grey.shade400),
      backgroundColor: Colors.white,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.solidComment,size: 24,),
          title: Container(),
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.userFriends,size: 24,),
          title: Container(),
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.solidCompass,size: 24,),
          title: Container(),
        ),
      ],
      currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
      onTap:_onItemTapped,
      ),
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

