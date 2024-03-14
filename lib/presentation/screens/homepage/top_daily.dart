import 'package:flutter/material.dart';
import 'package:ui/presentation/widgets/normal_song_card.dart';

import '../../../model/song.dart';

class TopDaily extends StatelessWidget {
  const TopDaily({super.key});

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.height;
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
                "Top Daily Playlists",
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
          height: size * 0.3,
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(height: 16),
            itemBuilder: (BuildContext context, int index) {
              return NormalSongCard(
                songName: recentlyPlayed[index].title,
                artistName: recentlyPlayed[index].artist,
                songURL: recentlyPlayed[index].url,
                songImage: recentlyPlayed[index].songImage,
              );
            },
            itemCount: recentlyPlayed.length,
          ),
        ),
      ],
    );
  }
}
