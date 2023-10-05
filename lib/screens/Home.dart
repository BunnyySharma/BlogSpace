import 'package:flutter/material.dart';
import 'package:subspaceass/screens/Favourites.dart';
import 'package:subspaceass/screens/bloglist.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int currentindex =0;
  final screens = [
    bloglist(),
    favourites(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentindex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey[900],
          selectedItemColor: Colors.grey,
          unselectedItemColor: Colors.black,
          showUnselectedLabels: false,
          currentIndex: currentindex,
          iconSize: 25,
          onTap: (index) {
            setState(() {
              currentindex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favourites',
              activeIcon: Icon(
                  Icons.favorite,
                color: Colors.red[700],
              )
            ),
          ]
      ),
    );
  }
}
