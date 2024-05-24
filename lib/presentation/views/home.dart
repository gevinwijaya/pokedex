import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Pokedex',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 36,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0
      ),
      body: Container(
        child: GridView.count(crossAxisCount: 2,
        childAspectRatio: 1.3,
        padding: const EdgeInsets.all(24.0),
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
        children: <String> [
          'https://htmlcolorcodes.com/assets/images/colors/red-color-solid-background-1920x1080.png',
          'https://htmlcolorcodes.com/assets/images/colors/red-color-solid-background-1920x1080.png',
          'https://htmlcolorcodes.com/assets/images/colors/red-color-solid-background-1920x1080.png'
        ].map((String url) {
          return GridTile(child: Image.network(url, fit: BoxFit.cover));
        }).toList()),
      ),
    );
  }
}