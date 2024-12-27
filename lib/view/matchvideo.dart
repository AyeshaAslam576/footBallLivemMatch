import 'package:countdown/controllers/videoplayercontroller.dart';
import 'package:countdown/singleton/singleton.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/route.dart';

class MatchVideo extends StatelessWidget {
  const MatchVideo({super.key});

  @override
  Widget build(BuildContext context) {
    final Videocontroller videocontroller = Get.put(Videocontroller());
    SingleTon s = SingleTon();
    return Scaffold(
      appBar: AppBar(
        title: Text("Live Videos"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.person)),
        ],
      ),
      drawer: Drawer(
        width: 300,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(""),
              accountEmail: Text(""),
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/ft2.jpg"), fit: BoxFit.fill),
              ),
            ),
            ListTile(
              tileColor: Colors.white,
              title: Text("Home", style: GoogleFonts.sen(textStyle:
              TextStyle(fontWeight: FontWeight.w500, fontSize: 16),)),
              onTap: () {
                Get.offNamed(ScreenRoutes.home);
              },
            ),
            SizedBox(height: 10,),
            ListTile(
              tileColor: Colors.white,
              title: Text("All Matches", style: GoogleFonts.sen(textStyle:
              TextStyle(fontWeight: FontWeight.w500, fontSize: 16),)),
              onTap: () {
                Get.offNamed(ScreenRoutes.liveMatch);
              },
            ),
            SizedBox(height: 10,),
            ListTile(
              tileColor: Colors.white,
              title: Text("Stats", style: GoogleFonts.sen(textStyle:
              TextStyle(fontWeight: FontWeight.w500, fontSize: 16),)),
              onTap: () {
                Get.back();
              },
            ),
            SizedBox(height: 10,),
            ListTile(
              tileColor: Colors.white,
              title: Text("Videos", style: GoogleFonts.sen(textStyle:
              TextStyle(fontWeight: FontWeight.w500, fontSize: 16),)),
              onTap: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: Obx(() {
            return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: videocontroller.videosList.length,
              itemBuilder: (context, index) {
                final video = videocontroller.videosList[index];
                videocontroller.initializeVideoController("${video.videoUrl}").then((_) {
                  videocontroller.update();
                }).catchError((error) {
                  print("Error initializing video: $error");
                });
                ;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        videocontroller.videoPlayerController.value.isInitialized
                            ? AspectRatio(
                          aspectRatio: videocontroller.videoPlayerController.value.aspectRatio,
                          child: VideoPlayer(videocontroller.videoPlayerController),
                        )
                            : CircularProgressIndicator(),
                        SizedBox(height: 8),
                        Text(
                            "${s.selectedMatchModel?.matchDate}",
                            style: GoogleFonts.sen(textStyle: TextStyle(color: Color(0xffA4A4A4), fontSize: 14, fontWeight: FontWeight.w700),)
                        ),
                        Text(
                            "${video.videoTitle}",
                            style: GoogleFonts.sen(textStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),)
                        ),

                      ],
                    ),
                  ),
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
