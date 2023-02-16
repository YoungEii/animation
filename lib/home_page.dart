import 'package:animation/parallax_page.dart';
import 'package:flutter/material.dart';

import 'counter_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CounterPage()));
                },
                child: const Text('Counter'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ParallaxPage()));
                },
                child: const Text('Parallax'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
