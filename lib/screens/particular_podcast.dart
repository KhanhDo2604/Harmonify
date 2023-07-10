import 'package:flutter/material.dart';
import 'package:ui/model/postcast_model.dart';
import 'package:ui/widgets/best_podcast.dart';
import 'package:ui/widgets/control_bar.dart';
import 'package:marquee/marquee.dart';

class ParticularPodcast extends StatefulWidget {
  final Podcast podcast;

  const ParticularPodcast(this.podcast, {super.key});

  @override
  State<ParticularPodcast> createState() => _ParticularPodcastState();
}

class _ParticularPodcastState extends State<ParticularPodcast> {
  bool _change = false;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF192038),
      appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            icon: const Icon(Icons.chevron_left),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ]),
      body: ListView(children: [
        Center(
          child: Stack(
            children: [
              Container(
                  width: mediaQuery.width * 0.6,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black54,
                          blurRadius: 2,
                          offset: Offset(8, 10),
                          spreadRadius: 0.1,
                          blurStyle: BlurStyle.normal),
                    ],
                  ),
                  child: Image(image: AssetImage(widget.podcast.image))),
              Positioned(
                  top: 0,
                  right: 0,
                  child: _change
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              _change = false;
                            });
                          },
                          icon: const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ))
                      : IconButton(
                          onPressed: () {
                            setState(() {
                              _change = true;
                            });
                          },
                          icon: const Icon(
                            Icons.favorite_border_outlined,
                            color: Colors.white,
                          ))),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 18,
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(vertical: 32),
          child: Marquee(
            text: widget.podcast.name,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white),
            scrollAxis: Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.start,
            blankSpace: 40.0,
            startPadding: 10.0,
            accelerationCurve: Curves.linear,
          ),
        ),
        ControlBar(widget.podcast.hour),
        BestPostcast(widget.podcast.name),
      ]),
    );
  }
}
