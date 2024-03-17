import 'package:flutter/material.dart';
import 'package:parcial/Screens/temperature.dart';
import 'package:parcial/Screens/physics.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>  {

  List pages = [
    TemperatureScreen(),
    PhysicsScreen()
  ];

  int currentIndex = 0;
  void _navigateBottomBar(int index){
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomNavigationBar(
          unselectedFontSize: 0,
          selectedFontSize: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          currentIndex: currentIndex,
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
