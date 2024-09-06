import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class HeaderBar extends StatelessWidget {
  final List<Widget>? actions;
  const HeaderBar({super.key, this.actions});

  @override
  Widget build(BuildContext context) {
    bool isLastPage = Navigator.of(context).canPop();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 50,
      child: Row(
        children: [
          isLastPage
              ? IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(IconsaxPlusLinear.arrow_left_1),
                )
              : const SizedBox(),
          const SizedBox(width: 10),
          SvgPicture.asset(
            "assets/General/Logo.svg",
            semanticsLabel: "Fitgoals",
            width: 100,
          )
        ],
      ),
    );
  }
}
