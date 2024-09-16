import 'package:fitgoals/core/theme/app_colors.dart';
import 'package:fitgoals/features/home/presentation/pages/fitness_page.dart';
import 'package:fitgoals/features/home/presentation/pages/main_page.dart';
import 'package:fitgoals/features/home/presentation/pages/nutrition_page.dart';
import 'package:fitgoals/features/home/presentation/pages/supplement_page.dart';
import 'package:fitgoals/features/home/presentation/pages/user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fitgoals/features/home/presentation/widgets/nav_bar.dart';
import 'package:fitgoals/core/constants/asset_paths.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int _selectedIndex = 0;

  final List<NavItem> _navItems = [
    NavItem(
      icon: AppAssets.icons.home,
      activeIcon: AppAssets.icons.homeActive,
      page: const MainPage(),
    ),
    NavItem(
      icon: AppAssets.icons.fitness,
      activeIcon: AppAssets.icons.fitnessActive,
      page: const FitnessPage(),
    ),
    NavItem(
      icon: AppAssets.icons.meal,
      activeIcon: AppAssets.icons.mealActive,
      page: const NutritionPage(),
    ),
    NavItem(
      icon: AppAssets.icons.supplement,
      activeIcon: AppAssets.icons.supplementActive,
      page: const SupplementPage(),
    ),
    NavItem(
      icon: AppAssets.icons.user,
      activeIcon: AppAssets.icons.userActive,
      page: const UserPage(),
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
