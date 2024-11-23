import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:video_player/video_player.dart';

import '../../view_models/controllers/home/home_controller.dart';

class VideoPlayWidget extends StatelessWidget {
  const VideoPlayWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    return Center(
      child: Obx(
        () => homeController.isInitialized.value
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AspectRatio(
                    aspectRatio:
                        homeController.videoPlayerController.value.aspectRatio,
                    child: VideoPlayer(homeController.videoPlayerController),
                  ),
                  const SizedBox(height: 20),
                  IconButton(
                    icon: Icon(
                      homeController.isPlaying.value
                          ? Icons.pause
                          : Icons.play_arrow,
                      size: 40,
                    ),
                    onPressed: homeController.togglePlayPause,
                  ),
                ],
              )
            : const CircularProgressIndicator(), // Shows while video is loading
      ),
    );
  }
}
