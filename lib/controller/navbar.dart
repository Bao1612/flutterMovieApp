import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
           ListTile(
             leading: const Icon(Icons.movie),
             title: const Text('Movie'),
             onTap: () {
               Navigator.of(context).pop();
               _navigateTo(context, '/movie');
               },
           ),

          ListTile(
            leading: const Icon(Icons.tv),
            title: const Text('Tv Series'),
            onTap: () {
              Navigator.of(context).pop();
              _navigateTo(context, '/tv_series');
              },
          ),

          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Favorite'),
            onTap: () {
              Navigator.of(context).pop();
              _navigateTo(context, '/favorite');
              },
          ),

          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              Navigator.of(context).pop();
              _navigateTo(context, '/logout');
              },
          ),

        ],
      ),
    );
  }

  void _navigateTo(BuildContext context, String routeName) {
    Navigator.of(context).pushNamed(routeName);
  }

}
