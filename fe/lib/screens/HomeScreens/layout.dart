import 'package:fitgoals/screens/HomeScreens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fitgoals/widgets/HomeScreens/navbar.dart';

class HomeScreensLayout extends StatefulWidget {
  const HomeScreensLayout({super.key});

  @override
  State<HomeScreensLayout> createState() => _HomeScreensLayoutState();
}

class _HomeScreensLayoutState extends State<HomeScreensLayout> {
  int _index = 0;
  final PageController _pages = PageController(initialPage: 0);

  void _onPageChanged(int index) {
    setState(() {
      _index = index;
      _pages.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(systemNavigationBarColor: Colors.white),
      child: Scaffold(
        body: SafeArea(
          child: PageView(
            controller: _pages,
            onPageChanged: (int index) {
              _onPageChanged(index);
              HapticFeedback.lightImpact();
            },
            children: const [
              MainScreen(),
              Center(child: Text("Fitness")),
              Center(child: Text("Meals")),
              Center(child: Text("Supplements")),
              Center(child: Text("Profile")),
            ],
          ),
        ),
        bottomNavigationBar: Navbar(
          index: _index,
          onChange: _onPageChanged,
        ),
      ),
    );
  }
}
