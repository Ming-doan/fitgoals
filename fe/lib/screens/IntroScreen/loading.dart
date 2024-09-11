import 'dart:async';
import 'package:flutter/material.dart';

class LoadingScreenProgress extends StatefulWidget {
  const LoadingScreenProgress({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoadingScreenProgressState createState() => _LoadingScreenProgressState();
}

class _LoadingScreenProgressState extends State<LoadingScreenProgress> {
  double _progressValue = 0.0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startLoading();
  }

  void _startLoading() {
    _timer = Timer.periodic(Duration(milliseconds: 20), (timer) {
      setState(() {
        _progressValue += 0.01;
        if (_progressValue >= 1.0) {
          _progressValue = 1.0;
          _timer?.cancel();
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(builder: (context) => const WelcomePage()),
          // );
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Linear Progress Bar
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 15,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: LinearProgressIndicator(
                value: _progressValue,
                backgroundColor: Colors.grey,
                color: const Color(0xffD21312),
                minHeight: 10,
              ),
            ),
          ),

          const SizedBox(height: 20),
          Text(
            '${(_progressValue * 100).toInt()}%',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
