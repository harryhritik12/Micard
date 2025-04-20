import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ResumeSection extends StatelessWidget {
  Future<void> _downloadResume() async {
    final url = Uri.parse("https://drive.google.com/file/d/19Ln8EDS7Gi7JQPm1NR_q-xaDqkGQXi0B/view?usp=sharing");
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not open resume link';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        onPressed: _downloadResume,
        icon: Icon(Icons.download),
        label: Text("Download Resume"),
      ),
    );
  }
}