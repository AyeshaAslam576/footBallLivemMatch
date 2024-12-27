import 'package:countdown/controllers/leaguecontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../routes/route.dart';
class League extends StatelessWidget {
  const League({super.key});
  @override
  Widget build(BuildContext context) {
     final LeagueController leagueController=Get.put(LeagueController());
    return Scaffold(
      backgroundColor: Color(0xffECECEC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
     //     padding: EdgeInsets.symmetric(vertical: 3),
          height: 30,
          child: TextField(

            decoration:InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 4),
                hintText:"Search Leagues....",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),

              ),
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (value){
              leagueController.filterLeagues(value);
            },
          ),
        ),
        actions: [
          CircleAvatar(
            child: Icon(Icons.person),
          )
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 20),
        child: Column(
          children: [
            ListTile(
              tileColor: Colors.white,
              title: Text("Football Leagues",style: GoogleFonts.sen(textStyle: TextStyle(
                color: Colors.black,fontSize: 16,
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
              return Expanded(
                child: ListView.builder(
                  itemCount: leagueController.filteredLeagues.length,
                  itemBuilder: (context, index) {
                    var league= leagueController.filteredLeagues[index];
                    print("Country: ${league.leagueName}, Logo URL: ${league.leagueLogo}");
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1.0),
                      child: ListTile(
                        tileColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        title: Text("${league.leagueName}",style: GoogleFonts.sen(textStyle: TextStyle(
                          color: Colors.black,fontSize: 14,
                          fontWeight: FontWeight.w700,
                        )),),
                        leading: CircleAvatar(
                          child: Image.network("${league.leagueLogo}",  errorBuilder:
                              (BuildContext c,Object exception,StackTrace?
                          stackTrace){
                            return Image.asset("assets/errer.jfif");
                          }),
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}