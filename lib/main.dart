
import 'package:flutter/material.dart';

void main() {
  runApp(const GoolApp());
}

class GoolApp extends StatelessWidget {
  const GoolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GOOL',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF090D0B),
        primaryColor: const Color(0xFF39D353),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'GOOL',
          style: TextStyle(
            color: Color(0xFF39D353),
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Icon(Icons.sports_soccer, color: Color(0xFF39D353)),
          SizedBox(width: 15),
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.sports_soccer,
              size: 85,
              color: Color(0xFF39D353),
            ),
            SizedBox(height: 20),
            Text(
              'GOOL – LIVE FOOTBALL',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 12),
            Text(
              'عالم كرة القدم بين يديك',
              style: TextStyle(
                color: Color(0xFF39D353),
                fontSize: 17,
              ),
            ),
            SizedBox(height: 30),
            Text(
              'المباريات | النتائج | الترتيب',
              style: TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}
