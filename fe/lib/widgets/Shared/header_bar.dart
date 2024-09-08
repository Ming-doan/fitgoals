import 'package:fitgoals/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderBar extends StatelessWidget {
  final List<Widget>? actions;
  const HeaderBar({super.key, this.actions});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        height: 56, // Adjust this value as needed
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              LogoConstants.horizontal,
              height: 32, // Adjust this value to fit your logo
              fit: BoxFit.contain,
            ),
            if (actions != null) Row(children: actions!),
          ],
        ),
      ),
    );
  }
}
