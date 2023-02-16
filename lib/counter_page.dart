import 'dart:async';

import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int count = 0;
  Timer? pressTimer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: _CounterText(
            count: count.toDouble(),
            width: 100,
            height: 50,
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onLongPressStart: _onPressPlusStart,
        onLongPressEnd: _onPressPlusEnd,
        child: FloatingActionButton(
          onPressed: _onTapPlus,
          child: const Icon(Icons.plus_one),
        ),
      ),
    );
  }

  void _onTapPlus() {
    count = count + 1;
    setState(() {});
  }

  void _onPressPlusStart(LongPressStartDetails details) {
    _onTapPlus();

    pressTimer = Timer.periodic(
      const Duration(milliseconds: 300),
      (timer) {
        final plusCount = timer.tick < 5 ? 1 : 5;
        count = count + plusCount;
        setState(() {});
      },
    );
  }

  void _onPressPlusEnd(LongPressEndDetails details) {
    pressTimer?.cancel();
  }
}

class _CounterText extends StatelessWidget {
  const _CounterText({
    required this.count,
    required this.width,
    required this.height,
  });

  final double count;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TweenAnimationBuilder(
        tween: Tween(end: count),
        duration: const Duration(milliseconds: 300),
        builder: (BuildContext context, double value, Widget? child) {
          // Value is start from previous one,
          int showNumber = value ~/ 1;
          double percent = value - showNumber;

          return Stack(
            children: [
              // Bottom to top, 0 to full height, finally move widget to outside
              Positioned(
                bottom: height * percent,
                child: Text(
                  '$showNumber',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 48.0,
                  ),
                ),
              ),
              // Outside to bottom, negative bottom to 0, move widget to original position
              Positioned(
                bottom: height * (percent - 1),
                child: Text(
                  '${(showNumber + 1)}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 48.0,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
