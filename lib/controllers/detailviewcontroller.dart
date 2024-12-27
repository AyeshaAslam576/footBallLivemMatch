import 'package:countdown/models/h2h_model.dart';
import 'package:countdown/models/predictions.dart';
import 'package:countdown/singleton/singleton.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../models/livematch_model.dart';
import '../models/results.dart';
import 'package:flutter/material.dart';
class Detailviewcontroller extends GetxController{
  String baseUrl = "https://apiv3.apifootball.com/";
  String apiKey = "d5be4f2ec995c47867206600ee18f02bf98431483e534e021a86843d98c6e3a4";
   RxList<Predictions> predictionsList = RxList<Predictions>();
  RxList<LivematchModel> liveMatches = RxList<LivematchModel>();
RxString scoreStatushomeText=''.obs;
  RxString scoreStatusawayText=''.obs;
  RxString scoreStatush2hText=''.obs;
  Rx<List<FirstTeamLastResults>> firstTeamLastResultsList = Rx<List<FirstTeamLastResults>>([]);
  Rx<List<SecondTeamLastResults>> secondTeamLastResultsList = Rx<List<SecondTeamLastResults>>([]);
  Rx<List<FirstTeamVsSecondTeam>> firstTeamVssecondTeamLastResultsList = Rx<List<FirstTeamVsSecondTeam>>([]);
  late SingleTon s = SingleTon();
  Rx<DateTime> today = DateTime.now().obs;
  RxString formattedDate = ''.obs;
  RxString matchformattedDate = ''.obs;
  RxBool isHometeamSelected=false.obs;
  RxInt firstteamlistLength=3.obs;
  RxInt secondTeamlistLength=3.obs;
  RxInt firstTeamvssecondlistLength=2.obs;
  @override
  void onInit() {
    super.onInit();
    print("oninit method is called");
    formattedDate.value = DateFormat('yyyy-MM-dd').format(today.value);
    String? MatchDate=s.selectedMatchModel?.matchDate as String? ;
    if(MatchDate!=null){
      DateTime matchdatetoParse=DateTime.parse(MatchDate);
      matchformattedDate.value=DateFormat("d MMM").format(matchdatetoParse);
    }
  }
  @override
  void onReady() {
    getResults();
       getPredictions();
      super.onReady();
  }
  Future<void> getResults() async {
    Dio dio = Dio();
    try {
      var response = await dio.get(baseUrl, queryParameters: {
        "action": "get_H2H",
        "APIkey": apiKey,
        "firstTeam": "${s.selectedMatchModel?.matchHometeamName}",
        "secondTeam": "${s.selectedMatchModel?.matchAwayteamName}",
        "firstTeamId": "${s.selectedMatchModel?.matchHometeamId}",
        "secondTeamId": "${s.selectedMatchModel?.matchAwayteamId}"
      });

      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        H2hModel h2hModel = H2hModel.fromJson(response.data);
        firstTeamLastResultsList.value = h2hModel.firstTeamLastResults ?? [];
        secondTeamLastResultsList.value = h2hModel.secondTeamLastResults ?? [];
        firstTeamVssecondTeamLastResultsList.value = h2hModel.firstTeamVSSecondTeam ?? [];

      } else {
        print("Failed to fetch data. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error while fetching results: $e");
    }
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
          "league_id": s.selectedMatchModel?.leagueId,
        },
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        List<dynamic> data = response.data;
        liveMatches.addAll(data.map((json) => LivematchModel.fromJson(json)).toList());
        print("${formattedDate.value}");
        print(response.data);

      } else {
        print("Failed to fetch data. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("The error caught is: $e");
    }
  }
  Future<void> getPredictions() async {
    Dio dio = Dio();
    try {
      var response = await dio.get(baseUrl, queryParameters: {
        "action": "get_predictions",
        "APIkey": apiKey,
        "from": formattedDate.value,
        "to": formattedDate.value,
        "league_id": s.selectedMatchModel?.leagueId,
        "match_id": s.selectedMatchModel?.matchId,
      });

      if (response.statusCode! <= 300 && response.statusCode! >= 200) {
        if (response.data is List) {

          (response.data as List).forEach((item) {
            predictionsList.add(Predictions.fromJson(item));
          });
          print(response.data);
        } else {
          print("Unexpected response format: ${response.data}");
        }
      }
    } catch (e) {
      print("error while fetching prediction is $e");
    }
  }
void firstTeamIncreaseLength(){
    int actualLength=firstTeamLastResultsList.value.length;
   if(firstteamlistLength.value<actualLength){
     firstteamlistLength.value=(firstteamlistLength.value+3).clamp(0, actualLength);
   }
}
  void secondTeamIncreaseLength(){
    int actualLength=secondTeamLastResultsList.value.length;
    if(secondTeamlistLength.value <actualLength){
      secondTeamlistLength.value=(secondTeamlistLength.value+3).clamp(0, actualLength);
    }
  }
  void h2hTeamIncreaseLength(){
    int actuallength=firstTeamVssecondTeamLastResultsList.value.length;
    if(firstTeamvssecondlistLength.value<actuallength){
      firstTeamvssecondlistLength.value=(firstTeamvssecondlistLength.value + 3 ).clamp(0,actuallength);
    }
  }
  void scorestatus(FirstTeamLastResults obj) {

    int homteamscore = 0;
    int awayteamScore = 0;

    if(s.selectedMatchModel?.matchHometeamId == obj.matchHometeamId) {
      homteamscore = int.parse(obj.matchHometeamScore ?? '0');
      awayteamScore = int.parse(obj.matchAwayteamScore ?? '0');
    }
    else {
      awayteamScore = int.parse(obj.matchHometeamScore ?? '0');
      homteamscore = int.parse(obj.matchAwayteamScore ?? '0');
    }

   if(homteamscore > awayteamScore){
     scoreStatushomeText.value = "W";
   }
   else if(homteamscore == awayteamScore){
     scoreStatushomeText.value = "D";
   }
   else{
     scoreStatushomeText.value = "L";
   }

   print("First Team Match Result: ${scoreStatushomeText.value}");

  }
  void scorestatusAway(SecondTeamLastResults obj) {

    int homteamscore = 0;
    int awayteamScore = 0;

    if(s.selectedMatchModel?.matchHometeamId == obj.matchHometeamId) {
      homteamscore = int.parse(obj.matchHometeamScore ?? '0');
      awayteamScore = int.parse(obj.matchAwayteamScore ?? '0');
    }
    else {
      awayteamScore = int.parse(obj.matchHometeamScore ?? '0');
      homteamscore = int.parse(obj.matchAwayteamScore ?? '0');
    }

    if(homteamscore > awayteamScore){
      scoreStatusawayText.value = "W";
    }
    else if(homteamscore == awayteamScore){
      scoreStatusawayText.value = "D";
    }
    else{
      scoreStatusawayText.value = "L";
    }

    print("First Team Match Result: ${scoreStatusawayText.value}");

  }
  void scorestatusHeadtohead(FirstTeamVsSecondTeam obj) {

    int homteamscore = 0;
    int awayteamScore = 0;

    if(s.selectedMatchModel?.matchHometeamId == obj.matchHometeamId) {
      homteamscore = int.parse(obj.matchHometeamScore ?? '0');
      awayteamScore = int.parse(obj.matchAwayteamScore ?? '0');
    }
    else {
      awayteamScore = int.parse(obj.matchHometeamScore ?? '0');
      homteamscore = int.parse(obj.matchAwayteamScore ?? '0');
    }

    if(homteamscore > awayteamScore){
      scoreStatush2hText.value = "W";
    }
    else if(homteamscore == awayteamScore){
      scoreStatushomeText.value = "D";
    }
    else{
      scoreStatushomeText.value = "L";
    }

    print("First Team Match Result: ${scoreStatushomeText.value}");

  }
  Color getBackgroundColor(String text ){
    if(text=="W"){
      return Colors.green;
    }
    else if(text=="D"){
      return Colors.blue;
    }
    else {
      return Colors.red;
    }
  }
 }
