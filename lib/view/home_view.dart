import 'package:countdown/singleton/singleton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/livematch_controller.dart';
import '../routes/route.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    SingleTon s=SingleTon();
    final LivematchController livematchController = Get.put(
        LivematchController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
                image: DecorationImage(
                    image: AssetImage("assets/ft2.jpg"), fit: BoxFit.fill),
              ),
            ),
            ListTile(
              tileColor: Colors.white,
              title: Text("Home", style: GoogleFonts.sen(textStyle:
              TextStyle(fontWeight: FontWeight.w500, fontSize: 16),)),
              onTap: () {
                  Get.back();
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
                Get.offNamed(ScreenRoutes.stats);
              },
            ),
            SizedBox(height: 10,),
            ListTile(
              tileColor: Colors.white,
              title: Text("Videos", style: GoogleFonts.sen(textStyle:
              TextStyle(fontWeight: FontWeight.w500, fontSize: 16),)),
              onTap: () {
                Get.offNamed(ScreenRoutes.videos);
              },
            ),
          ],
        ),
      ),
      body:
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Obx(() {
                  if (livematchController.liveMatches.isEmpty) {
                    return Center(
                        child: CircularProgressIndicator());
                  }
                  else {
                    final liveMatches = livematchController.liveMatches;
                    return Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Text(
                                      'Live Matches',
                                      style: GoogleFonts.sen(
                                        textStyle: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black),)
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: livematchController.num
                                            .value > 0
                                            ? () {
                                          livematchController.num.value--;
                                          livematchController.updateStatus(
                                              liveMatches[livematchController
                                                  .num.value]
                                          );
                                        }
                                            : null,
                                        icon: Icon(Icons.arrow_back),
                                        color: livematchController.num.value > 0
                                            ? Colors.black
                                            : Colors.grey,
                                      ),
                                      IconButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: livematchController.num
                                            .value <
                                            livematchController.liveMatches
                                                .length - 1
                                            ? () {
                                          livematchController.num.value++;
                                          livematchController.updateStatus(
                                              liveMatches[livematchController
                                                  .num.value]
                                          );
                                        }
                                            : null,
                                        icon: Icon(Icons.arrow_forward),
                                        color: livematchController.num.value <
                                            livematchController.liveMatches
                                                .length - 1
                                            ? Colors.black
                                            : Colors.grey,
                                      ),

                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Match ${livematchController.matchStatus}",
                                    style: GoogleFonts.sen(
                                      textStyle: TextStyle(
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: double.infinity,
                                child: Divider(

                                ),
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.transparent,
                                    child: Image.network(
                                      liveMatches[livematchController.num.value]
                                          .teamHomeBadge ?? '',
                                      fit: BoxFit.fill, errorBuilder: (BuildContext c,Object exception,StackTrace? stackTrace){
                                      return Image.asset("assets/errer.jfif");
                                    }
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Text(
                                      "${liveMatches[livematchController.num
                                          .value].matchHometeamScore == "" ?
                                          0 : liveMatches[livematchController.num
                                          .value].matchHometeamScore} : ${liveMatches[livematchController
                                          .num.value].matchAwayteamScore == "" ? 0 : liveMatches[livematchController
                                          .num.value].matchAwayteamScore}",
                                      style: GoogleFonts.sen(
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 24,
                                        ),)
                                  ),
                                  SizedBox(width: 20),
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.transparent,
                                    child: Image.network(
                                      liveMatches[livematchController.num.value]
                                          .teamAwayBadge ?? '',
                                      fit: BoxFit.fill, errorBuilder: (BuildContext c,Object exception,StackTrace? stackTrace){
                                      return Image.asset("assets/errer.jfif");
                                    }
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Expanded(child:
                                  Text(
                                    "${liveMatches[livematchController.num
                                        .value].matchHometeamName} ",
                                    style: GoogleFonts.sen(textStyle:
                                    TextStyle(fontWeight: FontWeight.w400,
                                        fontSize: 14),),
                                    textAlign: TextAlign.center,
                                  ),
                                  ),
                                  Text("Vs", style: GoogleFonts.sen(textStyle:
                                  TextStyle(fontWeight: FontWeight.w400,
                                      fontSize: 14),),),
                                  Expanded(child:
                                  Text(
                                    " ${liveMatches[livematchController.num
                                        .value].matchAwayteamName}",
                                    style: GoogleFonts.sen(textStyle:
                                    TextStyle(fontWeight: FontWeight.w400,
                                        fontSize: 14),),
                                    textAlign: TextAlign.center,
                                  ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Container(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // s.firstTeam=liveMatches[livematchController.num.value].matchHometeamName;
                                      // s.secondTeam=liveMatches[livematchController.num.value].matchAwayteamName;
                                      // s.firstTeamId=liveMatches[livematchController.num.value].matchHometeamId;
                                      // s.secondTeamId=liveMatches[livematchController.num.value].matchAwayteamId;
                                      // s.leagueId=liveMatches[livematchController.num.value].leagueId;
                                      // s.matchId=liveMatches[livematchController.num.value].matchId;

                                      s.selectedMatchModel = liveMatches[livematchController.num.value];
print("${s.selectedMatchModel?.matchId}");
                                       Get.offNamed(ScreenRoutes.detailview);
                                    },
                                    child: Text("View Details",
                                        style: GoogleFonts.sen(textStyle:
                                        TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14),
                                            color: Colors.white)),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(

                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                tileColor: Colors.white,
                                title: Text("All Matches",
                                    style: GoogleFonts.sen(textStyle: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16),)),
                              ),
                              Divider(),
                              ListView.builder(
                                  itemCount: livematchController.liveMatches
                                      .length != null ? 3 : 0,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    final match = livematchController
                                        .liveMatches[index];
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 3,
                                          vertical: 8.0),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 1),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                            color: Color(0xffc2c6cc),
                                          ),
                                          borderRadius: BorderRadius.circular(
                                              30),
                                        ),
                                        child: Column(
                                          children: [
                                            Center(child: Text(
                                              "${match.leagueName}",
                                              style: GoogleFonts.sen(
                                                textStyle: TextStyle(
                                                  color: Color(
                                                      0xffc2c6cc),),),),),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .spaceEvenly,
                                              children: [
                                                Text(
                                                  match.matchHometeamName !=
                                                      null &&
                                                      match.matchHometeamName!
                                                          .length > 7
                                                      ? match.matchHometeamName!
                                                      .substring(0, 7) + '...'
                                                      : match
                                                      .matchHometeamName ?? '',
                                                  style: GoogleFonts.sen(
                                                      textStyle: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight: FontWeight
                                                              .w500)),
                                                ),

                                                CircleAvatar(
                                                  backgroundColor: Colors
                                                      .transparent,
                                                  child: Image.network(
                                                    match.teamHomeBadge ?? '',
                                                      errorBuilder:
                                                          (BuildContext c,Object exception,StackTrace?
                                                      stackTrace){
                                                        return Image.asset("assets/errer.jfif");
                                                      }
                                                  ),
                                                ),
                                                Text(
                                                  "${match
                                                      .matchHometeamScore==""?0:match.matchHometeamScore} : ${match
                                                      .matchAwayteamScore==""?0:match.matchAwayteamScore}",
                                                ),
                                                CircleAvatar(
                                                  backgroundColor: Colors
                                                      .transparent,
                                                  child: Image.network(
                                                    match.teamAwayBadge ?? '',
                                                      errorBuilder: (BuildContext c,Object exception,StackTrace? stackTrace){
                                                    return Image.asset("assets/errer.jfif");
                                                  }
                                                  ),
                                                ),

                                                Text(
                                                    match.matchAwayteamName !=
                                                        null &&
                                                        match.matchAwayteamName!
                                                            .length > 7
                                                        ? match
                                                        .matchAwayteamName!
                                                        .substring(0, 7) + '...'
                                                        : match
                                                        .matchAwayteamName ??
                                                        '',
                                                    style: GoogleFonts.sen(
                                                      textStyle: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight: FontWeight
                                                              .w500),)
                                                ),

                                              ],),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 15),
                                child: InkWell(
                                  onTap: () {
                                    Get.offNamed(ScreenRoutes.liveMatch);
                                  },
                                  child: Row(
                                    children: [
                                      Text("Next", style: GoogleFonts.sen(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 14,
                                              color: Color(0xffC9CACC)
                                          ))),
                                      Icon(Icons.arrow_forward,
                                          color: Colors.blueGrey[100]),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                }),
              ),
              SizedBox(height: 10,),
              ListTile(
                tileColor: Colors.white,
                title: Text("Football Leagues",
                  style: GoogleFonts.sen(textStyle: TextStyle(
                    color: Colors.black, fontSize: 16,
                    fontWeight: FontWeight.w700,
                  )),
                ),
              ),
              Container(
                height: 0.1,
                decoration: BoxDecoration(
                  color: Color(0xffECECEC),
                ),
              ),
              Obx(() {
                return Column(
                  children: [
                    ListView.builder(
                      itemCount: livematchController.leagueList.length != 0
                          ? 3
                          : 0,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        var league = livematchController.leagueList[index];
                        print("Country: ${league.leagueName}, Logo URL: ${league
                            .leagueLogo}");
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 1.0),
                          child: ListTile(
                            tileColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                            title: Text("${league.leagueName}",
                              style: GoogleFonts.sen(textStyle: TextStyle(
                                color: Colors.black, fontSize: 14,
                                fontWeight: FontWeight.w700,
                              )),),
                            leading: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              child: Image.network(
                                  "${league.leagueLogo}", errorBuilder: (BuildContext c,Object exception,StackTrace? stackTrace){
                                return Image.asset("assets/errer.jfif");
                              }),
                            ),
                          ),
                        );
                      },
                    ),
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0,
                            vertical: 15),
                        child: InkWell(
                          onTap: () {
                            Get.offNamed(ScreenRoutes.league);
                          },
                          child: Row(
                            children: [
                              Text("Next",
                                  style: GoogleFonts.sen(textStyle: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14, color: Color(0xffC9CACC)
                                  ))),
                              Icon(Icons.arrow_forward,
                                  color: Colors.blueGrey[100]),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
