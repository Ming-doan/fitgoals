import 'package:fitgoals/resources/app_colors.dart';
import 'package:fitgoals/screens/HomeScreens/fitness_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fitgoals/widgets/HomeScreens/navbar.dart';
import 'package:fitgoals/screens/HomeScreens/main_screen.dart';
import 'package:fitgoals/resources/app_assets.dart';

class HomeScreensLayout extends StatefulWidget {
  const HomeScreensLayout({super.key});

  @override
  State<HomeScreensLayout> createState() => _HomeScreensLayoutState();
}

class _HomeScreensLayoutState extends State<HomeScreensLayout> {
  int _selectedIndex = 0;

  final List<NavItem> _navItems = [
    NavItem(
      icon: AppAssets.icons.home,
      activeIcon: AppAssets.icons.homeActive,
      page: const MainScreen(),
    ),
    NavItem(
      icon: AppAssets.icons.fitness,
      activeIcon: AppAssets.icons.fitnessActive,
      page: const FitnessScreen(),
    ),
    NavItem(
      icon: AppAssets.icons.meal,
      activeIcon: AppAssets.icons.mealActive,
      page: const Center(child: Text('Meals')),
    ),
    NavItem(
      icon: AppAssets.icons.supplement,
      activeIcon: AppAssets.icons.supplementActive,
      page: const Center(child: Text('Supplements')),
    ),
    NavItem(
      icon: AppAssets.icons.user,
      activeIcon: AppAssets.icons.userActive,
      page: const Center(child: Text('Profile')),
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
      value: const SystemUiOverlayStyle(
          systemNavigationBarColor: AppColors.background),
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
