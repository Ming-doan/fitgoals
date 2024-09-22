import 'package:fitgoals/core/constants/asset_paths.dart';
import 'package:fitgoals/core/theme/app_colors.dart';
import 'package:fitgoals/features/welcome/presentation/pages/set_height_page.dart';
import 'package:fitgoals/features/welcome/presentation/widgets/list_wheel_scrool_age.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScreenSetAge extends StatefulWidget {
  const ScreenSetAge({super.key});

  @override
  State<ScreenSetAge> createState() => _ScreenSetAgeState();
}

class _ScreenSetAgeState extends State<ScreenSetAge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(33),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(AppAssets.images.logo),
              const Padding(
                padding: EdgeInsets.all(35.0),
                child: Center(
                  child: Text(
                    'Enter your age',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                ),
              ),
              const ListWheelScrollAge(),
              Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Center(
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width / 2.5,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Center(
                              child: Text(
                                'Previous',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ScreenSetHeight(),
                              ),
                            );
                          },
                          child: Center(
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Center(
                                child: Text(
                                  'Next',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
