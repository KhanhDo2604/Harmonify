import 'package:flutter/material.dart';
import 'package:ui/model/postcast_model.dart';
import 'package:ui/screens/particular_podcast.dart';

class CardMusic extends StatelessWidget {
  const CardMusic({
    super.key,
    required this.podcast,
  });

  final Podcast podcast;

  String formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);

    final formattedHours = hours.toString();
    final formattedMinutes = minutes.toString().padLeft(2, '0');

    return formattedHours == '0'
        ? '$formattedMinutes min'
        : '$formattedHours hr $formattedMinutes min';
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ParticularPodcast(podcast)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              clipBehavior: Clip.hardEdge,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Image(image: AssetImage(podcast.image)),
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      podcast.timeRelease,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      formatDuration(podcast.hour),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width - 140),
                  child: Text(
                    podcast.name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                    overflow: TextOverflow.clip,
                    softWrap: true,
                  ),
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
