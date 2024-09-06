import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class Navbar extends StatelessWidget {
  final int index;
  final Function(int) onChange;
  const Navbar({super.key, required this.index, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NavIconButton(
              icon: IconsaxPlusLinear.home_1,
              activeIcon: IconsaxPlusBold.home_1,
              label: "Home",
              isActive: index == 0,
              onPressed: () {
                onChange(0);
              }),
          NavIconButton(
              icon: IconsaxPlusLinear.weight_1,
              activeIcon: IconsaxPlusBold.weight_1,
              label: "Fitness",
              isActive: index == 1,
              onPressed: () {
                onChange(1);
              }),
          NavIconButton(
              icon: IconsaxPlusLinear.record_circle,
              activeIcon: IconsaxPlusBold.record_circle,
              label: "Meals",
              isActive: index == 2,
              onPressed: () {
                onChange(2);
              }),
          NavIconButton(
              icon: IconsaxPlusLinear.element_plus,
              activeIcon: IconsaxPlusBold.element_plus,
              label: "Supplements",
              isActive: index == 3,
              onPressed: () {
                onChange(3);
              }),
          NavIconButton(
              icon: IconsaxPlusLinear.user,
              activeIcon: IconsaxPlusBold.user,
              label: "Profile",
              isActive: index == 4,
              onPressed: () {
                onChange(4);
              })
        ],
      ),
    );
  }
}

class NavIconButton extends StatelessWidget {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final bool isActive;
  final Function() onPressed;
  const NavIconButton(
      {super.key,
      required this.icon,
      required this.activeIcon,
      required this.label,
      required this.isActive,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    ColorScheme scheme = Theme.of(context).colorScheme;

    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: onPressed,
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          direction: Axis.vertical,
          children: [
            Icon(isActive ? activeIcon : icon,
                color: isActive ? scheme.primary : scheme.onSurface),
            const SizedBox(
              height: 5,
            ),
            Text(label,
                style: TextStyle(
                    color: isActive ? scheme.primary : scheme.onSurface))
          ],
        ),
      ),
    );
  }
}
