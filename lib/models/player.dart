import 'dart:convert';
Player playerFromJson(String str) => Player.fromJson(json.decode(str));
String playerToJson(Player data) => json.encode(data.toJson());
class Player {
  Player({
      this.playerKey, 
      this.playerId, 
      this.playerImage, 
      this.playerName, 
      this.playerNumber, 
      this.playerCountry, 
      this.playerType, 
      this.playerAge, 
      this.playerBirthdate, 
      this.playerMatchPlayed, 
      this.playerGoals, 
      this.playerYellowCards, 
      this.playerRedCards, 
      this.playerMinutes, 
      this.playerInjured, 
      this.playerSubstituteOut, 
      this.playerSubstitutesOnBench, 
      this.playerAssists, 
      this.playerIsCaptain, 
      this.playerShotsTotal, 
      this.playerGoalsConceded, 
      this.playerFoulsCommitted, 
      this.playerTackles, 
      this.playerBlocks, 
      this.playerCrossesTotal, 
      this.playerInterceptions, 
      this.playerClearances, 
      this.playerDispossesed, 
      this.playerSaves, 
      this.playerInsideBoxSaves, 
      this.playerDuelsTotal, 
      this.playerDuelsWon, 
      this.playerDribbleAttempts, 
      this.playerDribbleSucc, 
      this.playerPenComm, 
      this.playerPenWon, 
      this.playerPenScored, 
      this.playerPenMissed, 
      this.playerPasses, 
      this.playerPassesAccuracy, 
      this.playerKeyPasses, 
      this.playerWoordworks, 
      this.playerRating, 
      this.teamName, 
      this.teamKey,});

  Player.fromJson(dynamic json) {
    playerKey = json['player_key'];
    playerId = json['player_id'];
    playerImage = json['player_image'];
    playerName = json['player_name'];
    playerNumber = json['player_number'];
    playerCountry = json['player_country'];
    playerType = json['player_type'];
    playerAge = json['player_age'];
    playerBirthdate = json['player_birthdate'];
    playerMatchPlayed = json['player_match_played'];
    playerGoals = json['player_goals'];
    playerYellowCards = json['player_yellow_cards'];
    playerRedCards = json['player_red_cards'];
    playerMinutes = json['player_minutes'];
    playerInjured = json['player_injured'];
    playerSubstituteOut = json['player_substitute_out'];
    playerSubstitutesOnBench = json['player_substitutes_on_bench'];
    playerAssists = json['player_assists'];
    playerIsCaptain = json['player_is_captain'];
    playerShotsTotal = json['player_shots_total'];
    playerGoalsConceded = json['player_goals_conceded'];
    playerFoulsCommitted = json['player_fouls_committed'];
    playerTackles = json['player_tackles'];
    playerBlocks = json['player_blocks'];
    playerCrossesTotal = json['player_crosses_total'];
    playerInterceptions = json['player_interceptions'];
    playerClearances = json['player_clearances'];
    playerDispossesed = json['player_dispossesed'];
    playerSaves = json['player_saves'];
    playerInsideBoxSaves = json['player_inside_box_saves'];
    playerDuelsTotal = json['player_duels_total'];
    playerDuelsWon = json['player_duels_won'];
    playerDribbleAttempts = json['player_dribble_attempts'];
    playerDribbleSucc = json['player_dribble_succ'];
    playerPenComm = json['player_pen_comm'];
    playerPenWon = json['player_pen_won'];
    playerPenScored = json['player_pen_scored'];
    playerPenMissed = json['player_pen_missed'];
    playerPasses = json['player_passes'];
    playerPassesAccuracy = json['player_passes_accuracy'];
    playerKeyPasses = json['player_key_passes'];
    playerWoordworks = json['player_woordworks'];
    playerRating = json['player_rating'];
    teamName = json['team_name'];
    teamKey = json['team_key'];
  }
  int? playerKey;
  String? playerId;
  String? playerImage;
  String? playerName;
  String? playerNumber;
  String? playerCountry;
  String? playerType;
  String? playerAge;
  String? playerBirthdate;
  String? playerMatchPlayed;
  String? playerGoals;
  String? playerYellowCards;
  String? playerRedCards;
  String? playerMinutes;
  String? playerInjured;
  String? playerSubstituteOut;
  String? playerSubstitutesOnBench;
  String? playerAssists;
  String? playerIsCaptain;
  String? playerShotsTotal;
  String? playerGoalsConceded;
  String? playerFoulsCommitted;
  String? playerTackles;
  String? playerBlocks;
  String? playerCrossesTotal;
  String? playerInterceptions;
  String? playerClearances;
  String? playerDispossesed;
  String? playerSaves;
  String? playerInsideBoxSaves;
  String? playerDuelsTotal;
  String? playerDuelsWon;
  String? playerDribbleAttempts;
  String? playerDribbleSucc;
  String? playerPenComm;
  String? playerPenWon;
  String? playerPenScored;
  String? playerPenMissed;
  String? playerPasses;
  String? playerPassesAccuracy;
  String? playerKeyPasses;
  String? playerWoordworks;
  String? playerRating;
  String? teamName;
  String? teamKey;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['player_key'] = playerKey;
    map['player_id'] = playerId;
    map['player_image'] = playerImage;
    map['player_name'] = playerName;
    map['player_number'] = playerNumber;
    map['player_country'] = playerCountry;
    map['player_type'] = playerType;
    map['player_age'] = playerAge;
    map['player_birthdate'] = playerBirthdate;
    map['player_match_played'] = playerMatchPlayed;
    map['player_goals'] = playerGoals;
    map['player_yellow_cards'] = playerYellowCards;
    map['player_red_cards'] = playerRedCards;
    map['player_minutes'] = playerMinutes;
    map['player_injured'] = playerInjured;
    map['player_substitute_out'] = playerSubstituteOut;
    map['player_substitutes_on_bench'] = playerSubstitutesOnBench;
    map['player_assists'] = playerAssists;
    map['player_is_captain'] = playerIsCaptain;
    map['player_shots_total'] = playerShotsTotal;
    map['player_goals_conceded'] = playerGoalsConceded;
    map['player_fouls_committed'] = playerFoulsCommitted;
    map['player_tackles'] = playerTackles;
    map['player_blocks'] = playerBlocks;
    map['player_crosses_total'] = playerCrossesTotal;
    map['player_interceptions'] = playerInterceptions;
    map['player_clearances'] = playerClearances;
    map['player_dispossesed'] = playerDispossesed;
    map['player_saves'] = playerSaves;
    map['player_inside_box_saves'] = playerInsideBoxSaves;
    map['player_duels_total'] = playerDuelsTotal;
    map['player_duels_won'] = playerDuelsWon;
    map['player_dribble_attempts'] = playerDribbleAttempts;
    map['player_dribble_succ'] = playerDribbleSucc;
    map['player_pen_comm'] = playerPenComm;
    map['player_pen_won'] = playerPenWon;
    map['player_pen_scored'] = playerPenScored;
    map['player_pen_missed'] = playerPenMissed;
    map['player_passes'] = playerPasses;
    map['player_passes_accuracy'] = playerPassesAccuracy;
    map['player_key_passes'] = playerKeyPasses;
    map['player_woordworks'] = playerWoordworks;
    map['player_rating'] = playerRating;
    map['team_name'] = teamName;
    map['team_key'] = teamKey;
    return map;
  }

}