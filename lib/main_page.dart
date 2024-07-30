import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Row(
        children: [
          NavigationRail(
            backgroundColor: Color(0xff2A5270),
            elevation: 12,
            selectedIndex: _selectedIndex,
            labelType: NavigationRailLabelType.all,
            selectedLabelTextStyle: TextStyle(
                color: Colors.blue,
                fontSize: 30,
                letterSpacing: 1,
                decorationThickness: 2.5),
            unselectedLabelTextStyle: TextStyle(
              color: Colors.grey,
              fontSize: 20,
              letterSpacing: 0.8,
            ),
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            indicatorColor: Color(0xff2A5270),
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.set_meal),
                indicatorColor: Color(0xff2A5270),
                indicatorShape: InputBorder.none,
                label: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: RotatedBox(quarterTurns: -1, child: Text('Favorites')),
                ),
              ),
              NavigationRailDestination(
                icon: SizedBox.shrink(),
                label: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: RotatedBox(quarterTurns: -1, child: Text('History')),
                ),
              ),
              NavigationRailDestination(
                icon: SizedBox.shrink(),
                label: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: RotatedBox(quarterTurns: -1, child: Text('List')),
                ),
              ),
            ],
          ),
          Expanded(
            flex: 3,
            child: selectedMenu(_selectedIndex),
          ),
        ],
      ),
    );
  }

  Widget selectedMenu(index) {
    switch (index) {
      case 0:
        return _buildFavoritesListView();
      case 1:
        return _buildHistoryListView();
      case 2:
        return _buildListView();
      default:
        return _buildFavoritesListView();
    }
  }

  Widget _buildFavoritesListView() {
    return ListView(
      children: [
        ListTile(
          title: Text('Favorite Book'),
          onTap: () {
            //go somewhere or do something
          },
        ),
        ListTile(
          title: Text('Favorite Song'),
          onTap: () {
            //go somewhere or do something
          },
        ),
        ListTile(
          title: Text('Favorite Movie'),
          onTap: () {
            //go somewhere or do something
          },
        ),
      ],
    );
  }

  Widget _buildHistoryListView() {
    return ListView(
      children: [
        ListTile(
          title: Text('My History'),
          onTap: () {
            //go somewhere or do something
          },
        ),
        ListTile(
          title: Text('Your History'),
          onTap: () {
            //go somewhere or do something
          },
        ),
        ListTile(
          title: Text('Our History'),
          onTap: () {
            //go somewhere or do something
          },
        ),
      ],
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text('List item $index'),
        );
      },
    );
  }
}
