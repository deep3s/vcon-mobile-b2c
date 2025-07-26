import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isEditing = false;

  final TextEditingController firstNameController = TextEditingController(text: "Joshna");
  final TextEditingController lastNameController = TextEditingController(text: "M");
  final TextEditingController phoneController = TextEditingController(text: "+91 99019 20389");
  final TextEditingController emailController = TextEditingController(text: "vcon.joshnamj@gmail.com");
  final TextEditingController dobController = TextEditingController();
  String gender = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back),
                  ),
                  const SizedBox(width: 16),
                  const Text("My profile", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: TextButton(
                                onPressed: () {
                                  setState(() => isEditing = !isEditing);
                                },
                                child: Text(isEditing ? "Save" : "Edit",
                                    style: const TextStyle(fontSize: 16, color: Colors.deepPurple, fontWeight: FontWeight.w500)),
                              ),
                            ),
                            CircleAvatar(
                              radius: 45,
                              backgroundColor: Colors.deepPurple.shade50,
                              child: Text(
                                "${firstNameController.text.isNotEmpty ? firstNameController.text[0] : ''}${lastNameController.text.isNotEmpty ? lastNameController.text[0] : ''}".toUpperCase(),
                                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text("${firstNameController.text} ${lastNameController.text}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 24),
                            const Divider(),
                            const SizedBox(height: 10),
                            isEditing ? _buildEditableForm() : _buildReadOnlyInfo(),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "My addresses",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 16),
                        _addressTile(Icons.home, "Home", "Add a home address"),
                        const SizedBox(height: 12),
                        _addressTile(Icons.work_outline, "Work", "Add a work address"),
                        const SizedBox(height: 20),
                        OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.add),
                          label: const Text("Add"),
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            side: const BorderSide(color: Colors.black12),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _addressTile(IconData icon, String title, String subtitle) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.shade100,
                child: Icon(icon, color: Colors.grey.shade700),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 4),
                  Text(subtitle, style: TextStyle(color: Colors.grey.shade600, fontSize: 14)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditableForm() {
    return Column(
      children: [
        _buildTextField("First name", firstNameController),
        _buildTextField("Last name", lastNameController),
        _buildTextField("Mobile Number", phoneController, keyboardType: TextInputType.phone),
        _buildTextField("Email", emailController, keyboardType: TextInputType.emailAddress),
        _buildTextField("Date of birth", dobController, hint: "DD/MM/YYYY"),
        DropdownButtonFormField<String>(
          value: gender.isEmpty ? null : gender,
          items: const [
            DropdownMenuItem(value: "Male", child: Text("Male")),
            DropdownMenuItem(value: "Female", child: Text("Female")),
            DropdownMenuItem(value: "Other", child: Text("Other")),
          ],
          onChanged: (value) => setState(() => gender = value ?? ""),
          decoration: const InputDecoration(labelText: "Gender"),
        ),
      ],
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {TextInputType? keyboardType, String? hint}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(labelText: label, hintText: hint, border: const OutlineInputBorder()),
        onChanged: (_) => setState(() {}),
      ),
    );
  }

  Widget _buildReadOnlyInfo() {
    return Column(
      children: [
        ProfileInfo(title: "First name", value: firstNameController.text),
        ProfileInfo(title: "Last name", value: lastNameController.text),
        ProfileInfo(title: "Mobile Number", value: phoneController.text),
        ProfileInfo(title: "Email", value: emailController.text),
        ProfileInfo(title: "Date of birth", value: dobController.text.isEmpty ? "—" : dobController.text),
        ProfileInfo(title: "Gender", value: gender.isEmpty ? "—" : gender),
      ],
    );
  }
}

class ProfileInfo extends StatelessWidget {
  final String title;
  final String value;
  const ProfileInfo({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black87)),
          ),
          Expanded(
            child: Text(value, style: TextStyle(fontSize: 14, color: value == "—" ? Colors.grey : Colors.black87)),
          )
        ],
      ),
    );
  }
}
