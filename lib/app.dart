import 'package:flutter/material.dart';
import 'package:ricoms/dashboard/view/dashboard.dart';
import 'package:ricoms/history/view/history.dart';
import 'package:ricoms/history/view/table.dart';
import 'package:ricoms/login/view/login_page.dart';
import 'package:ricoms/menu/view/menu.dart';
import 'package:ricoms/realtime_alarm/view/alarm.dart';
import 'package:ricoms/realtime_alarm/view/alarm2.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  static const String _title = 'Ricoms';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: LoginPage(),
    );
  }
}

class AppPages extends StatefulWidget {
  const AppPages({Key? key}) : super(key: key);

  @override
  State<AppPages> createState() => _AppPagesState();
}

class _AppPagesState extends State<AppPages> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
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
      //   title: const Text('BottomNavigationBar Sample'),
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
