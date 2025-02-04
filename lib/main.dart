import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'screens/home.dart';
import 'screens/about.dart';
import 'screens/projects.dart';
import 'screens/contact.dart';
import 'screens/resume.dart';

void main() {
  runApp(PortfolioApp());
}

class PortfolioApp extends StatefulWidget {
  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hritik Pankaj Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        primarySwatch: Colors.teal,
        textTheme: GoogleFonts.sourceSans3TextTheme(),
      ),
      home: PortfolioHome(
        onToggleTheme: () {
          setState(() {
            isDarkMode = !isDarkMode;
          });
        },
      ),
    );
  }
}

class PortfolioHome extends StatefulWidget {
  final VoidCallback onToggleTheme;
  const PortfolioHome({required this.onToggleTheme, Key? key}) : super(key: key);

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  int currentIndex = 0;

  final pages = [
    HomeSection(),
    AboutSection(),
    ProjectsSection(),
    ResumeSection(),
    ContactSection(),
  ];

  final navItems = ['Home', 'About', 'Projects', 'Resume', 'Contact'];

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hritik Pankaj Portfolio',
          style: GoogleFonts.pacifico(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_medium),
            onPressed: widget.onToggleTheme,
            tooltip: 'Toggle Dark Mode',
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.teal),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hritik Pankaj', style: GoogleFonts.pacifico(fontSize: 24, color: Colors.white)),
                  SizedBox(height: 8),
                  Text('Full-Stack Developer | Flutter Enthusiast', style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),
            for (int i = 0; i < navItems.length; i++)
              ListTile(
                leading: Icon(Icons.arrow_right),
                title: Text(navItems[i]),
                selected: currentIndex == i,
                onTap: () {
                  Navigator.pop(context);
                  onTabTapped(i);
                },
              ),
          ],
        ),
      ),
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'About'),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Projects'),
          BottomNavigationBarItem(icon: Icon(Icons.file_copy), label: 'Resume'),
          BottomNavigationBarItem(icon: Icon(Icons.contact_mail), label: 'Contact'),
        ],
      ),
    );
  }
}
