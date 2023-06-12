import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/presentation/provider/discover_provider.dart';
import 'package:toktik/presentation/widgets/view_scrollable_video.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final discoverProvider = context.watch<DiscoverProvider>();
    return SafeArea(
        child: Scaffold(
      body: discoverProvider.isVideosLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : VideoScrollableVideo(
              videos: discoverProvider.videos,
            ),
    ));
  }
}
