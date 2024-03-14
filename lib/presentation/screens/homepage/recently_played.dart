import 'package:flutter/material.dart';
import 'package:ui/presentation/widgets/recently_played_card.dart';

import '../../../model/song.dart';

class RecentlyPlayed extends StatelessWidget {
  const RecentlyPlayed({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context).width;

    List<Song> recentlyPlayed = [
      Song(
        title: "Blinding Lights",
        artist: "The Weeknd",
        artistId: "1",
        url: "https://www.youtube.com/watch?v=4NRXx6U8ABQ",
        songImage:
            "https://www.billboard.com/wp-content/uploads/2023/12/the-weeknd-london-after-hours-til-dawn-tour-2023-billboard-1548.jpg",
      ),
      Song(
        title: "Save Your Tears",
        artist: "The Weeknd",
        artistId: "1",
        url: "https://www.youtube.com/watch?v=XXYlFuWEuKI",
        songImage:
            "https://www.billboard.com/wp-content/uploads/2023/12/the-weeknd-london-after-hours-til-dawn-tour-2023-billboard-1548.jpg",
      ),
      Song(
        title: "In Your Eyes",
        artist: "The Weeknd",
        artistId: "1",
        url: "https://www.youtube.com/watch?v=dq4aOaDXIfY",
        songImage:
            "https://www.billboard.com/wp-content/uploads/2023/12/the-weeknd-london-after-hours-til-dawn-tour-2023-billboard-1548.jpg",
      ),
      Song(
        title: "Save Your Tears",
        artist: "The Weeknd",
        artistId: "1",
        url: "https://www.youtube.com/watch?v=XXYlFuWEuKI",
        songImage:
            "https://www.billboard.com/wp-content/uploads/2023/12/the-weeknd-london-after-hours-til-dawn-tour-2023-billboard-1548.jpg",
      ),
    ];

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recently Played",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: size * 0.45,
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(width: 16),
              itemBuilder: (BuildContext context, int index) {
                return RecentlyPlayedCard(
                  songName: recentlyPlayed[index].title,
                  artistName: recentlyPlayed[index].artist,
                  songURL: recentlyPlayed[index].url,
                  songImage: recentlyPlayed[index].songImage,
                );
              },
              itemCount: recentlyPlayed.length,
            ),
          ),
        ),
      ],
    );
  }
}
