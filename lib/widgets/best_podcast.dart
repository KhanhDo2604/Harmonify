import 'package:flutter/material.dart';
import 'package:ui/model/postcast_model.dart';
import 'card_music.dart';

class BestPostcast extends StatelessWidget {
  final String podName;
  const BestPostcast(this.podName, {super.key});

  @override
  Widget build(BuildContext context) {
    List<Podcast> podcastList = [
      Podcast('assets/images/school_motion.jpg', 'The Year in MoGraph - 2020',
          const Duration(hours: 3, minutes: 31), 'DEC 30, 2020'),
      Podcast(
          'assets/images/honest_designers.jpg',
          'Episode 197: The World of Lettering',
          const Duration(minutes: 42),
          'DEC 2, 2020'),
      Podcast(
          'assets/images/marketing.jpg',
          'How to Create YouTube Video Ads That Convert',
          const Duration(minutes: 52),
          'DEC 18, 2020'),
      Podcast(
          'assets/images/design_better.jpeg',
          'Airbnb’s Brian Chesky: Designing for trust',
          const Duration(minutes: 46),
          'DEC 15, 2020'),
      Podcast('assets/images/Twenty_Thousand_Hertz.jpg', 'Sounds Worth Saving',
          const Duration(minutes: 46), 'DEC 09, 2020'),
    ];

    if (podName != "") {
      podcastList = podcastList.where((i) => i.name != podName).toList();
    }

    return Column(children: [
      Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Text(
              podName != ""
                  ? "Favorite Podcast Episodes"
                  : 'Best Podcast Episodes',
              style: const TextStyle(color: Colors.white),
            ),
            const Spacer(),
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: const Size(50, 30),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () {},
              child: Text('View all',
                  style: Theme.of(context).textTheme.labelMedium),
            ),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 24),
        child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
                  height: 16,
                ),
            itemCount: podcastList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return CardMusic(podcast: podcastList[index]);
            }),
      ),
    ]);
  }
}
