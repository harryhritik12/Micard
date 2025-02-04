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
    return ListView(
      padding: EdgeInsets.all(20),
      children: [
        ListTile(
          leading: Icon(Icons.smart_toy),
          title: Text("🤖 AI Chatbot"),
          subtitle: Text(
              "🚀 Built an intelligent AI-powered chatbot using the MERN stack & ChatGPT API.\n"
              "✅ Provides real-time responses and enhances user engagement.\n"
              "🌍 Features a scalable backend for seamless performance."),
          onTap: () => _launchURL("https://github.com/harryhritik12"),
        ),
        ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text("💎 NFT Marketplace"),
          subtitle: Text(
              "🛒 Developed a decentralized NFT trading platform using Flutter & Ganache.\n"
              "📜 Implemented smart contracts for secure transactions.\n"
              "🔗 Ensures transparency and reliability in digital asset trading."),
          onTap: () => _launchURL("https://github.com/harryhritik12/nft_marketplace"),
        ),
        ListTile(
          leading: Icon(Icons.music_note),
          title: Text("🎵 Spotify Clone"),
          subtitle: Text(
              "🎶 A fully functional music streaming app built with Flutter & Firebase.\n"
              "🔐 Features user authentication, real-time synchronization, and smooth music playback.\n"
              "📲 Provides a seamless user experience."),
          onTap: () => _launchURL("https://github.com/harryhritik12/spotify_clonet"),
        ),
        ListTile(
          leading: Icon(Icons.school),
          title: Text("🏫 Campus Sync"),
          subtitle: Text(
              "📚 A web-based platform for students built using the MERN stack.\n"
              "🔑 Implemented JWT authentication for data security.\n"
              "📌 Enhances communication and resource-sharing among students."),
          onTap: () => _launchURL("https://campussync.netlify.app/"),
        ),
      ],
    );
  }
}
