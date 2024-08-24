import 'package:flutter/material.dart';

class HiScreen extends StatelessWidget {
  final String username;

  const HiScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Welcome',
          style: TextStyle(fontSize: 25, color: Color(0xff55AD9B)),
        ),
        backgroundColor: const Color(0xffF1F8E8),
      ),
      body: Center(
        child: Text(
          'Hi, $username!',
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color(0xff55AD9B),
          ),
        ),
      ),
    );
  }
}
