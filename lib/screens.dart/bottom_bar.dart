import 'package:book_tickets/pages/home/ui/ChatScreen.dart';
import 'package:book_tickets/screens.dart/home_screen.dart';
import 'package:book_tickets/screens.dart/profile_screen.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0 ;

  static final List<Widget>_widgetOptions =<Widget>[
    HomeScreen(),
    Chatscreen(),
    const Text('MyBookings'),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        elevation: 10,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black87,
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded ) , label: 'Home' , activeIcon: Icon(Icons.home_rounded)),
          BottomNavigationBarItem(icon: Icon(Icons.chat_rounded) , label: 'Chat' , activeIcon: Icon(Icons.chat_rounded)),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark_sharp) , label: 'MyBookings' , activeIcon: Icon(Icons.bookmark_sharp)),
          BottomNavigationBarItem(icon: Icon(Icons.person) , label: 'Person' , activeIcon: Icon(Icons.person)),
        ]
      ),
    );
  }
}