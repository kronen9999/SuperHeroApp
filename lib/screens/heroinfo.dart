import 'package:flutter/material.dart';

class Heroinfo extends StatelessWidget {
  const Heroinfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Info hero")),
      body: Center(child: Text('Hero Info Screen')),
    );
  }
}
