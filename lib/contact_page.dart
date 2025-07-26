import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'settings_page.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      appBar: AppBar(
        title: const Text("My Profile"),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            // Profile Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  )
                ],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.deepPurple.shade100,
                    child: const Text(
                      "JM",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Joshna M",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Personal Profile",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Wallet
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF8E2DE2), Color(0xFF4A00E0)],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Wallet Balance",
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "₹0.00",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "View Wallet",
                    style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Menu Items with context
            ..._menuItems.map((item) => _buildTile(item, context)).toList(),

            const SizedBox(height: 30),
            const Text(
                "App version 1.0.0", style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  // Modified _buildTile with context and navigation
  Widget _buildTile(Map<String, dynamic> item, BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: Icon(item["icon"], color: Colors.deepPurple),
        title: Text(item["title"], style: const TextStyle(fontSize: 16)),
        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 14),
        onTap: () {
          if (item["title"] == "Profile") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          } else if (item["title"] == "Settings") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SettingsPage()),
            );
          }
          // Add more pages for other titles if needed
        },
      ),
    );
  }
}

// Menu Items
  final List<Map<String, dynamic>> _menuItems = [
    {"title": "Profile", "icon": Icons.person_outline},
    {"title": "Favourites", "icon": Icons.favorite_border},
    {"title": "Forms", "icon": Icons.insert_drive_file_outlined},
    {"title": "Product Orders", "icon": Icons.shopping_bag_outlined},
    {"title": "Settings", "icon": Icons.settings_outlined},
    {"title": "Support", "icon": Icons.support_agent_outlined},
    {"title": "Language", "icon": Icons.language},
  ];
