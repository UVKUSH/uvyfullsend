import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/ThemeProvider.dart';
import 'makepost.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Retrieve the themeProvider instance
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('X',
            style: TextStyle(
                color: themeProvider.isDarkMode ? Colors.white : Colors.black)),
        backgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.white,
        actions: [
          TextButton.icon(
            onPressed: () {
              _tabController.animateTo(0);
            },
            icon: Icon(Icons.message),
            label: Text('Unread'),
            style: TextButton.styleFrom(
                foregroundColor:
                    themeProvider.isDarkMode ? Colors.white : Colors.black),
          ),
          TextButton.icon(
            onPressed: () {
              _tabController.animateTo(1);
            },
            icon: Icon(Icons.whatshot),
            label: Text('Hot'),
            style: TextButton.styleFrom(
                foregroundColor:
                    themeProvider.isDarkMode ? Colors.white : Colors.black),
          ),
          TextButton.icon(
            onPressed: () {
              _tabController.animateTo(2);
            },
            icon: Icon(Icons.new_releases),
            label: Text('New'),
            style: TextButton.styleFrom(
                foregroundColor:
                    themeProvider.isDarkMode ? Colors.white : Colors.black),
          ),
        ],
        iconTheme: IconThemeData(
            color: themeProvider.isDarkMode ? Colors.white : Colors.black),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: themeProvider.isDarkMode ? Colors.black : Colors.yellow,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Settings',
                    style: TextStyle(
                      color: themeProvider.isDarkMode
                          ? Colors.white
                          : Colors.black,
                      fontSize: 24,
                    ),
                  ),
                  Switch(
                    value: themeProvider.isDarkMode,
                    onChanged: (value) {
                      themeProvider.toggleTheme();
                    },
                    activeColor: Colors.yellow,
                    inactiveThumbColor: Colors.grey[800],
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Option 1'),
              onTap: () {
                // Handle option 1
              },
            ),
            ListTile(
              title: Text('Option 2'),
              onTap: () {
                // Handle option 2
              },
            ),
            // Add more options as needed
          ],
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            SizedBox(
              height: 0,
              child: TabBar(
                controller: _tabController,
                tabs: [
                  Tab(text: 'Unread'),
                  Tab(text: 'Hot'),
                  Tab(text: 'New'),
                ],
                indicatorColor: Colors.transparent,
                labelColor: Colors.transparent,
                unselectedLabelColor: Colors.transparent,
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Center(child: Text('Unread Content')),
                  Center(child: Text('Hot Content')),
                  Center(child: Text('New Content')),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MakePostPage()),
          );
        },
        child: Icon(
          Icons.add,
          size: 36, // Set the desired size for the FAB icon
        ),
        backgroundColor: Colors.yellow, // Set FAB background color
        foregroundColor: Colors.black, // Set FAB icon color
      ),
    );
  }
}
