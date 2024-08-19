import 'package:codes/components/movie_layout.dart';
import 'package:flutter/material.dart';
import 'package:codes/colors.dart';
import '../controller/navbar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:codes/utils.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  List<dynamic> movies = [];

  @override
  void initState() {
    super.initState();
    fetchMovies(); // Automatically fetch users when the widget is created
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainTheme,
      drawer: const Navbar(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Movie Series',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body:
      MoviesGridLayout(user: movies,),
    );
  }

  Future<void> fetchMovies() async {
    const url = moviesApi;
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $token',
        'accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      setState(() {
        movies = jsonData['results'];
      });
    } else {
      print('Failed to load movies: ${response.statusCode}');
    }
  }

}
