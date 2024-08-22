import 'package:codes/home.dart';
import 'package:codes/screen/login_page.dart';
import 'package:codes/screen/movie_screen.dart';
import 'package:codes/screen/tv_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      initialRoute: '/',
      routes: {
        '/movie': (context) => const MovieScreen(),
        '/tv_series': (context) => const TvScreen(),
        '/logout': (context) => const LoginPage(),
      },
    );
  }
}

