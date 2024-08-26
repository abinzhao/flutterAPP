import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 这里可以放置大量的内容组件，比如文本、图片等
        for (int i = 0; i < 60; i++) Text('Item $i'),
      ],
    );
  }
}
