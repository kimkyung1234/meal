import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Player extends StatelessWidget {
  final String videoID;
  const Player({
    Key? key,
    required this.videoID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.black,
      child: YoutubePlayer(
        controller: YoutubePlayerController(
          initialVideoId: videoID,
          flags: const YoutubePlayerFlags(
            mute: false,
            disableDragSeek: false,
            loop: false,
            isLive: false,
            forceHD: false,
          ),
        ),
        bottomActions: [
          CurrentPosition(),
          const SizedBox(width: 10.0),
          ProgressBar(isExpanded: true),
          const SizedBox(width: 10.0),
          RemainingDuration(),
        ],
      ),
    );
  }
}
