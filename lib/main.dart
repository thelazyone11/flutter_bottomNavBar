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
          BottomNavigationBarItem(
              title: Text('Home'),
              icon: _selectedIndex == 0
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(40.0),
                      child: Container(
                        height: 50,
                        width: 100,
                        color: Colors.indigo[50],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(
                              Icons.home,
                              color: Colors.indigo,
                            ),
                            Text(
                              "Home",
                              style: TextStyle(
                                  color: Colors.indigo,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    )
                  : Icon(
                      Icons.home,
                      color: Colors.black,
                    )),
          BottomNavigationBarItem(
              title: Text('Fav'),
              icon: _selectedIndex == 1
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(40.0),
                      child: Container(
                        height: 50,
                        width: 100,
                        color: Colors.pink[50],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(
                              Icons.favorite_border,
                              color: Colors.pink,
                            ),
                            Text(
                              "Likes",
                              style: TextStyle(
                                  color: Colors.pink,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    )
                  : Icon(
                      Icons.favorite_border,
                      color: Colors.black,
                    )),
          BottomNavigationBarItem(
              title: Text('Search'),
              icon: _selectedIndex == 2
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(40.0),
                      child: Container(
                        height: 50,
                        width: 100,
                        color: Colors.amber[50],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(
                              Icons.search,
                              color: Colors.amber,
                            ),
                            Text(
                              "Search",
                              style: TextStyle(
                                  color: Colors.amber,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    )
                  : Icon(
                      Icons.search,
                      color: Colors.black,
                    )),
          BottomNavigationBarItem(
              title: Text('Profile'),
              icon: _selectedIndex == 3
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(40.0),
                      child: Container(
                        height: 50,
                        width: 100,
                        color: Colors.lightBlue[50],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(
                              Icons.person_outline,
                              color: Colors.lightBlue,
                            ),
                            Text(
                              "Profile",
                              style: TextStyle(
                                  color: Colors.lightBlue,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    )
                  : Icon(
                      Icons.person_outline,
                      color: Colors.black,
                    )),
        ],
      ),
    );
  }
}
