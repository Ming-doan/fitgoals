import 'package:fitgoals/core/constants/asset_paths.dart';
import 'package:fitgoals/core/theme/app_colors.dart';
import 'package:fitgoals/core/constants/strings.dart';
// import 'package:fitgoals/features/home/presentation/pages/home_layout.dart';
import 'package:fitgoals/features/welcome/presentation/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const WelcomePage(),
        ),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBackground,
      body: Center(
        child: SvgPicture.asset(
          AppAssets.images.logo,
          semanticsLabel: AppTexts.appName,
        ),
      ),
    );
  }
}
