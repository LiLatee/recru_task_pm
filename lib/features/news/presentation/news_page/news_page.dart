import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  static const String route = 'news';
  static const String routeToPush = '/$route';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text('$NewsPage'),
        ],
      ),
    );
  }
}
