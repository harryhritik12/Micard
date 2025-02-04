import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Welcome to My Portfolio!',
              style: GoogleFonts.pacifico(
                fontSize: 32,
                color: Colors.teal,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Hello, I\'m Hritik Pankaj, a passionate full-stack developer and AI enthusiast. '
            'Currently pursuing a BTech in Computer Science at the Indian Institute of Information Technology Guwahati (Expected 2025), '
            'I thrive on building innovative digital solutions and tackling complex technical challenges.',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 20),
          Text(
            'My work spans various fields—from crafting robust web applications to developing intelligent AI systems and exploring the potential of blockchain technology. '
            'This portfolio is a showcase of my projects, skills, and experiences that have helped shape my career as a developer.',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 20),
          Text(
            'Feel free to browse through the sections to learn more about my background, projects, and the diverse set of skills I bring to the table. '
            'I am always open to new challenges, collaborations, and opportunities to grow.',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
