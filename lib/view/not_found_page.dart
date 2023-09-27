import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  final String path;
  const NotFoundPage({super.key,required this.path});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text('Not Found'),
          Text(path.toString()),
        ],
      ),
    );
  }
}