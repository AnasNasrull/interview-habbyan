import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:interview_test/presentation/pages/bookmark_screen.dart';
import 'package:interview_test/presentation/pages/home_screen.dart';
import 'package:interview_test/presentation/pages/profile_screen.dart';
import 'package:interview_test/presentation/pages/search_screen.dart';
import 'package:interview_test/presentation/utility/colors.dart';

class BottomNavigationBarPages extends StatefulWidget {
  const BottomNavigationBarPages({super.key});

  @override
  State<BottomNavigationBarPages> createState() =>
      _BottomNavigationBarPagesState();
}

class _BottomNavigationBarPagesState extends State<BottomNavigationBarPages> {
  int activeIndexPages = 0;

  List menus = [
    FeatherIcons.home,
    FeatherIcons.search,
    FeatherIcons.bookmark,
    FeatherIcons.user,
  ];

  List pages = [
    const HomeScreen(),
    const SearchScreen(),
    const BookmarkScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: activeIndexPages,
        children:
            List.generate(pages.length, (index) => pages[activeIndexPages]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: chocolateColor,
        items: menus
            .map((icon) => BottomNavigationBarItem(
                icon: Icon(icon), label: icon.toString()))
            .toList(),
        showSelectedLabels: false,
        currentIndex: activeIndexPages,
        showUnselectedLabels: false,
        unselectedItemColor: const Color(0xFFBFBFBF),
        onTap: (index) {
          setState(() {
            activeIndexPages = index;
          });
        },
      ),
    );
  }
}
