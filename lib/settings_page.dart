import 'package:flutter/material.dart';
import 'social_logins_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10),
        children: [
          _settingsTile(context, Icons.share, "Social logins"),
          _settingsTile(context, Icons.notifications_none, "Notifications"),
          _settingsTile(context, Icons.language, "Language"),
          const Divider(),
          _settingsTile(context, Icons.privacy_tip_outlined, "Privacy policy"),
          _settingsTile(context, Icons.description_outlined, "Terms of service"),
          _settingsTile(context, Icons.description, "Terms of use"),
          const SizedBox(height: 24),
          Center(
            child: OutlinedButton(
              onPressed: () {
                // Handle delete logic
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.red,
                side: const BorderSide(color: Colors.red),
              ),
              child: const Text("Delete account"),
            ),
          ),
          const SizedBox(height: 16),
          const Center(
            child: Text("App version 3.23.6 (111)", style: TextStyle(color: Colors.grey)),
          ),
        ],
      ),
    );
  }

  Widget _settingsTile(BuildContext context, IconData icon, String label) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        if (label == "Social logins") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const SocialLoginsPage()),
          );
        }
      },
    );
  }
}
