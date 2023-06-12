import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_post_repository.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostRepository videoPostRepository;
  List<VideoPost> videos = [];
  bool isVideosLoading = true;

  DiscoverProvider({required this.videoPostRepository});

  Future<void> loadNextPage() async {
    Future.delayed(const Duration(seconds: 2));
    final newVideos = await videoPostRepository.getTrendingVideosByPage(1);
    videos.addAll(newVideos);
    isVideosLoading = false;
    notifyListeners();
  }
}
