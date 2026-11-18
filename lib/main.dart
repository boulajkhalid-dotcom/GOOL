
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
        scaffoldBackgroundColor: const Color(0xFF101510),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF39E75F),
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF101510),
        title: const Text(
          'GOOL',
          style: TextStyle(
            color: Color(0xFF39E75F),
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: const [
          Icon(Icons.notifications_none, color: Colors.white),
          SizedBox(width: 15),
        ],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'كرة القدم العالمية',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFF1B291D),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                children: [
                  Text(
                    'مباريات اليوم',
                    style: TextStyle(
                      color: Color(0xFF39E75F),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  MatchRow(
                    team1: 'ريال مدريد',
                    team2: 'برشلونة',
                    score: 'VS',
                    time: '21:00',
                  ),
                  Divider(color: Colors.white24),
                  MatchRow(
                    team1: 'مانشستر سيتي',
                    team2: 'ليفربول',
                    score: 'VS',
                    time: '18:30',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'أقسام التطبيق',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            const Row(
              children: [
                Expanded(child: MenuCard(
                  icon: Icons.sports_soccer,
                  title: 'المباريات',
                )),
                SizedBox(width: 10),
                Expanded(child: MenuCard(
                  icon: Icons.bar_chart,
                  title: 'الترتيب',
                )),
                SizedBox(width: 10),
                Expanded(child: MenuCard(
                  icon: Icons.emoji_events,
                  title: 'البطولات',
                )),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF172019),
        selectedItemColor: const Color(0xFF39E75F),
        unselectedItemColor: Colors.white54,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_soccer),
            label: 'المباريات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: 'الترتيب',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'حسابي',
          ),
        ],
      ),
    );
  }
}

class MatchRow extends StatelessWidget {
  final String team1;
  final String team2;
  final String score;
  final String time;

  const MatchRow({
    super.key,
    required this.team1,
    required this.team2,
    required this.score,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text(team1, textAlign: TextAlign.center)),
        Column(
          children: [
            Text(
              score,
              style: const TextStyle(
                color: Color(0xFF39E75F),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(time, style: const TextStyle(color: Colors.white60)),
          ],
        ),
        Expanded(child: Text(team2, textAlign: TextAlign.center)),
      ],
    );
  }
}

class MenuCard extends StatelessWidget {
  final IconData icon;
  final String title;

  const MenuCard({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF1B291D),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: const Color(0xFF39E75F), size: 30),
          const SizedBox(height: 8),
          Text(title),
        ],
      ),
    );
  }
}
