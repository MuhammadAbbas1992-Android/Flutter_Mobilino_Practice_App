import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class HomeController extends GetxController {
  late VideoPlayerController videoPlayerController;
  var isPlaying = false.obs;
  var isInitialized = false.obs;

  @override
  void onInit() {
    super.onInit();
    videoPlayerController =
        VideoPlayerController.asset('assets/videos/sample.mp4')
          ..initialize().then((_) {
            isInitialized.value = true;
            update(); // Refresh UI when the video is initialized
          });
  }

  void togglePlayPause() {
    if (videoPlayerController.value.isPlaying) {
      videoPlayerController.pause();
      isPlaying.value = false;
    } else {
      videoPlayerController.play();
      isPlaying.value = true;
    }
    update();
  }

  @override
  void onClose() {
    videoPlayerController.dispose();
    super.onClose();
  }
}
