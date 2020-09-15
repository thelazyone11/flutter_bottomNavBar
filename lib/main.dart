import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Color> backColors = [
    Colors.indigo,
    Colors.pink,
    Colors.amber,
    Colors.lightBlue
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _bottomNavItem(IconData icon, Color contanerColor, Color iconColor, int index,
      String title) {
    return BottomNavigationBarItem(
        title: Text(title),
        icon: _selectedIndex == index
            ? ClipRRect(
                borderRadius: BorderRadius.circular(40.0),
                child: Container(
                  height: 50,
                  width: 100,
                  color: contanerColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(
                        icon,
                        color: iconColor,
                      ),
                      Text(
                        title,
                        style: TextStyle(
                            color: iconColor, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              )
            : Icon(
                icon,
                color: Colors.black,
              ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(milliseconds: 400),
        curve: Curves.ease,
        color: backColors[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepOrangeAccent,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          _bottomNavItem(
              Icons.home, Colors.indigo[50], Colors.indigo, 0, "Home"),
          _bottomNavItem(
              Icons.favorite_border, Colors.pink[50], Colors.pink, 1, "Likes"),
          _bottomNavItem(
              Icons.search, Colors.amber[50], Colors.amber, 2, "Search"),
          _bottomNavItem(Icons.person_outline, Colors.lightBlue[50],
              Colors.lightBlue, 3, "Profile")
        ],
      ),
    );
  }
}
