
import 'package:flutter/material.dart';

void main() {
  runApp(const GoolApp());
}

class GoolApp extends StatefulWidget {
  const GoolApp({super.key});

  @override
  State<GoolApp> createState() => _GoolAppState();
}

class _GoolAppState extends State<GoolApp> {
  bool isArabic = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GOOL',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF090D0B),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF39D353),
          surface: Color(0xFF151D18),
        ),
      ),
      home: HomePage(
        isArabic: isArabic,
        onLanguageChange: () {
          setState(() {
            isArabic = !isArabic;
          });
        },
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final bool isArabic;
  final VoidCallback onLanguageChange;

  const HomePage({
    super.key,
    required this.isArabic,
    required this.onLanguageChange,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    final ar = widget.isArabic;

    final titles = ar
        ? ['المباريات', 'النتائج', 'الترتيب']
        : ['Matchs', 'Résultats', 'Classement'];

    return Directionality(
      textDirection: ar ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
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
          actions: [
            TextButton(
              onPressed: widget.onLanguageChange,
              child: Text(
                ar ? 'AR | FR' : 'FR | AR',
                style: const TextStyle(
                  color: Color(0xFF39D353),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Icon(
              Icons.sports_soccer,
              color: Color(0xFF39D353),
            ),
            const SizedBox(width: 12),
          ],
        ),
        body: Column(
          children: [
            const SizedBox(height: 25),
            const Icon(
              Icons.sports_soccer,
              color: Color(0xFF39D353),
              size: 65,
            ),
            const SizedBox(height: 10),
            Text(
              ar ? 'عالم كرة القدم بين يديك' :
              'Le football entre vos mains',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: List.generate(3, (index) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: selectedTab == index
                              ? const Color(0xFF39D353)
                              : const Color(0xFF1B2920),
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            selectedTab = index;
                          });
                        },
                        child: Text(titles[index]),
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 25),
            Text(
              selectedTab == 0
                  ? (ar ? 'مباريات اليوم' : 'Matchs du jour')
                  : selectedTab == 1
                      ? (ar ? 'آخر النتائج' : 'Derniers résultats')
                      : (ar ? 'ترتيب البطولات' : 'Classement des ligues'),
              style: const TextStyle(
                color: Color(0xFF39D353),
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: Center(
                child: Text(
                  ar
                      ? 'سيتم عرض بيانات المباريات هنا'
                      : 'Les données des matchs seront affichées ici',
                  style: const TextStyle(color: Colors.white70),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: const Color(0xFF39D353),
          unselectedItemColor: Colors.white54,
          currentIndex: selectedTab,
          onTap: (index) {
            setState(() {
              selectedTab = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.calendar_month),
              label: ar ? 'المباريات' : 'Matchs',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.sports_score),
              label: ar ? 'النتائج' : 'Résultats',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.leaderboard),
              label: ar ? 'الترتيب' : 'Classement',
            ),
          ],
        ),
      ),
    );
  }
}
