import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'About Me',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '👨‍🎓 BTech in Computer Science | Indian Institute of Information Technology Guwahati (Expected 2025)\n\n'
              '🔍 Passionate about problem-solving, full-stack development, and AI-driven applications.\n'
              '💡 Always eager to explore cutting-edge technologies and build impactful digital solutions.\n\n'
              '📌 Technical Skills:\n'
              '💻 Proficient in: Node.js, MongoDB, SQL, React, C++, Python, TypeScript, Java, Git, Firebase, Flutter.\n'
              '🎯 Passionate about full-stack development, AI, and blockchain technologies.\n\n'
              '🏆 Internship Experience:\n'
              '💼 Research Analyst Intern at NRG EXTERN (July 2024 - Aug 2024)\n'
              '• Conducted in-depth research on algorithmic bias in AI-based justice systems.\n'
              '• Analyzed 15 real-world cases to identify ethical flaws in predictive policing.\n'
              '• Proposed data-driven solutions to enhance fairness and transparency in AI.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
