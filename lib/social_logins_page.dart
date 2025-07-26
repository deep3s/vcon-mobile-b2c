import 'package:flutter/material.dart';

class SocialLoginsPage extends StatelessWidget {
  const SocialLoginsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Social logins", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          _loginTile("Google", "Not connected", "assets/google.png"),
          _loginTile("Facebook", "Not connected", "assets/fb.png"),

          _loginTile("Apple", "Not connected", "assets/apple.png"),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text("Done", style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _loginTile(String title, String subtitle, String imagePath) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 22,
        backgroundImage: AssetImage(imagePath),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey)),
      trailing: Switch(value: false, onChanged: (_) {}),
    );
  }
}
