import 'package:flutter/material.dart';

class SalonCard extends StatelessWidget {
  final String title;
  final double rating;
  final int reviews;
  final String location;
  final String image;

  const SalonCard({
    Key? key,
    required this.title,
    required this.rating,
    required this.reviews,
    required this.location,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(image, height: 150, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.orange, size: 16),
                    const SizedBox(width: 4),
                    Text("$rating ($reviews)", style: const TextStyle(fontSize: 14)),
                  ],
                ),
                const SizedBox(height: 4),
                Text(location, style: TextStyle(fontSize: 13, color: Colors.grey[700])),
              ],
            ),
          )
        ],
      ),
    );
  }
}
