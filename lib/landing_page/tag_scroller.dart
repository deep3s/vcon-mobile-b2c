import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TagScroller extends StatelessWidget {
  final List<String> tags;
  final String selectedTag;
  final Function(String) onTagSelected;

  const TagScroller({
    super.key,
    required this.tags,
    required this.selectedTag,
    required this.onTagSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tags.length,
        itemBuilder: (context, index) {
          final tag = tags[index];
          final isSelected = tag == selectedTag;

          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              label: Text(
                tag,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
              selected: isSelected,
              onSelected: (_) => onTagSelected(tag),
              selectedColor: Colors.black,
              backgroundColor: Colors.grey.shade200,
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          );
        },
      ),
    );
  }
}
