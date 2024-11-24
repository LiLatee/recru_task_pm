import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  static const String route = 'explore';
  static const String routeToPush = '/$route';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text('$ExplorePage'),
        ],
      ),
    );
  }
}
