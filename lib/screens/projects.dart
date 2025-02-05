import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  Future<void> _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkMode ? Colors.white : Colors.black;

    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Projects',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: textColor),
          ),
          SizedBox(height: 10),
          ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              _buildProjectTile(
                context,
                icon: Icons.smart_toy,
                title: "🤖 AI Chatbot",
                description: "🚀 Built an AI-powered chatbot using MERN stack & ChatGPT API.",
                url: "https://github.com/harryhritik12",
                textColor: textColor,
              ),
              _buildProjectTile(
                context,
                icon: Icons.monetization_on,
                title: "💎 NFT Marketplace",
                description: "🛒 Decentralized NFT trading platform using Flutter & Ganache.",
                url: "https://github.com/harryhritik12/nft_marketplace",
                textColor: textColor,
              ),
              _buildProjectTile(
                context,
                icon: Icons.music_note,
                title: "🎵 Spotify Clone",
                description: "🎶 Music streaming app built with Flutter & Firebase.",
                url: "https://github.com/harryhritik12/spotify_clone",
                textColor: textColor,
              ),
              _buildProjectTile(
                context,
                icon: Icons.school,
                title: "🏫 Campus Sync",
                description: "📚 A web-based platform for students using MERN stack.",
                url: "https://campussync.netlify.app/",
                textColor: textColor,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProjectTile(BuildContext context, {required IconData icon, required String title, required String description, required String url, required Color textColor}) {
    return ListTile(
      leading: Icon(icon, color: textColor),
      title: Text(title, style: TextStyle(color: textColor)),
      subtitle: Text(description, style: TextStyle(color: textColor)),
      onTap: () => _launchURL(url),
    );
  }
}
