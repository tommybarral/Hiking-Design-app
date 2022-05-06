import 'package:flutter/material.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({Key? key}) : super(key: key);

  static const routeName = '/Stats-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Center(
          child: Text('Stats page'),
        ),
      ),
    );
  }
}