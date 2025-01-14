import 'package:book_tickets/pages/home/ui/ChatScreen.dart';
import 'package:book_tickets/screens.dart/booked_ticket.dart';
import 'package:book_tickets/screens.dart/home_screen.dart';
import 'package:book_tickets/screens.dart/profile_screen.dart';
import 'package:book_tickets/utils/app_styles.dart';
import 'package:book_tickets/widgets/voiceinput.dart';
import 'package:dot_curved_bottom_nav/dot_curved_bottom_nav.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentPage = 0;
  final ScrollController scrollController = ScrollController();

  static late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = [
      HomeScreen(controller: scrollController),
      Chatscreen(),
      TicketsPage(),
       ProfilePage(),
     // VoiceInputWidget()
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions[_currentPage],
      ),
      extendBody: true,

      bottomNavigationBar: DotCurvedBottomNav(

          //hideOnScroll: true,
          indicatorColor: Styles.lightgreen,
          backgroundColor: Colors.black,
          scrollController: scrollController,
          animationDuration: const Duration(milliseconds: 300),
          animationCurve: Curves.ease,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          selectedIndex: _currentPage,
          indicatorSize: 5,
          borderRadius: 25,
          hideOnScroll: true,
          height: 70,
          onTap: (index) {
            setState(() => _currentPage = index);
          },
          items: [
            Icon(
              Icons.home_rounded,
              color: _currentPage == 0 ? Styles.lightgreen : Colors.white,
            ),
            Icon(
              Icons.chat_rounded,
              color: _currentPage == 1 ? Styles.lightgreen : Colors.white,
            ),
            Icon(
              Icons.bookmark_sharp,
              color: _currentPage == 2 ? Styles.lightgreen : Colors.white,
            ),
            Icon(
              Icons.person,
              color: _currentPage == 3 ? Styles.lightgreen : Colors.white,
            ),
          ]),
      // bottomNavigationBar: BottomNavigationBar(

      //    backgroundColor: Styles.MorelighterGreen,
      //   currentIndex: _selectedIndex,
      //   onTap: _onItemTapped,
      //   elevation: 10,
      //   showSelectedLabels: false,
      //   showUnselectedLabels: false,
      //   selectedItemColor: Colors.black,
      //   unselectedItemColor: Colors.black87,
      //   type: BottomNavigationBarType.fixed,
      //   iconSize: 30,

      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home_rounded ) , label: 'Home' , activeIcon: Icon(Icons.home_rounded)),
      //     BottomNavigationBarItem(icon: Icon(Icons.chat_rounded) , label: 'Chat' , activeIcon: Icon(Icons.chat_rounded)),
      //     BottomNavigationBarItem(icon: Icon(Icons.bookmark_sharp) , label: 'MyBookings' , activeIcon: Icon(Icons.bookmark_sharp)),
      //     BottomNavigationBarItem(icon: Icon(Icons.person) , label: 'Person' , activeIcon: Icon(Icons.person)),
      //   ]
      // ),
    );
  }
}
