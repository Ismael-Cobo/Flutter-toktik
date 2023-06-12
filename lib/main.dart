import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:toktik/config/theme/app_theme.dart';
import 'package:toktik/infrastructure/datasources/local_video_datasource_impl.dart';
import 'package:toktik/infrastructure/repositories/video_posts_repository_impl.dart';
import 'package:toktik/presentation/provider/discover_provider.dart';
import 'package:toktik/presentation/screens/discover/discover_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostRepository =
        VideoPostRepositoryImpl(videoPostDatasource: LocalVideoDatasource());
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            lazy: false,
            create: (_) =>
                DiscoverProvider(videoPostRepository: videoPostRepository)
                  ..loadNextPage())
      ],
      child: MaterialApp(
        title: 'TokTik',
        theme: AppTheme().getTheme(),
        debugShowCheckedModeBanner: false,
        home: const DiscoverScreen(),
      ),
    );
  }
}
