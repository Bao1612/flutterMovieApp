import 'package:codes/components/grid_layout.dart';
import 'package:flutter/material.dart';
import 'package:codes/colors.dart';
import '../controller/navbar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  List<dynamic> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainTheme,
      floatingActionButton: FloatingActionButton(
        onPressed: () => fetchUsers(), // Fixed: Correctly calls fetchUsers
        child: const Icon(Icons.refresh),
      ),
      drawer: Navbar(),
      appBar: AppBar(
        title: const Text(
          'Movie Series',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body:
      GridLayout(user: users,),
    );;
  }

  void fetchUsers() async {
    users.clear();
    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);

    setState(() {
      users = json['results']; // Fixed: Update the users list
    });
  }

}
