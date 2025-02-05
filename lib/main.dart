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
        textTheme: GoogleFonts.montserratTextTheme(),
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
    return Scaffold(
      appBar: AppBar(
        title: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              'Hritik Pankaj Portfolio',
              textStyle: GoogleFonts.pacifico(fontSize: 24),
              speed: Duration(milliseconds: 100),
            ),
          ],
          repeatForever: true,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_medium),
            onPressed: onToggleTheme,
            tooltip: 'Toggle Dark Mode',
          ),
        ],
      ),
      body: Stack(
        children: [
          // Animated Background
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
          // Portfolio Content
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildGlassCard(child: HomeSection()),
                  _buildGlassCard(child: ProjectsSection()),
                  _buildGlassCard(child: AboutSection()),
                  _buildGlassCard(child: ContactSection()),
                  _buildGlassCard(
                    child: Column(
                      children: [
                        ContactSection(),
                        ResumeSection(),
                      ],
                    ),
                    ),
                  _buildGlassCard(
                    child:
                    Center(
                      child:AnimatedTextKit(
                         animatedTexts: [
                          TypewriterAnimatedText(
                          'Made With Love ❤️',
                          textStyle: const TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          color: Colors.blueGrey,
                        ),
                        speed: Duration(milliseconds: 150),
                        ),
                      ],
                          repeatForever: true, // Corrected property name
                      )
                  )
                  )

                ],
                
              ),

            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGlassCard({required Widget child}) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }
}