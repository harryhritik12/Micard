import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch $url'); // Safe error handling
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final buttonColor = isDarkMode ? Colors.tealAccent : Colors.teal;

    return Center(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Contact Me',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: textColor),
            ),
            SizedBox(height: 12),
           GestureDetector(
              onTap: () => _launchURL('mailto:hritikpankaj1999@gmail.com'),
              child: Text(
                'Email: hritikpankaj1999@gmail.com',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SizedBox(height: 8),
            GestureDetector(
              onTap: () => _launchURL('tel:+917355693274'),
              child: Text(
                'Phone: +91 7355693274',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SizedBox(height: 12),

            // LinkedIn Button
            ElevatedButton.icon(
              onPressed: () => _launchURL("https://www.linkedin.com/in/hritik-pankaj-27223822a/"),
              icon: Icon(Icons.link, color: Colors.white),
              label: Text("LinkedIn", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),

            SizedBox(height: 16),

            // GitHub Button
            ElevatedButton.icon(
              onPressed: () => _launchURL("https://github.com/harryhritik12"),
              icon: Icon(Icons.code, color: Colors.white),
              label: Text("GitHub", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
