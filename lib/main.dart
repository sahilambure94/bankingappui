import 'package:bankingappui/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodySmall: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
        primarySwatch: Colors.blue,
        fontFamily: 'Degular',
        scaffoldBackgroundColor: const Color(0xFF160729),
      ),
      home: const Run(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Run extends StatefulWidget {
  const Run({super.key});

  @override
  State<Run> createState() => _RunState();
}

class _RunState extends State<Run> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    MyHomePage(),
    Text(
      'Index 1: Expenses',
      style: optionStyle,
    ),
    Text(
      'Index 2: Analysis',
      style: optionStyle,
    ),
    Text(
      'Index 3: User',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        clipBehavior:
            Clip.hardEdge, //or better look(and cost) using Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(24),
            topLeft: Radius.circular(24),
          ),
        ),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Iconsax.home),
              label: 'Home',
              backgroundColor: Color(0xFF160729),
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.gallery_export),
              label: 'Business',
              backgroundColor: Color(0xFF160729),
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.arrange_square),
              label: 'School',
              backgroundColor: Color(0xFF160729),
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.user),
              label: 'Settings',
              backgroundColor: Color(0xFF160729),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.limeAccent,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
