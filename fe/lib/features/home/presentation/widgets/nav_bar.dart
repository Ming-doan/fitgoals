import 'package:fitgoals/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavItem {
  final String icon;
  final String activeIcon;
  final Widget page;

  const NavItem({
    required this.icon,
    required this.activeIcon,
    required this.page,
  });
}

class Navbar extends StatelessWidget {
  final List<NavItem> items;
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  const Navbar({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [BoxShadow(color: Color(0xFFE1E1E1), blurRadius: 10)],
      ),
      child: SafeArea(
        child: SizedBox(
          height: 60,
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  items.length,
                  (index) => _buildNavItem(index),
                ),
              ),
              _buildIndicator(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index) {
    final item = items[index];
    return GestureDetector(
      onTap: () => onItemSelected(index),
      child: SizedBox(
        width: 60,
        height: 60,
        child: Center(
          child: SvgPicture.asset(
            selectedIndex == index ? item.activeIcon : item.icon,
            width: 24,
            height: 24,
          ),
        ),
      ),
    );
  }

  Widget _buildIndicator(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final itemWidth = width / items.length;
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      bottom: 0,
      left: itemWidth * (selectedIndex + 0.5) - 20.5,
      child: Container(
        width: 41,
        height: 6,
        decoration: const BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.vertical(top: Radius.circular(3)),
        ),
      ),
    );
  }
}
