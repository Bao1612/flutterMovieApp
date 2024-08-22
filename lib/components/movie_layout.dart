import 'package:flutter/material.dart';
import 'package:codes/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MoviesGridLayout extends StatefulWidget {
  List<dynamic> user =[];
  MoviesGridLayout({
    super.key,
    required this.user,
  });

  @override
  State<MoviesGridLayout> createState() => _MoviesGridLayoutState();
}

class _MoviesGridLayoutState extends State<MoviesGridLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainTheme,
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: widget.user.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 2 / 3, // Aspect ratio to fit the image
          ),
          itemBuilder: (context, index) {
            final item = widget.user[index];
            return GestureDetector(
              onTap: () {viewClick(item['title']);},
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12.0),
                  Expanded(
                    child: ClipRRect(
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500${item['poster_path']}',
                        fit: BoxFit.cover,
                        width:
                            double.infinity, // Fill the width of the container
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0), // Spacing between image and text
                  Center(
                    child: Text(
                      '${item['title']}', // Replace with actual movie names
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void viewClick(String movieName) {
    Fluttertoast.showToast(
        msg: movieName,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        textColor: Colors.black,
        fontSize: 16,
        backgroundColor: Colors.grey[300]
    );
  }

}
