import 'package:codes/controller/navbar.dart';
import 'package:flutter/material.dart';
import 'package:codes/colors.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:codes/utils.dart';
import '../components/tv_layout.dart';

class TvScreen extends StatefulWidget {
  const TvScreen({super.key});

  @override
  State<TvScreen> createState() => _TvScreenState();
}

class _TvScreenState extends State<TvScreen> {
  List<dynamic> tv = [];

  @override
  void initState() {
    super.initState();
    fetchTv();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainTheme,
      drawer: const Navbar(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Tv Series',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body:
      TvGridLayout(tv: tv,),
    );
  }

  Future<void> fetchTv() async {
    const url = tvApi;
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
        tv = jsonData['results'];
      });
    } else {
      print('Failed to load movies: ${response.statusCode}');
    }
  }


}
