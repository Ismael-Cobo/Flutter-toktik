import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:toktik/config/helpers/HumanFormats.dart';
import 'package:toktik/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video;
  const VideoButtons({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButton(
          icon: Icons.favorite,
          value: video.likes,
          iconColor: Colors.red,
        ),
        const SizedBox(
          height: 20,
        ),
        _CustomIconButton(
          icon: Icons.remove_red_eye_outlined,
          value: video.views,
        ),
        const SizedBox(
          height: 20,
        ),
        SpinPerfect(
            infinite: true,
            duration: const Duration(seconds: 2),
            child: const _CustomIconButton(
              icon: Icons.play_circle_outline,
              value: 0,
            ))
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final IconData icon;
  final int value;
  final Color? color;
  const _CustomIconButton({required this.icon, required this.value, iconColor})
      : color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            icon,
            color: color,
            size: 30,
          ),
        ),
        if (value > 0) Text(HumanFormats.humanReadableNumber(value))
      ],
    );
  }
}
