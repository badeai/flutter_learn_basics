import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('app bar title'),
          backgroundColor: Colors.deepOrange,
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {},
            child: Text('click me'),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              label: 'home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'settings',
              icon: Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }
}
