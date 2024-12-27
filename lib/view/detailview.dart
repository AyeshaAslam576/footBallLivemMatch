import 'package:countdown/controllers/detailviewcontroller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../routes/route.dart';
import 'package:get/get.dart';
import '../singleton/singleton.dart';
class Detailview extends StatelessWidget {
  Detailview({super.key});
  SingleTon s = SingleTon();
  @override
  Widget build(BuildContext context) {
    final Detailviewcontroller detailviewcontroller = Get.put(
        Detailviewcontroller());
    return Scaffold(
      appBar: AppBar(
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
            SizedBox(height: 10,),
            ListTile(
              tileColor: Colors.white,
              title: Text("SUmmary", style: GoogleFonts.sen(textStyle:
              TextStyle(fontWeight: FontWeight.w500, fontSize: 16),)),
              onTap: () {
                Get.offNamed(ScreenRoutes.summary);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
                   Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 10, vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),

                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.green,
                            child: Image.network(
                              "${s.selectedMatchModel?.leagueLogo}",
                              fit: BoxFit.fill,
                              errorBuilder: (BuildContext c,
                                  Object exception,
                                  StackTrace? stackTrace) {
                                return Container(
                                  color: Colors.grey,
                                );
                              },
                            ),
                          ),
                          SizedBox(width: 8,),
                          Container(
                            child: Expanded(
                              child: Text(
                                "${s.selectedMatchModel?.leagueName}",
                                style: GoogleFonts.sen(textStyle: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 16)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("${detailviewcontroller.matchformattedDate} in ",
                            style: GoogleFonts.sen(textStyle: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: Color(0xffA4A4A4))),),
                          Text("${s.selectedMatchModel?.matchTime}",
                            style: GoogleFonts.sen(textStyle:
                            TextStyle(fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: Color(0xff2974FF))),)
                        ],
                      ),
                      SizedBox(height: 10,),

                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  child: Image.network(
                                    "${s.selectedMatchModel?.teamHomeBadge}",
                                    fit: BoxFit.fill,
                                    errorBuilder: (BuildContext c,
                                        Object exception,
                                        StackTrace? stackTrace) {
                                      return Image.asset(
                                        "assets/errer.jfif", fit: BoxFit.fill,);
                                    },
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  "${s.selectedMatchModel?.matchHometeamName}",
                                  style: GoogleFonts.sen(textStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12)),)
                              ],
                            ),
                          ),
                          Center(
                            child: Row(
                              children: [
                                Text(
                                  "${s.selectedMatchModel?.matchHometeamScore ==
                                      "" ? 0 : s.selectedMatchModel
                                      ?.matchHometeamScore}:"
                                      "${s.selectedMatchModel
                                      ?.matchAwayteamScore == "" ? 0 : s
                                      .selectedMatchModel?.matchAwayteamScore}",
                                  style: GoogleFonts.sen(textStyle:
                                  TextStyle(fontWeight: FontWeight.w600,
                                      fontSize: 16)),),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  child: Image.network(
                                    "${s.selectedMatchModel?.teamAwayBadge}",
                                    fit: BoxFit.fill,
                                    errorBuilder: (BuildContext c,
                                        Object exception,
                                        StackTrace? stackTrace) {
                                      return Container(
                                        color: Colors.grey,
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  "${s.selectedMatchModel?.matchAwayteamName}",
                                  style: GoogleFonts.sen(textStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12)),)
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Referee:", style: GoogleFonts.sen(textStyle:
                          TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 14)),),
                          Text(
                            s.selectedMatchModel?.matchReferee == ""
                                ? "${s.selectedMatchModel?.matchReferee}"
                                : "N/A", style: GoogleFonts.sen(textStyle:
                          TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 12)),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Obx(() {
                        return detailviewcontroller.predictionsList.isEmpty
                            ? Center(child: Text("Predictions List is empty", style: GoogleFonts.sen(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12)),))
                            : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "LCF ${detailviewcontroller.predictionsList.first
                                  .probHW == ""
                                  ? 0
                                  : detailviewcontroller.predictionsList.first
                                  .probHW}%", style: GoogleFonts.sen(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12)),),
                            Text(
                              "Draw ${detailviewcontroller.predictionsList.first
                                  .probD == ""
                                  ? 0
                                  : detailviewcontroller.predictionsList.first
                                  .probD}%", style: GoogleFonts.sen(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12)),),
                            Text(
                              "Win ${detailviewcontroller.predictionsList.first
                                  .probAW == ""
                                  ? 0
                                  : detailviewcontroller.predictionsList.first
                                  .probAW}%", style: GoogleFonts.sen(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12)),),
                          ],
                        );
                      }),
                    ],
                  ),
                ),
              ),

              Obx(() {
                return Container(
                  decoration: BoxDecoration(
                    color: Color(0xffF8F8F8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 3.0),
                                    child: OutlinedButton(
                                      onPressed: () {
                                        detailviewcontroller.isHometeamSelected
                                            .value = false;
                                      }, child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 2.0, vertical: 5),
                                      child: Text("OverAll".toUpperCase(),style: GoogleFonts.sen(textStyle:TextStyle(color: Color(0xff2974FF)

                                      , fontSize: 10,fontWeight: FontWeight.w700
                                      ),)),
                                    ), style: OutlinedButton.styleFrom(
                                      side: BorderSide(color: Color(0xff2974FF)),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 3.0),
                                    child: OutlinedButton(
                                      onPressed: () {
                                        detailviewcontroller.isHometeamSelected
                                            .value = true;
                                      }, child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 2.0, vertical: 5),
                                      child: Text("${s.selectedMatchModel
                                          ?.matchHometeamName} - Home"
                                          .toUpperCase(),style: GoogleFonts.sen(textStyle:TextStyle(color: Color(0xff2974FF)

                                          , fontSize: 10,fontWeight: FontWeight.w700
                                      ),)),
                                    ), style: OutlinedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 3),
                                      side: BorderSide(color: Color(0xff2974FF)),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            20),
                                      ),
                                    ),),
                                  ),
                                ),

                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 3.0),
                                    child:
                                    OutlinedButton(
                                      onPressed: () {
                                        detailviewcontroller.isHometeamSelected
                                            .value = false;
                                      },

                                      child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 2.0, vertical: 5),
                                      child: Text("${s.selectedMatchModel
                                          ?.matchAwayteamName} - AWAY".toUpperCase(),style: GoogleFonts.sen(textStyle:TextStyle(color: Color(0xff2974FF)

                                          , fontSize: 10,fontWeight: FontWeight.w700
                                      ),)),
                                    ), style: OutlinedButton.styleFrom(
                                      side: BorderSide(color: Color(0xff2974FF)),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 3),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            20),
                                      ),
                                    ),),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        tileColor: Colors.grey,
                        title: Text("Last Matches: ${s.selectedMatchModel
                            ?.matchHometeamName}"),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[60],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            detailviewcontroller.firstTeamLastResultsList.value.isEmpty
                                ? SizedBox()
                                : ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: detailviewcontroller.firstteamlistLength.value,
                                itemBuilder: (context, index) {
                                  var item = detailviewcontroller
                                      .firstTeamLastResultsList.value[index];
                                  detailviewcontroller.scorestatus(item);
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 1),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      color: Colors.white,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              CircleAvatar(
                                               radius: 10,
                                                backgroundColor: Colors.green,
                                                child: Image.network(
                                                  "${item.leagueLogo}",
                                                  fit: BoxFit.fill,
                                                  errorBuilder: (
                                                      BuildContext c,
                                                      Object exception,
                                                      StackTrace? stackTrace) {
                                                    return Image.asset(
                                                      "assets/errer.jfif",
                                                      fit: BoxFit.fill,);
                                                  },
                                                ),
                                              ),
                                              SizedBox(width: 10,),
                                              Container(
                                                child: Expanded(
                                                  child: Text(
                                                      "${item
                                                          .leagueName}",style:
                                                  GoogleFonts.sen(textStyle:
                                                  TextStyle(fontWeight: FontWeight.w700,fontSize: 12)),),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          Row(
                                            children: [
                                              Text("${item.matchDate}"
                                                , style: GoogleFonts.sen(
                                                    textStyle: TextStyle(
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: 10,
                                                    )),
                                              ),
                                              SizedBox(width: 10,),
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius
                                                            .circular(20),
                                                        color: detailviewcontroller
                                                            .isHometeamSelected
                                                            .value == true
                                                            ? Colors.grey[50]
                                                            : Colors
                                                            .transparent,
                                                      ),
                                                      child: Row(
                                                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          CircleAvatar(
                                                            radius: 10,
                                                            backgroundColor: Colors
                                                                .green,
                                                            child: Image
                                                                .network(
                                                              "${item
                                                                  .teamHomeBadge}",
                                                              fit: BoxFit.fill,
                                                              errorBuilder: (
                                                                  BuildContext c,
                                                                  Object exception,
                                                                  StackTrace? stackTrace) {
                                                                return Container(
                                                                  color: Colors.grey,
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                          SizedBox(width: 10,),
                                                          Container(
                                                            child: Expanded(
                                                              child: Text("${item
                                                                  .matchHometeamName}", style: GoogleFonts.sen(
                                                                  textStyle: TextStyle(
                                                                    fontWeight: FontWeight.w400,
                                                                    fontSize: 10,
                                                                  )),),
                                                            ),
                                                          ),

                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(height: 10,),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius
                                                            .circular(20),
                                                        color: detailviewcontroller
                                                            .isHometeamSelected
                                                            .value == true
                                                            ? Colors.grey[50]
                                                            : Colors
                                                            .transparent,
                                                      ),
                                                      child: Row(
                                                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          CircleAvatar(
                                                            radius: 10,
                                                            child: Image
                                                                .network(
                                                              "${item
                                                                  .teamAwayBadge}",
                                                              fit: BoxFit.fill,
                                                              errorBuilder: (
                                                                  BuildContext c,
                                                                  Object exception,
                                                                  StackTrace? stackTrace) {
                                                                return Container(
                                                                  color: Colors.grey,
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                          SizedBox(width: 10,),
                                                          Container(
                                                            child: Expanded(
                                                              child: Text("${item
                                                                  .matchAwayteamName}"
                                                                , style: GoogleFonts.sen(
                                                                    textStyle: TextStyle(
                                                                      fontWeight: FontWeight.w400,
                                                                      fontSize: 10,
                                                                    )),
                                                              ),
                                                            ),
                                                          ),

                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  Text("${item.matchHometeamScore==""?0:item.matchHometeamScore}",
                                                  style: GoogleFonts.sen(
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 11,
                                              )),
                                                  ),
                                                  SizedBox(height: 10,),
                                                  Text("${item.matchAwayteamScore==""?0:item.matchAwayteamScore}", style: GoogleFonts.sen(
                                                      textStyle: TextStyle(
                                                        fontWeight: FontWeight.w700,
                                                        fontSize: 12,
                                                      )),),
                                                ],
                                              ),
                                              SizedBox(width: 10,),
                                              CircleAvatar(
                                                radius: 15,
                                                child: Text("${detailviewcontroller.scoreStatushomeText.value}",style: TextStyle(color:Colors.white),),
            backgroundColor:  detailviewcontroller.getBackgroundColor("${detailviewcontroller.scoreStatushomeText.value}"),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 3),
                              child: InkWell(
                                onTap: () {
                                  detailviewcontroller.firstTeamIncreaseLength();
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  color: Colors.white,
                                  child: Row(
                                    children: [
                                      Text("Show more", style: GoogleFonts.sen(
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
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        tileColor: Colors.grey,
                        title: Text("Last Matches: ${s.selectedMatchModel
                            ?.matchAwayteamName}",
                 style: GoogleFonts.sen(
                textStyle: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 11,
                )),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[60],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            detailviewcontroller.secondTeamLastResultsList.value.isEmpty
                                ? SizedBox()
                                : ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: detailviewcontroller.secondTeamlistLength.value,
                                itemBuilder: (context, index) {
                                  var item = detailviewcontroller
                                      .secondTeamLastResultsList.value[index];
                                  detailviewcontroller.scorestatusAway(item);
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 1),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      color: Colors.white,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              CircleAvatar(
                                                radius: 10,
                                                backgroundColor: Colors.green,
                                                child: Image.network(
                                                  "${item.leagueLogo}",
                                                  fit: BoxFit.fill,
                                                  errorBuilder: (
                                                      BuildContext c,
                                                      Object exception,
                                                      StackTrace? stackTrace) {
                                                    return Container(
                                                      color: Colors.grey,
                                                    );
                                                  },
                                                ),
                                              ),
                                              SizedBox(width: 10,),
                                              Container(
                                                child: Expanded(
                                                  child: Text(
                                                      "${item
                                                          .leagueName}", style: GoogleFonts.sen(
                                                      textStyle: TextStyle(
                                                        fontWeight: FontWeight.w700,
                                                        fontSize: 12,
                                                      )),),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          Row(
                                            children: [
                                              Text("${item.matchDate}"
                                                , style: GoogleFonts.sen(
                                                    textStyle: TextStyle(
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: 10,
                                                    )),
                                              ),
                                              SizedBox(width: 10,),
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius
                                                            .circular(20),
                                                        color: detailviewcontroller
                                                            .isHometeamSelected
                                                            .value == true
                                                            ? Colors.grey[50]
                                                            : Colors
                                                            .transparent,
                                                      ),
                                                      child: Row(
                                                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          CircleAvatar(
                                                            radius: 10,
                                                            backgroundColor: Colors
                                                                .green,
                                                            child: Image
                                                                .network(
                                                              "${item
                                                                  .teamHomeBadge}",
                                                              fit: BoxFit.fill,
                                                              errorBuilder: (
                                                                  BuildContext c,
                                                                  Object exception,
                                                                  StackTrace? stackTrace) {
                                                                return Container(
                                                                  color: Colors.grey,
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                          SizedBox(width: 10,),
                                                          Container(
                                                            child: Expanded(
                                                              child: Text("${item
                                                                  .matchHometeamName}"
                                                                , style: GoogleFonts.sen(
                                                                    textStyle: TextStyle(
                                                                      fontWeight: FontWeight.w400,
                                                                      fontSize: 10,
                                                                    )),
                                                              ),
                                                            ),
                                                          ),

                                                        ],
                                               ),
                                                    ),
                                                    SizedBox(height: 10,),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius
                                                            .circular(20),
                                                        color: detailviewcontroller
                                                            .isHometeamSelected
                                                            .value == true
                                                            ? Colors.grey[50]
                                                            : Colors
                                                            .transparent,
                                                      ),
                                                      child: Row(
                                                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          CircleAvatar(
                                                            radius: 10,
                                                            child: Image
                                                                .network(
                                                              "${item
                                                                  .teamAwayBadge}",
                                                              fit: BoxFit.fill,
                                                              errorBuilder: (
                                                                  BuildContext c,
                                                                  Object exception,
                                                                  StackTrace? stackTrace) {
                                                                return Container(
                                                                  color: Colors.grey,
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                          SizedBox(width: 10,),
                                                          Container(
                                                            child: Expanded(
                                                              child: Text("${item
                                                                  .matchAwayteamName}"
                                                                , style: GoogleFonts.sen(
                                                                    textStyle: TextStyle(
                                                                      fontWeight: FontWeight.w400,
                                                                      fontSize: 10,
                                                                    )),
                                                              ),
                                                            ),
                                                          ),

                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  Text("${item.matchHometeamScore==""?0:item.matchHometeamScore}"
                                                    , style: GoogleFonts.sen(
                                                        textStyle: TextStyle(
                                                          fontWeight: FontWeight.w700,
                                                          fontSize: 10,
                                                        )),
                                                  ),
                                                  SizedBox(height: 10,),
                                                  Text("${item.matchAwayteamScore==""?0:item.matchAwayteamScore}"
                                                    , style: GoogleFonts.sen(
                                                        textStyle: TextStyle(
                                                          fontWeight: FontWeight.w700,
                                                          fontSize: 10,
                                                        )),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(width: 10,),
                                              CircleAvatar(
                                                radius: 15,
                                                child: Text("${detailviewcontroller.scoreStatusawayText.value}",style: TextStyle(color:Colors.white),),
                                                backgroundColor: detailviewcontroller.getBackgroundColor("${detailviewcontroller.scoreStatusawayText.value}"),
                                              )
                                            ],
                                          ),

                                        ],
                                      ),
                                    ),
                                  );
                                }),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 3),
                              child: InkWell(
                                onTap: () {
                                  detailviewcontroller.secondTeamIncreaseLength();
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  color: Colors.white,
                                  child: Row(
                                    children: [
                                      Text("Show more", style: GoogleFonts.sen(
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
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        tileColor: Colors.grey,
                        title: Text("Last Matches: Head to head", style: GoogleFonts.sen(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 11,
                            )),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[60],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            detailviewcontroller.firstTeamVssecondTeamLastResultsList.value.isEmpty
                                ? SizedBox()
                                : ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: detailviewcontroller.firstTeamvssecondlistLength.value,
                                itemBuilder: (context, index) {
                                  var item = detailviewcontroller
                                      .firstTeamVssecondTeamLastResultsList.value[index];
                                  detailviewcontroller.scorestatusHeadtohead(item);
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 1),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      color: Colors.white,
                                      child: Column(

                                        children: [
                                          Center(
                                            child: Row(

                                              children: [
                                                CircleAvatar(
                                                  radius: 10,
                                                  backgroundColor: Colors.green,
                                                  child: Image.network(
                                                    "${item.leagueLogo}",
                                                    fit: BoxFit.fill,
                                                    errorBuilder: (
                                                        BuildContext c,
                                                        Object exception,
                                                        StackTrace? stackTrace) {
                                                      return Container(
                                                        color: Colors.grey,
                                                      );
                                                    },
                                                  ),
                                                ),
                                                SizedBox(width: 10,),
                                                Container(
                                                  child: Expanded(
                                                    child: Text(
                                                        "${item
                                                            .leagueName}",
                                                      style: GoogleFonts.sen(
                                                          textStyle: TextStyle(
                                                              fontWeight: FontWeight.w700,
                                                              fontSize: 12,

                                                          )),
                                                  ),
                                                )
                                                )],
                                            ),
                                          ),
                                          SizedBox(height: 10,),
                                          Row(
                                            children: [
                                              Text("${item.matchDate}",
                                                style: GoogleFonts.sen(
                                                    textStyle: TextStyle(
                                                        fontWeight: FontWeight.w700,
                                                        fontSize: 12,

                                                    )),
                                              ),
                                              SizedBox(width: 10,),
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius
                                                            .circular(20),
                                                        color: detailviewcontroller
                                                            .isHometeamSelected
                                                            .value == true
                                                            ? Colors.grey[50]
                                                            : Colors
                                                            .transparent,
                                                      ),
                                                      child: Row(
                                                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          CircleAvatar(
                                                            radius: 10,
                                                            backgroundColor: Colors
                                                                .green,
                                                            child: Image
                                                                .network(
                                                              "${item
                                                                  .teamHomeBadge}",
                                                              fit: BoxFit.fill,
                                                              errorBuilder: (
                                                                  BuildContext c,
                                                                  Object exception,
                                                                  StackTrace? stackTrace) {
                                                                return Container(
                                                                  color: Colors.grey,
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                          SizedBox(width: 10,),
                                                          Container(
                                                            child: Expanded(
                                                              child: Text("${item
                                                                  .matchHometeamName}"
                                                                  ,style: GoogleFonts.sen(
                                                                  textStyle: TextStyle(
                                                                  fontWeight: FontWeight.w400,
                                                                  fontSize: 10,

                                                              )),
                                                              ),
                                                            ),
                                                          ),

                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(height: 10,),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius
                                                            .circular(20),
                                                        color: detailviewcontroller
                                                            .isHometeamSelected
                                                            .value == true
                                                            ? Colors.grey[50]
                                                            : Colors
                                                            .transparent,
                                                      ),
                                                      child: Row(
                                                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          CircleAvatar(
                                                            radius: 10,
                                                            child: Image
                                                                .network(
                                                              "${item
                                                                  .teamAwayBadge}",
                                                              fit: BoxFit.fill,
                                                              errorBuilder: (
                                                                  BuildContext c,
                                                                  Object exception,
                                                                  StackTrace? stackTrace) {
                                                                return Container(
                                                                  color: Colors.grey,
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                          SizedBox(width: 10,),
                                                          Container(
                                                            child: Expanded(
                                                              child: Text("${item
                                                                  .matchAwayteamName}"
                                                              , style: GoogleFonts.sen(
                                                                    textStyle: TextStyle(
                                                                        fontWeight: FontWeight.w400,
                                                                        fontSize: 10,

                                                                    )),
                                                              ),
                                                            ),
                                                          ),

                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  Text("${item.matchHometeamScore==""?0:item.matchHometeamScore}"
                                             , style: GoogleFonts.sen(
                                              textStyle: TextStyle(
                                              fontWeight: FontWeight.w600,
                                                  fontSize: 12,

                                              )),
                                                  ),
                                                  SizedBox(height: 10,),
                                                  Text("${item.matchAwayteamScore==""?0:item.matchAwayteamScore}"
                                                     , style: GoogleFonts.sen(
                                                      textStyle: TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 12,
                                                  )),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(width: 10,),
                                              CircleAvatar(
                                                radius: 15,
                                                child: Text("${detailviewcontroller.scoreStatush2hText.value}",style: TextStyle(color:Colors.white),),
                                                backgroundColor:  detailviewcontroller.getBackgroundColor("${detailviewcontroller.scoreStatush2hText.value}"),
                                              )
                                            ],
                                          ),
  ],
                                      ),
                                    ),
                                  );
                                }),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 3),
                              child: InkWell(
                                onTap: () {
                                  detailviewcontroller.h2hTeamIncreaseLength();
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  color: Colors.white,
                                  child: Row(
                                    children: [
                                      Text("Show more",
                                          style: GoogleFonts.sen(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 14,
                                              color: Color(0xffC9CACC)
                                          )),
                                      ),
                                      Icon(Icons.arrow_forward,
                                          color: Colors.blueGrey[100]),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
