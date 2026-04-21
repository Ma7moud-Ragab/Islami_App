import 'package:flutter/material.dart';
import 'package:islami/core/constants/assets.dart';
import 'package:islami/core/constants/colors.dart';
import 'package:islami/features/Time/time_screen.dart';
import 'package:islami/features/hadith/screens/hadith_screen.dart';
import 'package:islami/features/quran/screens/quran_screen.dart';
import 'package:islami/features/radio/screens/radio_screen.dart';
import 'package:islami/features/sebha/screens/sebha_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  late final List<Widget> screens;

  @override
  void initState() {
    super.initState();
    screens = const [
      QuranScreen(),
      HadithScreen(),
      SebhaScreen(),
      RadioScreen(),
      TimeScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.primary,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        showUnselectedLabels: false,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          _navItem(AppAssets.icBook, 'Quran', 0),
          _navItem(AppAssets.icHadith, 'Hadith', 1),
          _navItem(AppAssets.icSebha, 'Sebha', 2),
          _navItem(AppAssets.icRadio, 'Radio', 3),
          _navItem(AppAssets.icTime, 'Time', 4),
        ],
      ),
    );
  }

  BottomNavigationBarItem _navItem(String icon, String label, int index) {
    final isActive = selectedIndex == index;

    return BottomNavigationBarItem(
      label: label,
      icon: Image.asset(
        icon,
        height: 26,
        color: isActive ? Colors.white : Colors.black,
      ),
      activeIcon: Container(
        width: 60,
        height: 34,
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: AppColors.secondary.withOpacity(0.6),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Image.asset(icon, height: 26, color: Colors.white),
      ),
    );
  }
}
