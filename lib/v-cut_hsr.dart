import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_time_app/landing_page/tag_scroller.dart';

// No need to import Maps_flutter if using a static image
// import 'package:Maps_flutter/Maps_flutter.dart';

class VCutHSR extends StatefulWidget {
  const VCutHSR({super.key});

  @override
  State<VCutHSR> createState() => _VCutHSRState();
}

// Data model for Nearby Venue
class NearbyVenue {
  final String name;
  final double? rating; // Nullable for venues without a rating in data
  final int? reviewCount; // Nullable for venues without review count
  final String category;
  final String distance;
  final String? imageUrl; // Placeholder for image, can be network or asset

  NearbyVenue({
    required this.name,
    this.rating,
    this.reviewCount,
    required this.category,
    required this.distance,
    this.imageUrl,
  });
}

class _VCutHSRState extends State<VCutHSR> {
  final List<String> _tags = [
    'Featured',
    'Buy 1 Get 1 FREE',
    'Choose Any 4 & Pay Less',
    'Hair Treatment',
    'Hair Cut',
    'Waxing',
  ];

  String _selectedTag = 'Featured';
  bool _showAllFeatured = false;

  final Map<String, List<Map<String, String>>> _tagToServices = {
    'Featured': [
      {'title': 'Any 1 Threading', 'duration': '10 mins', 'price': '₹79.20'},
      {'title': 'Hair Cut', 'duration': '30 mins – 40 mins', 'price': '₹319.20'},
      {'title': 'Detan Pack - Face & Neck', 'duration': '25 mins', 'price': '₹199.00',},
      {'title': 'Upper Lip + Eyebrow Threading', 'duration': '15 mins', 'price': '₹99.00',},
      {'title': 'Under Arms Waxing', 'duration': '10 mins', 'price': '₹149.00',},
      {'title': 'Pedicure + Manicure Combo', 'duration': '1 hr 10 mins', 'price': '₹599.00',},],
    'Buy 1 Get 1 FREE': [
      {'title': 'Facial + Cleanup Combo', 'duration': '1 hr', 'price': '₹999.00'},
      {'title': 'Full Arms Wax + Underarms Wax', 'duration': '45 mins', 'price': '₹299.00'},
      {'title': 'Head Massage + Hair Wash', 'duration': '30 mins', 'price': '₹199.00'},
      {'title': 'Brazilian Wax', 'duration': '10 mins – 30 mins', 'price': '₹119.20',},
    ],
    'Choose Any 4 & Pay Less': [
      {'title': 'Threading Combo (Eyebrow, Forehead, Upper Lip, Chin)', 'duration': '30 mins', 'price': '₹199.00'},
      {'title': 'Waxing Combo (Arms, Legs, Underarms, Back)', 'duration': '1 hr 15 mins', 'price': '₹699.00'},
      {'title': 'Glow Pack (Facial, Cleanup, Bleach, Detan)', 'duration': '1 hr 30 mins', 'price': '₹1,299.00'},
      {'title': 'Hair Treatments', 'duration': '3 hrs', 'price': '₹4,999',},
    ],
    'Hair Treatment': [
      {'title': 'Hair Spa & Smoothening', 'duration': '1 hr', 'price': '₹999.00'},
      {'title': 'Anti-Dandruff Hair Spa', 'duration': '45 mins', 'price': '₹799.00'},
      {'title': 'Keratin Treatment', 'duration': '2 hrs 30 mins', 'price': '₹2,999.00'},
      {'title': 'Hair Fall Control Therapy', 'duration': '1 hr 30 mins', 'price': '₹1,499.00'},
    ],
    'Hair Cut': [
      {'title': 'Hair Cut', 'duration': '30 mins – 40 mins', 'price': '₹319.20'},
      {'title': 'Women Hair Cut', 'duration': '45 mins', 'price': '₹399.00',},
    ],
    'Waxing': [
      {'title': 'Under Arms Waxing', 'duration': '10 mins', 'price': '₹149.00',},
      {'title': 'Full Body Wax', 'duration': '1 hr', 'price': '₹799.00',},
    ],
  };

  // Static map image URL
  final String _staticMapImageUrl = 'http://googleusercontent.com/image_collection/image_retrieval/5969132822553370317_0';

  // List of nearby venues
  final List<NearbyVenue> _nearbyVenues = [
    NearbyVenue(
      name: 'Looks Salon – HSR',
      rating: 4.5, // Example rating
      reviewCount: 120, // Example review count
      category: 'Hair Salon',
      distance: '0.3 km away',
      imageUrl: 'https://via.placeholder.com/150/FF5733/FFFFFF?text=Looks', // Placeholder image
    ),
    NearbyVenue(
      name: 'Vedica ayurvedic wellness center',
      rating: 2.0,
      reviewCount: 1,
      category: 'Physical therapy',
      distance: 'HSR Layout, Bengaluru', // From image_e0bc44.jpg
      imageUrl: 'https://via.placeholder.com/150/33FF57/FFFFFF?text=Vedica', // Placeholder image
    ),
    NearbyVenue(
      name: 'Hellojin – Bommanahalli', // Assuming similar to "Hellojin Bommanahalli"
      rating: 4.8,
      reviewCount: 4,
      category: 'Hair Salon', // Assuming category
      distance: '2.5 km away', // Example distance
      imageUrl: 'https://via.placeholder.com/150/5733FF/FFFFFF?text=Hellojin', // Placeholder image
    ),
    NearbyVenue(
      name: 'Green Trends – Koramangala',
      rating: 4.2,
      reviewCount: 85,
      category: 'Unisex Salon',
      distance: '1.1 km away',
      imageUrl: 'https://via.placeholder.com/150/FF33CC/FFFFFF?text=Green', // Placeholder image
    ),
    NearbyVenue(
      name: 'Naturals – BTM Layout',
      rating: 4.6,
      reviewCount: 150,
      category: 'Unisex Salon',
      distance: '1.5 km away',
      imageUrl: 'https://via.placeholder.com/150/33CCFF/FFFFFF?text=Naturals', // Placeholder image
    ),
  ];


  @override
  Widget build(BuildContext context) {
    final allServices = _tagToServices[_selectedTag] ?? [];
    final services = (_selectedTag == 'Featured' && !_showAllFeatured)
        ? allServices.take(5).toList()
        : allServices;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/salon.png',
                  width: double.infinity,
                  height: 230,
                  fit: BoxFit.cover,
                ),

                // 🔙 Back Button
                Positioned(
                  top: 12,
                  left: 12,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),

                // ❤️ Favorite Button
                Positioned(
                  top: 12,
                  right: 60,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.favorite_border, color: Colors.black),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Added to favorites')),
                        );
                      },
                    ),
                  ),
                ),

                // 📤 Share Button
                Positioned(
                  top: 12,
                  right: 12,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.share, color: Colors.black),
                      onPressed: () {
                        // For share functionality, you must add the "share_plus" package
                        // Example: Share.share('Check out V-Cut HSR on our app!');
                      },
                    ),
                  ),
                ),
              ],
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'GetLook Unisex Salon HS...', // Updated to match image
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.star, size: 16, color: Colors.black),
                        Text(
                          ' 4.7 ',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        Text('(3)', style: GoogleFonts.inter(color: Colors.grey)),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Bengaluru, Bengaluru',
                      style: GoogleFonts.inter(color: Colors.grey.shade700),
                    ),
                    Text(
                      'Open until 9:00 pm',
                      style: GoogleFonts.inter(color: Colors.grey.shade700),
                    ),
                    const SizedBox(height: 12),

                    // 🔻 Tag filter bar
                    TagScroller(
                      tags: _tags,
                      selectedTag: _selectedTag,
                      onTagSelected: (tag) {
                        setState(() {
                          _selectedTag = tag;
                          _showAllFeatured = false; // reset when tag changes
                        });
                      },
                    ),

                    const SizedBox(height: 20),
                    const Divider(),

                    // 🔻 Services based on tag
                    ...services.map((service) => _serviceCard(
                      title: service['title']!,
                      duration: service['duration']!,
                      price: service['price']!,
                      onTap: () {},
                    )),

                    const SizedBox(height: 20),
                    if (_selectedTag == 'Featured' && !_showAllFeatured)
                      Center(
                        child: TextButton(
                          onPressed: () {
                            setState(() => _showAllFeatured = true);
                          },
                          child: Text(
                            'See all',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),

                    const SizedBox(height: 24),

                    // 🔻 Reviews Section
                    Text(
                      'Reviews',
                      style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 12),
                    _reviewCard(username: 'Ayesha K.', rating: 5, comment: 'Loved the facial and the ambiance!'),
                    _reviewCard(username: 'Ravi S.', rating: 4, comment: 'Haircut was perfect. Staff was polite.'),
                    _reviewCard(username: 'Nikita J.', rating: 5, comment: 'Threading was quick and painless. Recommended!'),
                    const SizedBox(height: 24),


                    // 🔻 About Section
                    Text(
                      'About',
                      style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'GetLook is a premier salon service provider based in Bangalore, offering a wide range of professional beauty and grooming services. Our specialties include Hydra Facials, Hair Highlights, Hair Botox, Waxing, Facials, Pedicures, Manicures, and much more. At GetLook, we are committed to quality and excellence, using only branded, high-quality products to ensure the best results and customer satisfaction.',
                      style: GoogleFonts.inter(fontSize: 14, color: Colors.grey.shade700),
                    ),
                    const SizedBox(height: 24),

                    // 🔻 Opening times
                    Text(
                      'Opening times',
                      style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 12),
                    _buildOpeningTimes(),
                    const SizedBox(height: 24),

                    // 🔻 Additional information
                    Text(
                      'Additional information',
                      style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 12),
                    _buildAdditionalInformation(),
                    const SizedBox(height: 24),

                    // 🔻 Map Section (Static Image)
                    Text(
                      'Location',
                      style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      height: 200, // Or any desired height
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade300), // Optional border
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          _staticMapImageUrl,
                          fit: BoxFit.cover, // Adjust as needed (e.g., BoxFit.contain)
                          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                          errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                            return Center(
                              child: Text(
                                'Could not load map image.',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(color: Colors.red),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'L377 2nd Floor Above Rajesh Jewellery,',
                      style: GoogleFonts.inter(fontSize: 14, color: Colors.grey.shade700),
                    ),
                    Text(
                      'Bengaluru, Karnataka 560102',
                      style: GoogleFonts.inter(fontSize: 14, color: Colors.grey.shade700),
                    ),
                    const SizedBox(height: 24),

                    // 🔻 Venues Nearby (Horizontally Scrollable)
                    Text(
                      'Venues Nearby',
                      style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 180, // Adjust height as needed for the cards
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _nearbyVenues.length,
                        itemBuilder: (context, index) {
                          final venue = _nearbyVenues[index];
                          return _nearbyVenueCard(venue);
                        },
                      ),
                    ),
                    const SizedBox(height: 80), // Increased space at the bottom
                  ],
                ),
              ),
            ),

            // 🔻 Bottom booking section
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '${services.length} services available',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Book now',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  // 🔻 Service Card
  Widget _serviceCard({
    required String title,
    required String duration,
    required String price,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(duration, style: GoogleFonts.inter(fontSize: 12, color: Colors.grey)),
                const SizedBox(height: 4),
                Text('from $price', style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          const SizedBox(width: 16),
          ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.shade100,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 0,
            ),
            child: const Text('Book'),
          ),
        ],
      ),
    );
  }

  // 🔻 Review Card
  Widget _reviewCard({
    required String username,
    required int rating,
    required String comment,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: List.generate(
              5,
                  (index) => Icon(
                index < rating ? Icons.star : Icons.star_border,
                color: Colors.amber,
                size: 18,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            username,
            style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 14),
          ),
          const SizedBox(height: 4),
          Text(
            comment,
            style: GoogleFonts.inter(fontSize: 13),
          ),
        ],
      ),
    );
  }

  // 🔻 Nearby Venue Card for Horizontal Scroll
  Widget _nearbyVenueCard(NearbyVenue venue) {
    return Container(
      width: 150, // Fixed width for each card
      margin: const EdgeInsets.only(right: 12), // Space between cards
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              venue.imageUrl ?? 'https://via.placeholder.com/150', // Fallback placeholder
              height: 100, // Height for the image
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 100,
                color: Colors.grey.shade300,
                child: Center(
                  child: Icon(Icons.broken_image, color: Colors.grey.shade600),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  venue.name,
                  style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 13),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (venue.rating != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.star, size: 12, color: Colors.black),
                      Text(
                        ' ${venue.rating!.toStringAsFixed(1)} ',
                        style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w600),
                      ),
                      if (venue.reviewCount != null)
                        Text(
                          '(${venue.reviewCount})',
                          style: GoogleFonts.inter(fontSize: 10, color: Colors.grey),
                        ),
                    ],
                  ),
                ],
                const SizedBox(height: 4),
                Text(
                  venue.category,
                  style: GoogleFonts.inter(fontSize: 10, color: Colors.grey.shade600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  // 🔻 Opening Times Section
  Widget _buildOpeningTimes() {
    return Column(
      children: [
        _openingTimeRow('Monday', '10:00 am - 9:00 pm'),
        _openingTimeRow('Tuesday', '10:00 am - 9:00 pm'),
        _openingTimeRow('Wednesday', '10:00 am - 9:00 pm'),
        _openingTimeRow('Thursday', '10:00 am - 9:00 pm'),
        _openingTimeRow('Friday', '10:00 am - 9:00 pm'),
        _openingTimeRow('Saturday', '10:00 am - 9:00 pm'),
        _openingTimeRow('Sunday', '10:00 am - 9:00 pm'),
      ],
    );
  }

  Widget _openingTimeRow(String day, String time) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          const Icon(Icons.circle, size: 8, color: Colors.green),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              day,
              style: GoogleFonts.inter(fontSize: 14, color: Colors.grey.shade700),
            ),
          ),
          Text(
            time,
            style: GoogleFonts.inter(fontSize: 14, color: Colors.grey.shade700),
          ),
        ],
      ),
    );
  }

  // 🔻 Additional Information Section
  Widget _buildAdditionalInformation() {
    return Column(
      children: [
        _additionalInfoRow(Icons.check_circle_outline, 'Instant confirmation'),
        _additionalInfoRow(Icons.face, 'Kid-friendly'),
        _additionalInfoRow(Icons.local_parking, 'Parking available'),
        _additionalInfoRow(Icons.directions_bus, 'Near public transport'),
        _additionalInfoRow(Icons.shower, 'Showers'),
        _additionalInfoRow(Icons.eco, 'Organic products only'),
        _additionalInfoRow(Icons.people, 'LGBTQ+'),
        _additionalInfoRow(Icons.woman, 'Woman-owned'),
      ],
    );
  }

  Widget _additionalInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.black),
          const SizedBox(width: 12),
          Text(
            text,
            style: GoogleFonts.inter(fontSize: 14, color: Colors.black),
          ),
        ],
      ),
    );
  }
}