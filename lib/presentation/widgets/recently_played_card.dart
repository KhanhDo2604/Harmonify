import 'package:flutter/material.dart';

class RecentlyPlayedCard extends StatelessWidget {
  const RecentlyPlayedCard({
    super.key,
    required this.songName,
    required this.artistName,
    required this.songURL,
    required this.songImage,
  });
  final String songName;
  final String artistName;
  final String songURL;
  final String songImage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              songImage,
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            width: 120,
            child: Text(
              songName,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            artistName,
            style: const TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
