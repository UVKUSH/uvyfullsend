import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/home/home.dart';
import 'pages/date.dart';
import 'pages/heart.dart';
import 'pages/Dm.dart';
import 'pages/profile.dart';

import 'provider/ThemeProvider.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        child: const BottomNavigationBarExampleApp(),
      ),
    );

class BottomNavigationBarExampleApp extends StatelessWidget {
  const BottomNavigationBarExampleApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: Provider.of<ThemeProvider>(context).themeMode,
      home: const BottomNavigationBarExample(),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({Key? key});

  @override
  _BottomNavigationBarExampleState createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _getPage(_selectedIndex),
      ),
      bottomNavigationBar: SizedBox(
        height: 100, // Set the desired height
        child: BottomNavBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return HomeScreen();
      case 1:
        return DateScreen();
      case 2:
        return HeartScreen();
      case 3:
        return DMScreen();
      case 4:
        return ProfileScreen();
      default:
        return Container();
    }
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  final int selectedIndex;
  final Function(int) onItemTapped;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Image.asset('assets/home.png', height: 32, width: 32),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/tinder.png', height: 32, width: 32),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/love.png', height: 32, width: 32),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/dm.png', height: 32, width: 32),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/user.png', height: 32, width: 32),
          label: '',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: (index) {
        onItemTapped(index);
      },
    );
  }
}
