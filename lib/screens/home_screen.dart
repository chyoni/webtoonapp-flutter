import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const twentyFiveMinutes = 1500;
  int totalSeconds = twentyFiveMinutes;
  bool isRunning = false;
  int totalPomodors = 0;
  late Timer timer;

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        totalPomodors = totalPomodors + 1;
        isRunning = false;
        totalSeconds = twentyFiveMinutes;
      });
      timer.cancel();
      return;
    }
    setState(() {
      totalSeconds = totalSeconds - 1;
    });
  }

  void onStartPressed() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      onTick(timer);
    });
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void reset() {
    setState(() {
      totalSeconds = twentyFiveMinutes;
    });
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    // ignore: avoid_print
    return duration.toString().split(".").first.substring(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          Flexible(
              flex: 1,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  format(totalSeconds),
                  style: TextStyle(
                      color: Theme.of(context).cardColor,
                      fontSize: 89,
                      fontWeight: FontWeight.w600),
                ),
              )),
          Flexible(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: IconButton(
                      iconSize: 120,
                      color: Theme.of(context).cardColor,
                      icon: Icon(!isRunning
                          ? Icons.play_circle_outline
                          : Icons.pause_circle_outline),
                      onPressed: isRunning ? onPausePressed : onStartPressed,
                    ),
                  ),
                  Center(
                    child: IconButton(
                      iconSize: 120,
                      color: Theme.of(context).cardColor,
                      icon: const Icon(Icons.restore_outlined),
                      onPressed: reset,
                    ),
                  ),
                ],
              )),
          Flexible(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Pomodors",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .color),
                            ),
                            Text(
                              "$totalPomodors",
                              style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .color),
                            ),
                          ]),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
