import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ControlBar extends StatefulWidget {
  Duration time;
  ControlBar(this.time, {super.key});

  @override
  State<ControlBar> createState() => _ControlBarState();
}

class _ControlBarState extends State<ControlBar> {
  double _currentSliderPrimaryValue = 0;

  String _convertDurationToString(Duration duration) {
    final hours = duration.inHours.remainder(24);
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    final formattedHours = hours.toString().padLeft(2, '0');
    final formattedMinutes = minutes.toString().padLeft(2, '0');
    final formattedSeconds = seconds.toString().padLeft(2, '0');

    return '$formattedHours:$formattedMinutes:$formattedSeconds';
  }

  bool _played = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shuffle,
                  color: Colors.white,
                  size: 32,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.skip_previous_rounded,
                  color: Colors.white,
                  size: 32,
                ),
              ),
              Transform.scale(
                scale: 1.6,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      _played = !_played;
                    });
                  },
                  icon: _played
                      ? const Icon(
                          Icons.pause_circle_filled_rounded,
                          color: Colors.white,
                          size: 32,
                        )
                      : const Icon(
                          Icons.play_circle_filled_rounded,
                          color: Colors.white,
                          size: 32,
                        ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.skip_next_rounded,
                  color: Colors.white,
                  size: 32,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.loop_rounded,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ],
          ),
          SliderTheme(
            data: SliderThemeData(
              trackShape: CustomTrackShape(),
            ),
            child: Slider(
              value: _currentSliderPrimaryValue,
              label: _currentSliderPrimaryValue.round().toString(),
              min: 0,
              max: 1,
              onChanged: (double value) {
                setState(() {
                  _currentSliderPrimaryValue = value;
                });
              },
              activeColor: Colors.red,
              thumbColor: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  _convertDurationToString(Duration(
                      seconds:
                          (_currentSliderPrimaryValue * widget.time.inSeconds)
                              .truncate())),
                  style: const TextStyle(fontSize: 10, color: Colors.white70)),
              Text(
                _convertDurationToString(widget.time),
                style: const TextStyle(fontSize: 10, color: Colors.white70),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double? trackHeight = sliderTheme.trackHeight;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
