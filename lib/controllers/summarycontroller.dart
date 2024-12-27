import 'package:countdown/singleton/singleton.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../models/statisticsmodel.dart';
class Summarycontroller extends GetxController{
  String baseUrl = "https://apiv3.apifootball.com/";
  String apiKey = "d5be4f2ec995c47867206600ee18f02bf98431483e534e021a86843d98c6e3a4";
  RxList<Statistics> statslist = RxList();
  late SingleTon s=SingleTon();
  // @override
  // void onInit() {
  //   getStatistics();
  //   // TODO: implement onInit
  //   super.onInit();
  // }
  @override
  void onReady() {
    // TODO: implement onReady
getStatistics();
    super.onReady();
  }
  Future<void> getStatistics() async {
    Dio dio = Dio();
    try {
      var response = await dio.get(baseUrl, queryParameters: {
        "action": "get_statistics",
        "match_id": s.selectedMatchModel?.matchId,
        "APIkey": apiKey
      });

      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        String? matchId = s.selectedMatchModel?.matchId;

        // Safely check if the matchId exists and the statistics data is present
        if (matchId != null && response.data[matchId] != null) {
          var matchData = response.data[matchId];
          if (matchData != null && matchData["statistics"] != null) {
            List<dynamic> statisticsJson = matchData["statistics"];

            // Convert the list of JSON objects into a list of Statistics objects
            statslist.addAll(statisticsJson.map((json) => Statistics.fromJson(json)).toList());
            print(statslist);
          } else {
            print("No statistics found for the match.");
          }
        } else {
          print("Match ID not found in the response.");
        }
      } else {
        print("Error: ${response.statusCode} - ${response.statusMessage}");
      }
    } catch (e) {
      print("The error while fetching match statistics record is: $e");
    }
  }
}