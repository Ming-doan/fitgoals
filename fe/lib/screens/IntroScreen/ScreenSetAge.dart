import 'package:fitgoals/screens/IntroScreen/ScreenSetHeight.dart';
import 'package:fitgoals/widgets/listwheel/ListWheelScrollHeight.dart';
import 'package:fitgoals/widgets/listwheel/ListWheelScroolAge.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              Image.asset('assets/General/logo.png'),
              Padding(
                padding: const EdgeInsets.all(35.0),
                child: Center(
                    child: Text('Enter your age',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 32))),
              ),
              ListWheelScrollAge(),
              // const SizedBox(height: 50),
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
                                  borderRadius: BorderRadius.circular(30)),
                              child: Center(
                                child: Text(
                                  'Previous',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                              ),
                            ),
                          )),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ScreenSetHeight()),
                            );
                          },
                          child: Center(
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                  color: const Color(0xffD21312),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Center(
                                child: Text(
                                  'Next',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
