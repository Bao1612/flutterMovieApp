import 'package:flutter/material.dart';
import 'package:codes/colors.dart';
import 'my_button.dart';

class CustomBottomSheet extends StatelessWidget {
  final dynamic item; // Pass the item data to this widget

  const CustomBottomSheet({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mainTheme, // Replace mainTheme with context theme
      child: SizedBox(
        height: 750,
        child: Column(
          children: [
            Image.network(
              'https://image.tmdb.org/t/p/w500${item['backdrop_path']}',
              fit: BoxFit.cover,
              height: 150,
              width: double.infinity,
            ),
            const SizedBox(height: 25),
            Text(
              checkName(item),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 25),
            MyButton(buttonText: 'PLAY', onTap: () {}),
            const SizedBox(height: 15),
            MyButton(buttonText: 'DOWNLOAD', onTap: () {}),
            const SizedBox(height: 25),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Overview',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  item['overview'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Handle Add favorite tap
                        },
                        child: const Column(
                          children: [
                            Icon(
                              Icons.favorite,
                              size: 30,
                              color: Colors.white,
                            ),
                            Text(
                              'Add favorite',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 25),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Handle Recommend tap
                        },
                        child: const Column(
                          children: [
                            Icon(
                              Icons.recommend_sharp,
                              size: 30,
                              color: Colors.white,
                            ),
                            Text(
                              'Recommend',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String checkName(dynamic item) {
    if (item['title'].toString().isEmpty || item['title'] == null) {
      return item['original_name'];
    } else {
      return item['title'];
    }
  }

}
