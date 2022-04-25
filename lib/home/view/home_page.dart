import 'package:flutter/material.dart';
import 'package:ricoms/dashboard/view/dashboard.dart';
import 'package:ricoms/history/view/history.dart';
import 'package:ricoms/menu/view/menu.dart';
import 'package:ricoms/realtime_alarm/view/alarm.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  static const List<Widget> _widgetOptions = <Widget>[
    DashboardPage(),
    HistoryPage(),
    RealTimeAlarmPage(),
    MenuPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(
        _selectedIndex,
        duration: const Duration(milliseconds: 100),
        curve: Curves.bounceIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(''),
      // ),
      body: PageView(
        controller: _pageController,
        children: _widgetOptions,
        onPageChanged: (pageIndex) {
          setState(() {
            _selectedIndex = pageIndex;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_outlined),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_active_outlined),
            label: 'Alarm',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Menu',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.amber[600],
        onTap: _onItemTapped,
      ),
    );
  }
}
