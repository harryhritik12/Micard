import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  Future<void> _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkMode ? Colors.white : Colors.black;

    return Center(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Contact Me',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: textColor),
            ),
            SizedBox(height: 10),
            Text(
              'Email: hritikpankaj1999@gmail.com\nPhone: +91 7355693274',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: textColor),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () => _launchURL("https://www.linkedin.com/in/hritik-pankaj-27223822a/"),
              icon: Icon(Icons.link),
              label: Text("LinkedIn"),
            ),
            ElevatedButton.icon(
              onPressed: () => _launchURL("https://github.com/harryhritik12"),
              icon: Icon(Icons.code),
              label: Text("GitHub"),
            ),
          ],
        ),
      ),
    );
  }
}

