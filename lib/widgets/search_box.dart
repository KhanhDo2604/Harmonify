import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          filled: true,
          fillColor: const Color(0xFF222b45),
          hintText: 'Search',
          hintStyle: const TextStyle(color: Colors.white),
          prefixIcon: IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
              size: 32,
            ),
            onPressed: () {
              // Perform the search here
            },
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
