import 'package:countdown/controllers/summarycontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../routes/route.dart';
class Summary extends StatelessWidget {
  const Summary({super.key});
  @override
  Widget build(BuildContext context) {
    final Summarycontroller summarycontroller=Get.put(Summarycontroller());
    return Scaffold(
      appBar: AppBar(),
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
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius:12,
                        child: Image.asset("assets/errer.jfif"),
                      ),
                      Text("League Name"
                        ,style: GoogleFonts.sen(textStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w700)),
                      ),
                      Text("League Name"
                        ,style: GoogleFonts.sen(textStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w700)),
                      ),
                      CircleAvatar(
                        radius:12,
                        child: Image.asset("assets/errer.jfif"),
                      ),
                    ],
                  ),
                  Divider()
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius:12,
                        child: Image.asset("assets/errer.jfif"),
                      ),
                      Text("League Name"
                        ,style: GoogleFonts.sen(textStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w700)),
                      ),
                      Text("League Name"
                        ,style: GoogleFonts.sen(textStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w700)),
                      ),
                      CircleAvatar(
                        radius:12,
                        child: Image.asset("assets/errer.jfif"),
                      ),
                    ],
                  ),
                  Divider()
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
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:step_progress_indicator/step_progress_indicator.dart';
// import 'package:timeline_tile/timeline_tile.dart';
//
// class Summary extends StatelessWidget {
//   const Summary({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Match Summary"),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//           child: Column(
//             children: [
//               // Match Stats Section
//               Container(
//                 padding: EdgeInsets.symmetric(vertical: 10.0),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Column(
//                           children: [
//                             CircleAvatar(
//                               radius: 12,
//                               backgroundImage: AssetImage("assets/errer.jfif"),
//                             ),
//                             SizedBox(height: 4),
//                             Text(
//                               "Leicester",
//                               style: GoogleFonts.sen(
//                                 textStyle: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w700,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Column(
//                           children: [
//                             Text(
//                               "Match Stats",
//                               style: GoogleFonts.sen(
//                                 textStyle: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w700,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Column(
//                           children: [
//                             CircleAvatar(
//                               radius: 12,
//                               backgroundImage: AssetImage("assets/errer.jfif"),
//                             ),
//                             SizedBox(height: 4),
//                             Text(
//                               "Arsenal",
//                               style: GoogleFonts.sen(
//                                 textStyle: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w700,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 10),
//                     Divider(),
//                     // Match Stats with Progress Indicators
//                     buildStatRow("Possession", 54, 46, Colors.blue, Colors.red),
//                     buildStatRow("Shots", 18, 14, Colors.green, Colors.orange),
//                     buildStatRow("Shots on Target", 7, 5, Colors.purple, Colors.pink),
//                     buildStatRow("Corners", 2, 6, Colors.cyan, Colors.yellow),
//                     buildStatRow("Yellow Cards", 3, 1, Colors.yellow, Colors.grey),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 20),
//               // Event Timeline Section
//               Container(
//                 padding: EdgeInsets.symmetric(vertical: 10.0),
//                 child: Column(
//                   children: [
//                     buildTimelineTile("J. Justin", "Goal", Icons.sports_soccer),
//                     buildTimelineTile("V. Tielemans", "Yellow Card", Icons.warning),
//                     buildTimelineTile("H. Barnes", "Substitution", Icons.swap_horiz),
//                     buildTimelineTile("H. Barnes", "Goal", Icons.sports_soccer),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Helper method to create a row of statistics
//   Widget buildStatRow(String statName, int team1Value, int team2Value, Color team1Color, Color team2Color) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 5.0),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "$team1Value%",
//                 style: GoogleFonts.sen(
//                   textStyle: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: StepProgressIndicator(
//                   totalSteps: team1Value + team2Value,
//                   currentStep: team1Value,
//                   size: 8,
//                   padding: 0,
//                   selectedColor: team1Color,
//                   unselectedColor: team2Color,
//                   roundedEdges: Radius.circular(10),
//                 ),
//               ),
//               Text(
//                 "$team2Value%",
//                 style: GoogleFonts.sen(
//                   textStyle: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 5),
//           Text(
//             statName,
//             style: GoogleFonts.sen(
//               textStyle: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//           ),
//           SizedBox(height: 10),
//         ],
//       ),
//     );
//   }
//
//   // Helper method to create a timeline tile
//   Widget buildTimelineTile(String playerName, String event, IconData iconData) {
//     return TimelineTile(
//       alignment: TimelineAlign.start,
//       isFirst: false,
//       isLast: false,
//       indicatorStyle: IndicatorStyle(
//         width: 40,
//         height: 40,
//         indicator: Icon(
//           iconData,
//           color: Colors.white,
//         ),
//         color: Colors.green,
//         padding: EdgeInsets.all(8),
//       ),
//       endChild: Container(
//         padding: EdgeInsets.symmetric(vertical: 8.0),
//         constraints: BoxConstraints(
//           minHeight: 80,
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               playerName,
//               style: GoogleFonts.sen(
//                 textStyle: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//             ),
//             Text(
//               event,
//               style: GoogleFonts.sen(
//                 textStyle: TextStyle(
//                   fontSize: 14,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
