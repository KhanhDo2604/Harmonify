import 'package:flutter/material.dart';

class FollowedArtistCard extends StatelessWidget {
  const FollowedArtistCard({
    super.key,
    required this.artistId,
    required this.name,
    required this.imageURL,
  });
  final String artistId;
  final String imageURL;
  final String name;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(imageURL),
            radius: 42,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            name,
            style: const TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
