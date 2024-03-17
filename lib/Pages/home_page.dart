import 'package:flutter/material.dart';
import 'package:parcial/Pages2/home.dart';
import 'package:parcial/Pages2/home1.dart';
import 'package:parcial/Pages2/home3.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>  {

  List pages = [
    Home(),
    Home1(),
    Home3(),
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
            BottomNavigationBarItem(label: 'Elbillo',icon: Icon(Icons.table_bar)),
          ],
        ),
      ),
    );
  }
}
