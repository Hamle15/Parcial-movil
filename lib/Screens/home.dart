import 'package:flutter/material.dart';
import 'package:parcial/Screens/temperature.dart';
import 'package:parcial/Screens/physics.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>  {
  int _selectedIndex = 0;
  String appBarTitle = "Temperature";

  void _navigateBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    });

    switch(index) {
      case 0:
        appBarTitle = "Temperature";
        break;
      case 1:
        appBarTitle = "Physics";
        break;

    }
  }

  List pages = [
    TemperatureScreen(),
    PhysicsScreen()
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(top: 5, left: 7),
          child: Icon(
            Icons.menu,
            size: 30,
            color: Colors.black54,
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.blue[300],
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Icon(
                Icons.favorite,
                size: 36,
              ),
            ),
            ListTile(
              leading: Icon(Icons.wb_sunny),
              title: Text('Temperature'),
              selected: _selectedIndex == 0,
              onTap: () {
                Navigator.pop(context);
                _navigateBottomBar(0);
              },
            ),
            ListTile(
              leading: Icon(Icons.fitness_center),
              title: Text('Physics'),
              selected: _selectedIndex == 1,
              onTap: () {
                Navigator.pop(context);
                _navigateBottomBar(1);
              },
            ),

          ],
        ) ,
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomNavigationBar(
          unselectedFontSize: 0,
          selectedFontSize: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          currentIndex: _selectedIndex,
          onTap: _navigateBottomBar,
          selectedItemColor: Colors.black54,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          showUnselectedLabels: false,
          showSelectedLabels: false,
          elevation: 0,
          items: [
            BottomNavigationBarItem(label: 'Home',icon: Icon(Icons.apps)),
            BottomNavigationBarItem(label: 'XD',icon: Icon(Icons.apps)),
          ],
        ),
      ),
    );
  }
}
