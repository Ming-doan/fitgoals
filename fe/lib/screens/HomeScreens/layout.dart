import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fitgoals/widgets/HomeScreens/navbar.dart';
import 'package:fitgoals/screens/HomeScreens/main_screen.dart';
import 'package:fitgoals/utils/constants.dart';

class HomeScreensLayout extends StatefulWidget {
  const HomeScreensLayout({super.key});

  @override
  State<HomeScreensLayout> createState() => _HomeScreensLayoutState();
}

class _HomeScreensLayoutState extends State<HomeScreensLayout> {
  int _selectedIndex = 0;

  static const List<NavItem> _navItems = [
    NavItem(
      icon: IconConstants.home,
      activeIcon: IconConstants.homeActive,
      page: MainScreen(),
    ),
    NavItem(
      icon: IconConstants.fitness,
      activeIcon: IconConstants.fitnessActive,
      page: Center(child: Text('Fitness')),
    ),
    NavItem(
      icon: IconConstants.meal,
      activeIcon: IconConstants.mealActive,
      page: Center(child: Text('Meals')),
    ),
    NavItem(
      icon: IconConstants.supplement,
      activeIcon: IconConstants.supplementActive,
      page: Center(child: Text('Supplements')),
    ),
    NavItem(
      icon: IconConstants.user,
      activeIcon: IconConstants.userActive,
      page: Center(child: Text('Profile')),
    ),
  ];

  void _onItemSelected(int index) {
    if (_selectedIndex != index) {
      setState(() => _selectedIndex = index);
      HapticFeedback.lightImpact();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(systemNavigationBarColor: Colors.white),
      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _navItems.map((item) => item.page).toList(),
        ),
        bottomNavigationBar: Navbar(
          items: _navItems,
          selectedIndex: _selectedIndex,
          onItemSelected: _onItemSelected,
        ),
      ),
    );
  }
}
