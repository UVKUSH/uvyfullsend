import 'package:flutter/material.dart';

class DMScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Messages',
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Theme.of(context).textTheme.bodyLarge!.color,
                fontWeight: FontWeight.bold,
              ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () {
              // Do something when add icon is pressed
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(
                  color: Theme.of(context).textTheme.bodyMedium!.color,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Theme.of(context).iconTheme.color,
                ),
                filled: true,
                fillColor: Theme.of(context).cardColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 12.0,
                ),
              ),
            ),
          ),
        ),
      ),
      body: DefaultTabController(
        length: 3, // Changed length to 4 to include DMScreen
        child: Column(
          children: <Widget>[
            TabBar(
              labelColor: Theme.of(context).textTheme.bodyLarge!.color,
              unselectedLabelColor:
                  Theme.of(context).textTheme.bodyMedium!.color,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  color: Theme.of(context).textTheme.bodyLarge!.color!,
                  width: 2.0,
                ),
                insets: EdgeInsets.symmetric(horizontal: 16.0),
              ),
              tabs: <Widget>[
                Tab(text: 'General'),
                Tab(text: 'Groups'),
                Tab(text: 'Unknown'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  Center(child: Text('General tab')),
                  Center(child: Text('Groups tab')),
                  Center(child: Text('Unknown tab')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
