
import 'package:countdown/models/player.dart';
import 'package:countdown/models/topscorers.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../models/leaguemodel.dart';
import '../models/standings.dart';
class StatController extends GetxController {
  RxList<Standings> standingsList = RxList<Standings>();
  RxList<Topscorers> topScoreplayerlist = RxList<Topscorers>();
  RxList<Player> playerList = RxList<Player>();
  RxList<String> topScorerIds = RxList<String>();
  RxString selectedLeagueid = "56".obs;
  Rx<DateTime> today = DateTime.now().obs;
  RxString formattedDate = ''.obs;
  String baseUrl = "https://apiv3.apifootball.com/";
  String apiKey = "d5be4f2ec995c47867206600ee18f02bf98431483e534e021a86843d98c6e3a4";
  RxList<LeagueModel> leagues = RxList<LeagueModel>();
  @override
  void onInit() {
    super.onInit();
    formattedDate.value = DateFormat('yyyy-MM-dd').format(today.value);
  }
  @override
  void onReady() {
    fetchStandings();
    getCompitionData();
    getTopPlayersId(selectedLeagueid.value);
    super.onReady();
  }
  Future<void> fetchStandings() async {
    try {
      Dio dio = Dio();
      var response = await dio.get(
        baseUrl,
        queryParameters: {
          "action": "get_standings",
          "APIkey": apiKey,
          'league_id': selectedLeagueid.value,
        },
      );
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        standingsList.clear();
        standingsList.addAll(data.map((json) => Standings.fromJson(json)).toList());
        print("Standings updated for league id: ${selectedLeagueid.value}");
      } else {
        print('Failed to fetch standings data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching standings: $e');
    }
  }
  Future<void> getCompitionData() async {
    Dio dio = Dio();
    try {
      var response = await dio.get(
        baseUrl,
        queryParameters: {
          "action": "get_leagues",
          "from": "2024-08-15",
          "to": "2024-08-15",
          "APIkey": apiKey
        },
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        List<dynamic> data = response.data;
        leagues.clear();
        leagues.addAll(data.map((json) => LeagueModel.fromJson(json)).toList());
        print(response);
        print("Total leagues are...${leagues.length}..");
      }
    } catch (e) {
      print("The error while fetching competition record is $e");
    }
  }
  void getLeagueId(String index) {
    print("Selected league ID: $index");
    selectedLeagueid.value = index;
    getTopPlayersId(selectedLeagueid.value);
  }
  Future<void> getTopPlayersId(String leagueid) async {
    Dio dio = Dio();
    try {
      var response = await dio.get(
        baseUrl,
        queryParameters: {
          "action": "get_topscorers",
          "APIkey": apiKey,
          'league_id': leagueid,
        },
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        List<dynamic> data = response.data;
        playerList.clear();
        topScorerIds.clear();

        data.forEach((json) {
          Topscorers topPlayer = Topscorers.fromJson(json);
          topScoreplayerlist.add(topPlayer );
          if (topPlayer.playerKey != null) {
            getPlayerData(topPlayer.playerKey.toString());
            topScorerIds.add("${topPlayer.playerKey}");
          }
        });
        print(response);
        print("Total Players are...${playerList.length}..");
      }
    } catch (e) {
      print("The error occurred while fetching players is $e");
    }
  }
  Future<void> getPlayerData(String playerkeyAsId) async {
    try {
      Dio dio = Dio();
      var response = await dio.get(
        baseUrl,
        queryParameters: {
          "action": "get_players",
          "APIkey": apiKey,
          'player_id': playerkeyAsId,
        },
      );
      if (response.statusCode == 200) {
        response.data.map((item) {playerList.add(Player.fromJson(item));}).toList();
        // List<Player> data = response.data;
        //    topPlayers.addAll(data.map((json) => Player.fromJson(json)).toList());
        print("Player Data: ${playerList[0].toJson()}");
        print("player list updated for league id: ${selectedLeagueid.value}");
      } else {
        print('Failed to fetch player data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching palyers: $e');
    }
  }
}
