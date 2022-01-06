import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final String text;
  const SearchBar({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          const Icon(
            Icons.search,
            color: Colors.grey,
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: text,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
