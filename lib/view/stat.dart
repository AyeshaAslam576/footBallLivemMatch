import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/stat_controller.dart';
import '../routes/route.dart';
class Stats extends StatelessWidget {
  const Stats({super.key});
  @override
  Widget build(BuildContext context) {
    final StatController statcontroller = Get.put(StatController());
    return Scaffold(
      backgroundColor: const Color(0xffECECEC),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
          ),
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
                image: DecorationImage(image: AssetImage("assets/ft2.jpg"),fit: BoxFit.fill),
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
                Get.offNamed(ScreenRoutes.videos);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                height: 50,
                child:Obx(() {
                  if (statcontroller.leagues.isEmpty) {
                    return const CircularProgressIndicator();
                  }
                return  ListView.builder(
                    itemCount: statcontroller.leagues.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 1),
                        child: TextButton(
                          style: TextButton.styleFrom(backgroundColor: Colors.white),
                          onPressed: () {
                            statcontroller.getLeagueId(statcontroller.leagues[index].leagueId ?? '');
                            statcontroller.fetchStandings();
                          },
                          child: Text(
                            "${statcontroller.leagues[index].leagueName}",
                            style:GoogleFonts.sen(textStyle:  TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black),)
                          ),
                        ),
                      );
                    }
                );
                }),
                       ),
              const SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children:  [
                    Padding(
                      padding: const EdgeInsets.only(left: 80.0),
                      child: Text("Team",
                          style: TextStyle(color:Color(0xffA4A4A4),fontWeight: FontWeight.w700,fontSize: 12),
                      ),
                    ),
                    Spacer(),
                    Container(width: 20, child: Text("GP",style: GoogleFonts.sen(textStyle: TextStyle(color:Color(0xffA4A4A4),fontWeight: FontWeight.w700,fontSize: 12),),
                    )
                    ),
                    SizedBox(width: 5,),
                    Container( width: 20,child: Text("W", style: GoogleFonts.sen(textStyle: TextStyle(color:Color(0xffA4A4A4),fontWeight: FontWeight.w700,fontSize: 12),)),),
                    SizedBox(width: 5,),
                    Container( width: 20,child: Text("D",style: GoogleFonts.sen(textStyle: TextStyle(color:Color(0xffA4A4A4),fontWeight: FontWeight.w700,fontSize: 12),)),),
                    SizedBox(width: 5,),
                    Container( width: 20,child: Text("L", style: GoogleFonts.sen(textStyle: TextStyle(color:Color(0xffA4A4A4),fontWeight: FontWeight.w700,fontSize: 12),)),),
                    SizedBox(width: 5,),
                    Container( width: 25,child: Text("F/A", style: GoogleFonts.sen(textStyle: TextStyle(color:Color(0xffA4A4A4),fontWeight: FontWeight.w700,fontSize: 12),)),),
                    SizedBox(width: 7,),
                    Container( width: 20,child: Text("P", style: GoogleFonts.sen(textStyle: TextStyle(color:Color(0xffA4A4A4),fontWeight: FontWeight.w700,fontSize: 12),)),),
                    SizedBox(width: 5,),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Obx(() {
                if (statcontroller.leagues.length==0) {
                  return const CircularProgressIndicator();
                }
                return ListView.builder(
                  itemCount: statcontroller.standingsList.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final standings = statcontroller.standingsList[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Container(

                                width: 20,
                                child: Text(
                                  "${index + 1}.",
                                  style: GoogleFonts.sen(textStyle: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12
                                  )
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 2,),
                            CircleAvatar(
                              backgroundColor: Colors.black12,
                              child:
                              Image.network(standings.teamBadge ?? '',
                                  errorBuilder: (BuildContext c,Object exception,StackTrace? stackTrace){
                                    return Image.asset("assets/errer.jfif");
                                  }
                              ),

                            ),
                            SizedBox(width: 5,),
                            Container(
                              child:          Text(
                                standings.teamName != null && standings.teamName!.length > 7
                                    ? standings.teamName!.substring(0, 7) + '...'
                                    : standings.teamName ?? '',
                                style: GoogleFonts.sen(textStyle: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12
                                )
                                ),
                              ),
                            ),
                            Spacer(),
                            Container(
                              width: 20,
                              child: Text(
                               "${ standings.overallLeaguePayed ?? "0"}",
                                style: GoogleFonts.sen(textStyle: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12
                                )
                                ),
                              ),
                            ),
                            SizedBox(width: 5,),
                            Container(
                              width: 20,
                              child: Text(
                                "${standings.overallLeagueW ?? "0"}",
                                style: GoogleFonts.sen(textStyle: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12
                                )
                                ),
                              ),
                            ),
                            SizedBox(width: 5,),
                            Container(
                              width: 20,
                              child: Text(
                                "${standings.overallLeagueD ?? "0"}",
                                style: GoogleFonts.sen(textStyle: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12
                                )
                                ),
                              ),
                            ),
                            SizedBox(width: 5,),
                            Container(
                              width: 20,
                              child: Text(
                                "${standings.overallLeagueL ?? "0"}",
                                style: GoogleFonts.sen(textStyle: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12
                                )
                                ),
                              ),
                            ),
                            SizedBox(width: 5,),
                            Container(
                              width: 30,
                              child: Text(
                                "${standings.overallLeagueGF}/${standings.overallLeagueGA}",
                                style: GoogleFonts.sen(textStyle: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12
                                )
                                ),
                              ),
                            ),
                            SizedBox(width: 7,),
                            Container(
                              width: 20,
                              child: Text(
                              "${standings.overallLeaguePTS ?? "0"}",
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
              const SizedBox(height: 5),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      color: Colors.white,
                      child: Column(

                        children: [
                       Padding(
                         padding: const EdgeInsets.only(left: 20.0,bottom: 25,top: 10),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             Text("Top Players", style: GoogleFonts.sen(textStyle: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,color: Colors.grey
                                  )
                                  ),),
                           ],
                         ),
                       ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Name",style: GoogleFonts.sen(fontSize: 14,fontWeight: FontWeight.w400),),
                                Text("Goals"),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Obx(() {
                            if (statcontroller.playerList.isEmpty) {
                              return const CircularProgressIndicator();
                            }
                            return ListView.builder(
                              itemCount: statcontroller.playerList.length,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final player = statcontroller.playerList[index];
                                return ListTile(
                                  title: Text("${player.playerName}", style: GoogleFonts.sen(textStyle: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12
                                  )
                                  ),),
                                  subtitle: Text("${player.teamName} ", style: GoogleFonts.sen(textStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xffA4A4A4),
                                      fontSize: 11
                                  )
                                  ),),
                                  leading:   CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    child:Image.network("${player.playerImage}",fit: BoxFit.fill,
                                        errorBuilder: (BuildContext c,Object exception,StackTrace? stackTrace){
                                          return Container(
                                            color: Colors.grey,
                                          );
                                        }
                                    ),
                                  ),

                                  trailing: Text("${player.playerGoals==""?0:player.playerGoals}", style: GoogleFonts.sen(textStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11
                                  )
                                  ),),
                                );
                              },
                            );
                          }),
                        ],
                      ),
                    )
                       ],
          ),
        ),
      ),
    );
  }
}