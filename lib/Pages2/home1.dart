import 'package:flutter/material.dart';
class Home1 extends StatelessWidget {
  const Home1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center (
        child: Text("Nose", style: TextStyle(
          color: Colors.blue, // Cambia "Colors.blue" al color que desees
        ),),

      ),
    );
  }
}
