import 'package:countdown/models/livematch_model.dart';
import 'package:countdown/singleton/singleton.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import '../models/leaguemodel.dart';
import 'package:intl/intl.dart';
class LivematchController extends GetxController {
  String baseUrl = "https://apiv3.apifootball.com/";
  String apiKey = "d5be4f2ec995c47867206600ee18f02bf98431483e534e021a86843d98c6e3a4";
  RxList<LivematchModel> liveMatches = RxList();
  RxList<LivematchModel> filteredMatchesList = RxList();
  RxList<LeagueModel> leagueList = RxList();
  RxList<String> dropdownItems = ['All', 'Finished', 'Live'].obs;
 RxString selectedValue = 'All'.obs;
  RxString matchStatus = ''.obs;
  final SingleTon s = SingleTon();
  RxInt num = 0.obs;
  Rx<DateTime> today = DateTime.now().obs;
  RxString formattedDate = ''.obs;
  RxString matchId=''.obs;
  @override
  void onInit() {
    super.onInit();
    formattedDate.value = DateFormat('yyyy-MM-dd').format(today.value);
  }
  @override
  void onReady() {
    getLivematchesData();
    getCompitionData();
    super.onReady();
  }
  Future<void> getLivematchesData() async {
    Dio dio = Dio();
    try {
      var response = await dio.get(
        baseUrl,
        queryParameters: {
          "action": "get_events",
          "APIkey": apiKey,
          "from": formattedDate.value,
          "to": formattedDate.value,
          "timezone": "Asia/Karachi",
        },
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        List<dynamic> data = response.data;
        liveMatches.clear();
        liveMatches.addAll(data.map((json) => LivematchModel.fromJson(json)).toList());
        filteredMatchesList.addAll(liveMatches);
        print("${formattedDate.value}");
        print(response.data);
        if (liveMatches.isNotEmpty) {
          updateStatus(liveMatches[num.value]);
        }
      } else {
        print("Failed to fetch data. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("The error caught is: $e");
    }
  }

  Future<void> getCompitionData() async {
    Dio dio = Dio();
    try {
      var response = await dio.get(
        baseUrl,
        queryParameters: {
          "action": "get_leagues",
          "from": formattedDate.value,
          "to": formattedDate.value,
          "APIkey": apiKey
        },
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        List<dynamic> data = response.data;
        leagueList.addAll(data.map((json) => LeagueModel.fromJson(json)).toList());
        print(response);
      }
    } catch (e) {
      print("The error while fetching competition records is: ${e}");
    }
  }

  void updateStatus(LivematchModel live) {
    if (live.matchLive == "1") {
      matchStatus.value = "is Live now";
    } else if (live.matchLive == "0" && live.matchStatus == "Finished") {
      matchStatus.value = "is Finished";
    } else {
      matchStatus.value = "will soon at ${live.matchTime}";
    }
  }
  List<LivematchModel> filterMatches(String selection) {
    switch (selection) {
      case 'Finished':
        return liveMatches.where((match) => match.matchLive=="0"&&match.matchStatus=="Finished").toList();
      case 'Live':
        return liveMatches.where((match) => match.matchLive=="1").toList();
      default:
        return liveMatches;
    }
  }
  // void filterlivemacthes() {
  //   liveMatches.clear();
  //   if (s.isFromLive ?? false) {
  //     liveMatches.addAll(getMatchesList('live'));
  //   }
  //   if (s.isFromFinished ?? false) {
  //     liveMatches.addAll(getMatchesList('finished'));
  //   } else if (s.isFromAllMatches ?? false) {
  //     liveMatches.addAll(getMatchesList('all'));
  //   }
  // }
  // List<LivematchModel> getMatchesList(String status) {
  //   if (status == 'live') {
  //     return liveMatches.where((match) => match.matchLive == 1).toList();
  //   }
  //   if (status == 'finished') {
  //     return liveMatches.where((match) => match.matchLive == 0).toList();
  //   }
  //   return liveMatches;
  // }
}
