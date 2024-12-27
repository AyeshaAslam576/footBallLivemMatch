import 'package:countdown/models/videomodel.dart';
import 'package:countdown/singleton/singleton.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:video_player/video_player.dart';
import 'package:get/get.dart';
class Videocontroller extends GetxController {
  String baseUrl = "https://apiv3.apifootball.com/";
  String apiKey = "d5be4f2ec995c47867206600ee18f02bf98431483e534e021a86843d98c6e3a4";
  RxBool isPlaying = false.obs;
  RxList<Videomodel> videosList = RxList();
  late VideoPlayerController videoPlayerController;
  late SingleTon s = SingleTon();
  @override
  void onInit() {
    super.onInit();

    getVideos();
  }
  Future<void> initializeVideoController(String videoUrl) async {
    Uri videoUriParsed = Uri.parse(videoUrl);
    videoPlayerController = VideoPlayerController.networkUrl(videoUriParsed)
      ..initialize().then((value) {
        videoPlayerController.play();
        isPlaying.value = true;
        update();
      });
  }
  void videoPlayPause() {
    if (videoPlayerController.value.isPlaying) {
      videoPlayerController.pause();
      isPlaying.value = false;
    } else {
      videoPlayerController.play();
      isPlaying.value = true;
    }
    update();
  }
  Future<void> getVideos() async {
    Dio dio = Dio();
    try {
      var response = await dio.get(baseUrl, queryParameters: {
        "action": "get_videos",
        "APIkey": apiKey,
      });
      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        List<dynamic> data = response.data;
        videosList.addAll(data.map((json) => Videomodel.fromJson(json)).toList());
      } else {
        print("Failed to fetch videos data for the match id ${s.selectedMatchModel?.matchId}");
      }
    } catch (e) {
      print("Error while fetching videos record ${e}");
    }
  }
}