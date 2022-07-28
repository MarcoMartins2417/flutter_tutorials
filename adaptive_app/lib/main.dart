import 'dart:io';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/adaptive_playlists.dart';
import 'src/app_state.dart';


const flutterDevAccountId = 'UCwXdFgeE9KYzlDdR7TG9cMw';

const youTubeApiKey = 'AIzaSyCKJ2b_xxk8r8Iff8-yNk3Vi3jmk64JPv0';  // API Key 

void main() {
  if (youTubeApiKey == 'AIzaSyCKJ2b_xxk8r8Iff8-yNk3Vi3jmk64JPv0') {
    print('youTubeApiKey has not been configured.');
    exit(1);
  }

  runApp(ChangeNotifierProvider<FlutterDevPlaylists>(
    create: (context) => FlutterDevPlaylists(
      flutterDevAccountId: flutterDevAccountId,
      youTubeApiKey: youTubeApiKey,
    ),
    child: const PlaylistsApp(),
  ));
}

class PlaylistsApp extends StatelessWidget {
  const PlaylistsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterDev Playlists',
      theme: FlexColorScheme.light(scheme: FlexScheme.red).toTheme,
      darkTheme: FlexColorScheme.dark(scheme: FlexScheme.red).toTheme,
      themeMode: ThemeMode.dark, 
      debugShowCheckedModeBanner: false,
      home: const AdaptivePlaylists(),
    );
  }
}
