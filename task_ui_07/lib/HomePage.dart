import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bookstiles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(Icons.person),
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.notification_add), label: ''),
        ],
      ),
      //text
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Find The Best Books For you',
              style: GoogleFonts.bebasNeue(
                fontSize: 60,
              ),
            ),
          ),
          SizedBox(height: 25.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "find Anything",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade700),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade700),
                ),
              ),
            ),
          ),
          SizedBox(height: 25.0),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                booksTiles(
                  imagePath: 'lib/imagess/techbook.jpg',
                  name: 'Medical Books',
                  price: '100',
                ),
                booksTiles(
                  imagePath: 'lib/imagess/medbook.jpg',
                  name: 'Tech Books',
                  price: '120',
                ),
                booksTiles(
                  imagePath: 'lib/imagess/engggbook.jpeg',
                  name: 'Engg Books',
                  price: '110',
                ),


              ],
            ),
          ),
          SizedBox(height: 30.0),
        ],
      ),

      //searchbar

      //Tiles view horizontal
    );
  }
}
