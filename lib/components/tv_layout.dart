import 'package:flutter/material.dart';
import 'package:codes/colors.dart';

class TvGridLayout extends StatefulWidget {
  List<dynamic> tv =[];
  TvGridLayout({
    super.key,
    required this.tv,
  });

  @override
  State<TvGridLayout> createState() => _TvGridLayoutState();
}

class _TvGridLayoutState extends State<TvGridLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainTheme,
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: widget.tv.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 2 / 3, // Aspect ratio to fit the image
          ),
          itemBuilder: (context, index) {
            final item = widget.tv[index];
            return Column(
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
                    '${item['original_name']}', // Replace with actual movie names
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
