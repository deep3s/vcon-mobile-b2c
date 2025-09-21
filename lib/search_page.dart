import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'location_service.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();
  final LocationService _locationService = LocationService();

  List<String> _allLocations = [];
  List<String> _filteredLocations = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadLocations();
  }

  Future<void> _loadLocations() async {
    final locations = await _locationService.fetchLocations();
    setState(() {
      _allLocations = locations;
      _filteredLocations = locations;
      _isLoading = false;
    });
  }

  void _filterLocations(String query) {
    if (query.isEmpty) {
      setState(() {
        _filteredLocations = _allLocations;
      });
      return;
    }

    setState(() {
      _filteredLocations = _allLocations
          .where((loc) => loc.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search Locations",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 🔍 Search Bar
            TextField(
              controller: _controller,
              onChanged: _filterLocations,
              decoration: InputDecoration(
                hintText: "Search location...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: theme.colorScheme.surfaceVariant,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 📋 Dropdown Suggestions
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _filteredLocations.isEmpty
                  ? Center(
                child: Text(
                  "No results found",
                  style: theme.textTheme.bodyMedium,
                ),
              )
                  : ListView.separated(
                itemCount: _filteredLocations.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final location = _filteredLocations[index];
                  return ListTile(
                    leading: const Icon(Icons.location_on_outlined),
                    title: Text(
                      location,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Selected: $location"),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
