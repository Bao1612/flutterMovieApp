import 'package:codes/controller/navbar.dart';
import 'package:flutter/material.dart';

class TvScreen extends StatelessWidget {
  const TvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        title: const Text(
          'Tv Series',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
    );
  }
}
