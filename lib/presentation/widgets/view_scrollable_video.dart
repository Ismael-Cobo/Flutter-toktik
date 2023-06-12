import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/presentation/widgets/shared/video_buttons/video_buttons.dart';
import 'package:toktik/presentation/widgets/video/full_screen_player.dart';

class VideoScrollableVideo extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableVideo({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost video = videos[index];
        return Stack(
          children: [
            SizedBox.expand(
              child: FullScreenPlayer(
                caption: video.caption,
                videoUrl: video.videUrl,
              ),
            ),
            Positioned(bottom: 40, right: 20, child: VideoButtons(video: video))
          ],
        );
      },
    );
  }
}
