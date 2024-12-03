import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DebuggingTask extends StatefulWidget {
  const DebuggingTask({super.key});

  @override
  _DebuggingTaskState createState() => _DebuggingTaskState();
}

class _DebuggingTaskState extends State<DebuggingTask> {
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
    return Scaffold(
      appBar: AppBar(title: const Text('Debugging Task')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 1000,
              itemBuilder: (context, index) => ListTile(
                leading: const CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(
                    'https://via.placeholder.com/50',
                  ),
                ),
                title: Text('Item $index'),
              ),
            ),
          ),
          RepaintBoundary(
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              height: _counter % 2 == 0 ? 100 : 200,
              width: _counter % 2 == 0 ? 100 : 200,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
// Forgot to cancel the Timer
    super.dispose();
  }
}
