import 'package:flutter/material.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:ui/screens/chat_page.dart';
import 'package:ui/screens/explore_page.dart';
import 'package:ui/screens/home_page.dart';
import 'package:ui/screens/profile_page.dart';
import 'package:ui/screens/trend_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget? _child;

  @override
  void initState() {
    _child = const HomePage();
    super.initState();
  }

  int selectedIndex = 0;

  void _handleNavigationChange(int index) {
    setState(() {
      selectedIndex = index;
      switch (index) {
        case 0:
          _child = const HomePage();
          break;
        case 1:
          _child = const TrendPage();
          break;
        case 2:
          _child = const ExplorePage();
          break;
        case 3:
          _child = const ChatPage();
          break;
        case 4:
          _child = const ProfilePage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF192038)),
        textTheme: const TextTheme(
          labelLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          labelMedium: TextStyle(color: Colors.white70, fontSize: 12),
          labelSmall: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),
          bodySmall: TextStyle(fontSize: 10, color: Colors.white70),
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFF192038),
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            'Welcome  John Doe',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          actions: [
            Stack(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const ImageIcon(AssetImage('assets/images/bell.png')),
                ),
                const Positioned(
                  bottom: 16,
                  left: 8,
                    child: Icon(
                  Icons.brightness_1,
                  color: Colors.red,
                  size: 12,
                )),
              ],
            ),
          ],
        ),
        extendBody: true,
        body: _child,
        bottomNavigationBar: FluidNavBar(
          style: const FluidNavBarStyle(
            barBackgroundColor: Color(0xFF222B45),
            iconUnselectedForegroundColor: Colors.white54,
            iconSelectedForegroundColor: Colors.white,
          ),
          icons: [
            FluidNavBarIcon(
              icon: Icons.home,
              backgroundColor: selectedIndex == 0
                  ? const Color(0xFFFF3D71)
                  : Colors.transparent,
              extras: {"label": "Home"},
            ),
            FluidNavBarIcon(
                icon: Icons.local_fire_department_outlined,
                backgroundColor: selectedIndex == 1
                    ? const Color(0xFFFF3D71)
                    : Colors.transparent,
                extras: {"label": "Trend"}),
            FluidNavBarIcon(
                icon: Icons.explore,
                backgroundColor: selectedIndex == 2
                    ? const Color(0xFFFF3D71)
                    : Colors.transparent,
                extras: {"label": "Explore"}),
            FluidNavBarIcon(
                icon: Icons.message,
                backgroundColor: selectedIndex == 3
                    ? const Color(0xFFFF3D71)
                    : Colors.transparent,
                extras: {"label": "Chat"}),
            FluidNavBarIcon(
                icon: Icons.person_outline,
                backgroundColor: selectedIndex == 4
                    ? const Color(0xFFFF3D71)
                    : Colors.transparent,
                extras: {"label": "Profile"}),
          ],
          onChange: (index) => _handleNavigationChange(index),
          scaleFactor: 1.5,
          defaultIndex: 0,
          itemBuilder: (icon, item) => Semantics(
            label: icon.extras!["label"],
            child: item,
          ),
        ),
      ),
    );
  }
}
