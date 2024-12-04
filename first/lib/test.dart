import 'package:cached_network_image/cached_network_image.dart';
import 'package:first/animated_box.dart';
import 'package:flutter/material.dart';

class DebuggingTask extends StatelessWidget {
  const DebuggingTask({super.key});

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
          const RepaintBoundary(child: AnimatedBoxcustom()),
        ],
      ),
    );
  }
}
