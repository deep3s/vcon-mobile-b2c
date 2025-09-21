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
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // AppBar section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back, color: colorScheme.onBackground),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    "My profile",
                    style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),

            // Content section
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Profile Card
                    Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      elevation: 2,
                      color: colorScheme.surface,
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
                                child: Text(
                                  isEditing ? "Save" : "Edit",
                                  style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500, color: colorScheme.primary),
                                ),
                              ),
                            ),
                            CircleAvatar(
                              radius: 45,
                              backgroundColor: colorScheme.secondaryContainer,
                              child: Text(
                                "${firstNameController.text[0]}${lastNameController.text[0]}".toUpperCase(),
                                style: textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: colorScheme.onSecondaryContainer,
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              "${firstNameController.text} ${lastNameController.text}",
                              style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 24),
                            const Divider(),
                            const SizedBox(height: 10),
                            isEditing ? _buildEditableForm(context) : _buildReadOnlyInfo(context),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Address Section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "My addresses",
                          style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 16),
                        _addressTile(Icons.home, "Home", "Add a home address", context),
                        const SizedBox(height: 12),
                        _addressTile(Icons.work_outline, "Work", "Add a work address", context),
                        const SizedBox(height: 20),
                        OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.add),
                          label: const Text("Add"),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: colorScheme.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            side: BorderSide(color: colorScheme.primary.withOpacity(0.3)),
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

  // Address Card
  Widget _addressTile(IconData icon, String title, String subtitle, BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: Theme.of(context).cardColor,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: colorScheme.surfaceVariant,
                child: Icon(icon, color: colorScheme.onSurfaceVariant),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500)),
                  const SizedBox(height: 4),
                  Text(subtitle, style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurface.withOpacity(0.6))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Editable Form
  Widget _buildEditableForm(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

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
          decoration: const InputDecoration(labelText: "Gender", border: OutlineInputBorder()),
        ),
      ],
    );
  }

  // Text Input
  Widget _buildTextField(String label, TextEditingController controller, {TextInputType? keyboardType, String? hint}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: const OutlineInputBorder(),
        ),
        onChanged: (_) => setState(() {}),
      ),
    );
  }

  // Read-Only Display
  Widget _buildReadOnlyInfo(BuildContext context) {
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

// Info Row
class ProfileInfo extends StatelessWidget {
  final String title;
  final String value;

  const ProfileInfo({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              title,
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: colorScheme.onSurface,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: textTheme.bodyMedium?.copyWith(
                color: value == "—" ? colorScheme.onSurface.withOpacity(0.5) : colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
