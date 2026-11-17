

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
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF101010),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00E676),
          brightness: Brightness.dark,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF101010),
          title: const Text(
            'GOOL',
            style: TextStyle(
              color: Color(0xFF00E676),
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'عالم كرة القدم بين يديك',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'المباريات',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF00E676),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            matchCard('ريال مدريد', 'برشلونة', 'الكلاسيكو'),
            matchCard('مانشستر سيتي', 'ليفربول', 'الدوري الإنجليزي'),
            matchCard('باريس سان جيرمان', 'مارسيليا', 'الدوري الفرنسي'),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          backgroundColor: const Color(0xFF1C1C1C),
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'الرئيسية',
            ),
            NavigationDestination(
              icon: Icon(Icons.sports_soccer),
              label: 'المباريات',
            ),
            NavigationDestination(
              icon: Icon(Icons.leaderboard),
              label: 'الترتيب',
            ),
            NavigationDestination(
              icon: Icon(Icons.settings),
              label: 'الإعدادات',
            ),
          ],
        ),
      ),
    );
  }

  Widget matchCard(String team1, String team2, String league) {
    return Card(
      color: const Color(0xFF202020),
      margin: const EdgeInsets.only(bottom: 14),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Text(
              league,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    team1,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const Text(
                  'VS',
                  style: TextStyle(
                    color: Color(0xFF00E676),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Text(
                    team2,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              'قريباً',
              style: TextStyle(color: Color(0xFF00E676)),
            ),
          ],
        ),
      ),
    );
  }
}
