import 'package:flutter/material.dart';
import 'package:codes/colors.dart';

class GridLayout extends StatelessWidget {
  List<dynamic> user =[];
  GridLayout({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainTheme,
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: user.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 2 / 3, // Aspect ratio to fit the image
          ),
          itemBuilder: (context, index) {
            final item = user[index];
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12.0),
                  Expanded(
                    child: ClipRRect(
                      child: Image.network(
                        'https://media.themoviedb.org/t/p/' + 'w300_and_h450_bestv2/kWGVB2x76Bo5GWCR31W41Pmz3PH.jpg',
                        fit: BoxFit.cover,
                        width:
                            double.infinity, // Fill the width of the container
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0), // Spacing between image and text
                  Center(
                    child: Text(
                      '${item['name']['first']}', // Replace with actual movie names
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
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
}
