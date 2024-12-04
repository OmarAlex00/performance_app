import 'dart:async';

import 'package:flutter/material.dart';

class AnimatedBoxcustom extends StatefulWidget {
  const AnimatedBoxcustom({
    super.key,
  }) : super();

  @override
  State<AnimatedBoxcustom> createState() => _AnimatedBoxcustomState();
}

class _AnimatedBoxcustomState extends State<AnimatedBoxcustom> {
  late Timer _timer;
  int _counter = 0;
  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _counter++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      height: _counter % 2 == 0 ? 100 : 200,
      width: _counter % 2 == 0 ? 100 : 200,
      color: Colors.blue,
    );
  }

  @override
  void dispose() {
    _timer.cancel();
// Forgot to cancel the Timer
    super.dispose();
  }
}
