import 'package:flutter/material.dart';
import 'package:ui/model/artist.dart';
import 'package:ui/presentation/widgets/followed_aritst_card.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Artist> followedArtist = [
      Artist(
        id: "1",
        name: "The Weeknd",
        imageURL:
            "https://www.billboard.com/wp-content/uploads/2023/12/the-weeknd-london-after-hours-til-dawn-tour-2023-billboard-1548.jpg",
        genre: ["R&B", "Pop"],
      ),
      Artist(
        id: "2",
        name: "Ariana Grande",
        imageURL:
            "https://www.universalmusictr.com/files/2022/06/ariana-grande-800.jpg",
        genre: ["Pop", "R&B"],
      ),
      Artist(
        id: "3",
        name: "Justin Bieber",
        imageURL:
            "https://www.elle.vn/wp-content/uploads/2014/07/08/Justin-Bieber-0.jpg",
        genre: ["Pop", "R&B"],
      ),
      Artist(
        id: "4",
        name: "Taylor Swift",
        imageURL:
            "https://kenh14cdn.com/thumb_w/660/203336854389633024/2023/12/6/photo-3-1701853908422325710614.jpg",
        genre: ["Pop", "Country"],
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                Text(
                  "Good Evening",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Image(
                  image: AssetImage("assets/icons/stars.png"),
                  width: 32,
                  height: 32,
                ),
              ],
            ),
            InkWell(
              onTap: () {},
              child: const CircleAvatar(
                backgroundImage: AssetImage("assets/images/avatar.jpg"),
                radius: 24,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Followed Artist",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: 116,
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(width: 16),
                itemBuilder: (BuildContext context, int index) {
                  return FollowedArtistCard(
                    artistId: followedArtist[index].id,
                    name: followedArtist[index].name,
                    imageURL: followedArtist[index].imageURL,
                  );
                },
                itemCount: followedArtist.length,
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Column(
            children: [
              Padding(
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
            ],
          ),
        ],
      ),
    );
  }
}
