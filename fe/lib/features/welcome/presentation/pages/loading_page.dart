import 'package:fitgoals/core/constants/asset_paths.dart';
import 'package:fitgoals/features/welcome/presentation/pages/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScreenLoading extends StatefulWidget {
  const ScreenLoading({super.key});

  @override
  State<ScreenLoading> createState() => _ScreenLoadingState();
}

class _ScreenLoadingState extends State<ScreenLoading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 60),
                child: SvgPicture.asset(AppAssets.images.logo),
              )),
          Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    AppAssets.images.viewLoading,
                    height: 250,
                    width: 250,
                  ),
                  const Text(
                    'Optimizing your roadmap',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 32),
                  ),
                ],
              ),
              const LoadingScreenProgress()
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Center(
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.2,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE1E1E1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
