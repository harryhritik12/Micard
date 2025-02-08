import 'dart:ui'; // Required for Glassmorphism
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'screens/home.dart';
import 'screens/about.dart';
import 'screens/projects.dart';
import 'screens/resume.dart';
import 'screens/contact.dart';

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
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: PortfolioHome(
        onToggleTheme: () {
          setState(() {
            isDarkMode = !isDarkMode;
          });
        },
        isDarkMode: isDarkMode,
      ),
    );
  }
}

class PortfolioHome extends StatelessWidget {
  final VoidCallback onToggleTheme;
  final bool isDarkMode;

  const PortfolioHome({required this.onToggleTheme, required this.isDarkMode, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              'My Portfolio ✨',
              textStyle: GoogleFonts.pacifico(fontSize: screenWidth > 600 ? 28 : 22, fontWeight: FontWeight.bold),
              speed: Duration(milliseconds: 100),
            ),
          ],
          repeatForever: true,
        ),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.wb_sunny : Icons.nightlight_round),
            onPressed: onToggleTheme,
            tooltip: 'Toggle Dark Mode',
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          // Gradient Background (Auto adjusts for Dark Mode)
          AnimatedContainer(
            duration: Duration(seconds: 2),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: isDarkMode
                    ? [Colors.black87, Colors.black]
                    : [Colors.blueGrey.shade50, Colors.teal.shade100],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // Responsive Portfolio Content
          SingleChildScrollView(
            child: Center(
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: screenWidth > 800 ? screenWidth * 0.6 : screenWidth * 0.9, // Dynamic width
                ),
                padding: EdgeInsets.symmetric(horizontal: screenWidth > 600 ? 32 : 16, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildGlassCard(child: HomeSection()),
                    _buildGlassCard(child: ProjectsSection()),
                    _buildGlassCard(child: AboutSection()),
                    _buildGlassCard(
                      child: Column(
                        children: [
                          ContactSection(),
                          ResumeSection(),
                        ],
                      ),
                    ),
                    _buildGlassCard(
                      child: Center(
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              '🚀 Made With Love ❤️',
                              textStyle: TextStyle(
                                fontSize: screenWidth > 600 ? 18 : 14,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey,
                              ),
                              speed: Duration(milliseconds: 150),
                            ),
                          ],
                          repeatForever: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Glassmorphism Card Design (Improved for better visibility)
  Widget _buildGlassCard({required Widget child}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2), // Slightly increased opacity
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 12,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12), // Improved blur effect
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: child,
          ),
        ),
      ),
    );
  }
}
