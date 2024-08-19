import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue,

      child: ListView(
        children: [
           ListTile(
             leading: const Icon(Icons.movie, color: Colors.white,),
             title: const Text('Movie', style: TextStyle(color: Colors.white),),
             onTap: () {
               Navigator.of(context).pop();
               _navigateTo(context, '/movie');
               },
           ),

          ListTile(
            leading: const Icon(Icons.tv, color: Colors.white,),
            title: const Text('Tv Series', style: TextStyle(color: Colors.white),),
            onTap: () {
              Navigator.of(context).pop();
              _navigateTo(context, '/tv_series');
              },
          ),

          ListTile(
            leading: const Icon(Icons.favorite, color: Colors.white,),
            title: const Text('Favorite', style: TextStyle(color: Colors.white),),
            onTap: () {
              Navigator.of(context).pop();
              _navigateTo(context, '/favorite');
              },
          ),

          ListTile(
            leading: Icon(Icons.logout, color: Colors.white,),
            title: Text('Logout', style: TextStyle(color: Colors.white),),
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
