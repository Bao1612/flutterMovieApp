import 'dart:convert';
import 'package:codes/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

Future<void> loginUser(BuildContext context, String username, String password) async {
  const String apiUrl = 'https://dummyjson.com/auth/login'; // Replace with your API URL

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // Login successful, handle the response
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      Fluttertoast.showToast(
          msg: 'Login successful',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          textColor: Colors.black,
          fontSize: 16,
          backgroundColor: Colors.grey[300]
      );

      //Navigate to home page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );

      // Do something with the response (e.g., save the token)
    } else {
      // Login failed, handle the error
      Fluttertoast.showToast(
          msg: 'Login fail',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          textColor: Colors.black,
          fontSize: 16,
          backgroundColor: Colors.grey[300]
      );

    }
  } catch (e) {
    // Handle any errors that occur during the request
    print("Error occurred: $e");
  }
}
