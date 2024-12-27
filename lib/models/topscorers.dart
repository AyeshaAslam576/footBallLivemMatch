import 'dart:convert';
Topscorers topscorersFromJson(String str) => Topscorers.fromJson(json.decode(str));
String topscorersToJson(Topscorers data) => json.encode(data.toJson());
class Topscorers {
  Topscorers({
      this.playerPlace, 
      this.playerName, 
      this.playerKey, 
      this.teamName, 
      this.teamKey, 
      this.goals, 
      this.assists, 
      this.penaltyGoals,});

  Topscorers.fromJson(dynamic json) {
    playerPlace = json['player_place'];
    playerName = json['player_name'];
    playerKey = json['player_key'];
    teamName = json['team_name'];
    teamKey = json['team_key'];
    goals = json['goals'];
    assists = json['assists'];
    penaltyGoals = json['penalty_goals'];
  }
  String? playerPlace;
  String? playerName;
  int? playerKey;
  String? teamName;
  String? teamKey;
  String? goals;
  String? assists;
  String? penaltyGoals;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['player_place'] = playerPlace;
    map['player_name'] = playerName;
    map['player_key'] = playerKey;
    map['team_name'] = teamName;
    map['team_key'] = teamKey;
    map['goals'] = goals;
    map['assists'] = assists;
    map['penalty_goals'] = penaltyGoals;
    return map;
  }

}