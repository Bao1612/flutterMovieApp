import 'dart:convert';

import 'package:codes/controller/navbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        title: const Text(
          'Rest Api Call',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => fetchUsers(), // Fixed: Correctly calls fetchUsers
        child: const Icon(Icons.refresh),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          final name = user['name']['first'];
          final email = user['email'];
          final imageUrl = user['picture']['thumbnail'];
          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(imageUrl),
            ),
            title: Text(name),
            subtitle: Text(email),
          );
        },
      ),
    );
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
