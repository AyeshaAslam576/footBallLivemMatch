import 'package:countdown/models/results.dart';
import 'package:countdown/view/detailview.dart';
import 'package:countdown/view/home_view.dart';
import 'package:countdown/view/league.dart';
import 'package:countdown/view/livematch.dart';
import 'package:countdown/view/matchvideo.dart';
import 'package:countdown/view/stat.dart';
import 'package:countdown/view/summary.dart';
import 'package:get/get.dart';
class ScreenRoutes{
static const String home="/home_view.dart";
static const String league="/league.dart";
static const String liveMatch="/livematch.dart";
static const String stats="/stat.dart";
static const String detailview="/detailview.dart";
static const String videos="/matchvideo.dart";
static const String summary="/summary.dart";
static final List<GetPage> myPages=[
  GetPage(name: detailview, page: ()=>Detailview()),
  GetPage(name: home,       page: ()=>HomeView()),
  GetPage(name: league, page: ()=>League()),
  GetPage(name: liveMatch, page:()=>Livematch()),
  GetPage(name: stats, page: ()=>Stats()),
  GetPage(name: videos, page: ()=>MatchVideo()),
  GetPage(name:summary,page: ()=>Summary()),
];
}
