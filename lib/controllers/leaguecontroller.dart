import 'package:dio/dio.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import '../models/leaguemodel.dart';
import 'package:flutter/material.dart';
class LeagueController extends GetxController{
  String baseUrl = "https://apiv3.apifootball.com/";
  String apiKey = "d5be4f2ec995c47867206600ee18f02bf98431483e534e021a86843d98c6e3a4";
  RxList<LeagueModel> leagueList=RxList();
  Rx<DateTime> today = DateTime.now().obs;
  RxString formattedDate = ''.obs;
  RxList<LeagueModel> filteredLeagues = RxList();
  late TextEditingController searchController = TextEditingController();
  @override
  void onInit() {
    formattedDate.value = DateFormat('yyyy-MM-dd').format(today.value);
    super.onInit();
  }
  @override
  void onReady() {
    getCompitionData();
    super.onReady();
    }
  Future<void>getCompitionData()async{
Dio dio=Dio();
try{
  var repsonse=await dio.get(baseUrl,queryParameters:
  {
    "action":"get_leagues",
    "from":formattedDate.value,
    "to":formattedDate.value,
     "APIkey":apiKey
  });
  if(repsonse.statusCode!>=200 && repsonse.statusCode!<=300){
    List<dynamic> data= repsonse.data;
    leagueList.addAll(data.map((json)=>LeagueModel.fromJson(json)).toList());
    filteredLeagues.addAll(leagueList);
    print(repsonse);
  }
}catch(e){

  print("The eror while fetching compition record is ${e}");
}
  }
  void filterLeagues(String query) {
    if (query.isEmpty) {
      filteredLeagues.assignAll(leagueList);
    } else {
      filteredLeagues.assignAll(
        leagueList.where((league) => league.leagueName!.toLowerCase().contains(query.toLowerCase())).toList(),
      );
    }
  }
}