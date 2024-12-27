import 'package:countdown/controllers/livematch_controller.dart';
import 'package:countdown/models/livematch_model.dart';
import 'package:countdown/routes/route.dart';
import 'package:countdown/singleton/singleton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Livematch extends StatelessWidget {
  const Livematch({super.key});

  @override
  Widget build(BuildContext context) {
    final LivematchController livematchController = Get.put(
        LivematchController());
    SingleTon s = SingleTon();
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
                Get.offNamed(ScreenRoutes.home);
              },
            ),
            SizedBox(height: 10,),
            ListTile(
              tileColor: Colors.white,
              title: Text("All Matches", style: GoogleFonts.sen(textStyle:
              TextStyle(fontWeight: FontWeight.w500, fontSize: 16),)),
              onTap: () {
                Get.back();
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
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 10.0, vertical: 5),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              width: double.infinity,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: livematchController.selectedValue.value,
                  onChanged: (String? newValue) {
                    livematchController.selectedValue.value = newValue!.trim();
                    livematchController.filteredMatchesList.value = livematchController.filterMatches(livematchController.selectedValue.value);
                    Get.back();
                  },
                  items: livematchController.dropdownItems.map((String matchValue) {
                    return DropdownMenuItem<String>(
                      value: matchValue,
                      onTap: () {

                      },
                      child: Text(matchValue),
                    );
                  }).toList(),
                ),

              ),
            ),
          ),

          Obx(() {
            if (livematchController.filteredMatchesList.isEmpty) {
              return Center(
                  child: CircularProgressIndicator());
            }
            else {
              // final liveMatches = livematchController.liveMatches;
              return
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListView.builder(
                          itemCount: livematchController.filteredMatchesList.length,
                          itemBuilder: (context, index) {
                            final match = livematchController
                                .filteredMatchesList[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 3,
                                  vertical: 8.0),
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 2,),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Color(0xffc2c6cc),
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Column(
                                  children: [
                                    Center(child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                      child: Text("${match.leagueName}",
                                        style: TextStyle(
                                          color: Color(0xffc2c6cc),),),
                                    ),),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0),
                                            child: Text(
                                              match.matchHometeamName !=
                                                  null &&
                                                  match.matchHometeamName!
                                                      .length > 7
                                                  ? match.matchHometeamName!
                                                  .substring(0, 7) + '...'
                                                  : match.matchHometeamName ??
                                                  '',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                      
                                        CircleAvatar(
                                          child: Image.network(
                                            match.teamHomeBadge ?? '',
                                            errorBuilder:
                                                (BuildContext c,
                                                Object exception, StackTrace?
                                            stackTrace) {
                                              return Image.asset(
                                                  "assets/errer.jfif");
                                            },
                                          ),
                                        ),
                                        Expanded(
                                          child: Center(
                                            child: Text(
                                              "${match.matchHometeamScore ==
                                                  "" ? 0 : match
                                                  .matchHometeamScore} : ${match
                                                  .matchAwayteamScore == ""
                                                  ? 0
                                                  : match
                                                  .matchAwayteamScore}",
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                        CircleAvatar(
                                          child: Image.network(
                                              match.teamAwayBadge ?? '',
                                              errorBuilder:
                                                  (BuildContext c,
                                                  Object exception,
                                                  StackTrace?
                                                  stackTrace) {
                                                return Image.asset(
                                                    "assets/errer.jfif");
                                              }
                                          ),
                                        ),
                                        SizedBox(width: 8,),
                                        Expanded(
                                          child: Text(
                                            match.matchAwayteamName != null &&
                                                match.matchAwayteamName!
                                                    .length > 7
                                                ? match.matchAwayteamName!
                                                .substring(0, 7) + '...'
                                                : match.matchAwayteamName ??
                                                '',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                );
            }
          }),
        ],
      ),
    );
  }
}
