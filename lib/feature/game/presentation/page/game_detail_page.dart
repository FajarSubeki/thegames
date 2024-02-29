import 'package:flutter/material.dart';

class GameDetailPage extends StatelessWidget {

  final int gameId;

  const GameDetailPage({super.key, required this.gameId});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Detail Page'),
        ),
      ),
    );  }
}
