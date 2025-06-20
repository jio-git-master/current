import 'package:current/pages/news_list_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //AppBar
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('News'),
      ),

      bottomNavigationBar: GNav(
        gap: 8,
          onTabChange: (index) {
            print (index);
          },
          tabs: const [
            GButton(icon: Icons.home, text: 'Home'),
            GButton(icon: Icons.favorite_border, text: 'Likes'),
            GButton(icon: Icons.search, text: 'Search'),
            GButton(icon: Icons.settings, text: 'Settings'),
          ]
      ),

      body: const NewsListPage(),
    );
  }
}
