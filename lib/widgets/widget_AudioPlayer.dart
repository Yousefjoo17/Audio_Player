// ignore: file_names
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:g/models/model_AudioDescription.dart';

class WidgetAudioPlayer extends StatefulWidget {
  const WidgetAudioPlayer({super.key, required this.modelAudioDescription});
  final ModelAudioDescription modelAudioDescription;

  @override
  State<WidgetAudioPlayer> createState() => _WidgetAudioPlayerState();
}

class _WidgetAudioPlayerState extends State<WidgetAudioPlayer> {
  bool playing = false;
  IconData playBtn = Icons.play_arrow;
  AudioPlayer player = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  void initState() {
    super.initState();

    player.onPlayerStateChanged.listen((state) {
      setState(() {
        playing = state == PlayerState.playing;
      });
    });
    player.onDurationChanged.listen((newduration) {
      setState(() {
        duration = newduration;
      });
    });
    player.onPositionChanged.listen((newposition) {
      setState(() {
        position = newposition;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Slider(
              min: 0,
              max: duration.inSeconds.toDouble(),
              value: position.inSeconds.toDouble(),
              thumbColor: widget.modelAudioDescription.colors.first,
              onChanged: (value) {
                position = Duration(seconds: value.toInt());
                player.seek(position);
                if (playing) {
                  player.resume();
                }
              },
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_printDuration(position)),
                  Text(_printDuration((duration - position))),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 45.0,
                  color: widget.modelAudioDescription.colors.first,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.skip_previous,
                  ),
                ),
                IconButton(
                  iconSize: 62.0,
                  color: widget.modelAudioDescription.colors.first,
                  onPressed: () {
                    if (!playing) {
                      setState(() {
                        playBtn = Icons.pause;
                        playing = true;
                        player.play(AssetSource(
                            widget.modelAudioDescription.soundpath));
                      });
                    } else {
                      setState(
                        () {
                          playBtn = Icons.play_arrow;
                          playing = false;
                          player.pause();
                        },
                      );
                    }
                  },
                  icon: Icon(
                    playBtn,
                  ),
                ),
                IconButton(
                  iconSize: 45.0,
                  color: widget.modelAudioDescription.colors.first,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.skip_next,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
