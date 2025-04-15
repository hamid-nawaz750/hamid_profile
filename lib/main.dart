import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const HamidProfileApp());
}

class HamidProfileApp extends StatelessWidget {
  const HamidProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hamid Nawaz Profile',
      debugShowCheckedModeBanner: false,
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/kust2.png"), // Your background image
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Dark overlay with reduced darkness
          Container(color: Colors.black.withOpacity(0.2)),

          // Foreground Content
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      width: constraints.maxWidth > 600 ? 500 : double.infinity,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(
                          0.8,
                        ), // Semi-transparent white
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const CircleAvatar(
                            radius: 60,
                            backgroundImage: AssetImage(
                              'assets/hamid.png',
                            ), // Your profile picture
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Hamid Nawaz',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Flutter Developer | Passionate Learner',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 24),
                          Wrap(
                            spacing: 12,
                            children: [
                              ElevatedButton.icon(
                                onPressed:
                                    () => _launchURL(
                                      'https://github.com/hamidnawaz',
                                    ),
                                icon: const Icon(Icons.code),
                                label: const Text('GitHub'),
                              ),
                              ElevatedButton.icon(
                                onPressed:
                                    () => _launchURL(
                                      'https://linkedin.com/in/hamidnawaz',
                                    ),
                                icon: const Icon(Icons.work),
                                label: const Text('LinkedIn'),
                              ),
                              ElevatedButton.icon(
                                onPressed:
                                    () =>
                                        _launchURL('mailto:hamid@example.com'),
                                icon: const Icon(Icons.email),
                                label: const Text('Email'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
