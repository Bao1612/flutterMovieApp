import 'dart:convert';
import 'package:codes/screen/movie_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

Future<void> loginUser(BuildContext context, String email, String password) async {
  const String apiUrl = 'http://10.0.2.2:3333/api/v1/auth/login'; // Replace with your API URL

  try {
    // Hiển thị loading dialog
    showDialog(
      context: context,
      barrierDismissible: false, // Người dùng không thể dismiss dialog bằng cách nhấn ra ngoài
      builder: (context) {
        return Center(child: CircularProgressIndicator());
      },
    );

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // Login thành công, xử lý response
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      Fluttertoast.showToast(
        msg: 'Login successful',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        textColor: Colors.black,
        fontSize: 16,
        backgroundColor: Colors.grey[300],
      );

      // Delay 3 giây trước khi điều hướng đến trang tiếp theo
      await Future.delayed(const Duration(seconds: 3));

      Navigator.of(context).pop(); // Đóng loading dialog trước khi điều hướng
      // Điều hướng đến trang tiếp theo
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MovieScreen()),
      );

      // Có thể lưu token hoặc xử lý thêm tại đây
    } else {
      Navigator.of(context).pop(); // Đóng loading dialog nếu login thất bại
      // Login thất bại, thông báo lỗi
      Fluttertoast.showToast(
        msg: 'Login fail',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        textColor: Colors.black,
        fontSize: 16,
        backgroundColor: Colors.grey[300],
      );
    }
  } catch (e) {
    Navigator.of(context).pop(); // Đóng loading dialog nếu có lỗi xảy ra
    // Xử lý lỗi
    print("Error occurred: $e");
  }
}
