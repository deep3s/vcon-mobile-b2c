import 'dart:convert';
import 'package:http/http.dart' as http;

class LocationService {
  // ⚡ Change depending on where your Spring Boot app runs
  final String baseUrl = "http://10.0.2.2:8080/api/locations";

  Future<List<String>> fetchLocations() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final decoded = json.decode(response.body);

        // Your API wraps data inside ApiResponse object, so extract 'data'
        final List locations = decoded['data'];

        return locations.map((item) => item['name'].toString()).toList();
      } else {
        throw Exception("Failed to load locations (status: ${response.statusCode})");
      }
    } catch (e) {
      print("❌ Error fetching locations: $e");
      return [];
    }
  }
}
 