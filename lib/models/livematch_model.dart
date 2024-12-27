import 'dart:convert';
LivematchModel livematchModelFromJson(String str) => LivematchModel.fromJson(json.decode(str));
String livematchModelToJson(LivematchModel data) => json.encode(data.toJson());
class LivematchModel {
  LivematchModel({
      this.matchId, 
      this.countryId, 
      this.countryName, 
      this.leagueId, 
      this.leagueName, 
      this.matchDate, 
      this.matchStatus, 
      this.matchTime, 
      this.matchHometeamId, 
      this.matchHometeamName, 
      this.matchHometeamScore, 
      this.matchAwayteamName, 
      this.matchAwayteamId, 
      this.matchAwayteamScore, 
      this.matchHometeamHalftimeScore, 
      this.matchAwayteamHalftimeScore, 
      this.matchHometeamExtraScore, 
      this.matchAwayteamExtraScore, 
      this.matchHometeamPenaltyScore, 
      this.matchAwayteamPenaltyScore, 
      this.matchHometeamFtScore, 
      this.matchAwayteamFtScore, 
      this.matchHometeamSystem, 
      this.matchAwayteamSystem, 
      this.matchLive, 
      this.matchRound, 
      this.matchStadium, 
      this.matchReferee, 
      this.teamHomeBadge, 
      this.teamAwayBadge, 
      this.leagueLogo, 
      this.countryLogo, 
      this.leagueYear, 
      this.fkStageKey, 
      this.stageName,});

  LivematchModel.fromJson(dynamic json) {
    matchId = json['match_id'];
    countryId = json['country_id'];
    countryName = json['country_name'];
    leagueId = json['league_id'];
    leagueName = json['league_name'];
    matchDate = json['match_date'];
    matchStatus = json['match_status'];
    matchTime = json['match_time'];
    matchHometeamId = json['match_hometeam_id'];
    matchHometeamName = json['match_hometeam_name'];
    matchHometeamScore = json['match_hometeam_score'];
    matchAwayteamName = json['match_awayteam_name'];
    matchAwayteamId = json['match_awayteam_id'];
    matchAwayteamScore = json['match_awayteam_score'];
    matchHometeamHalftimeScore = json['match_hometeam_halftime_score'];
    matchAwayteamHalftimeScore = json['match_awayteam_halftime_score'];
    matchHometeamExtraScore = json['match_hometeam_extra_score'];
    matchAwayteamExtraScore = json['match_awayteam_extra_score'];
    matchHometeamPenaltyScore = json['match_hometeam_penalty_score'];
    matchAwayteamPenaltyScore = json['match_awayteam_penalty_score'];
    matchHometeamFtScore = json['match_hometeam_ft_score'];
    matchAwayteamFtScore = json['match_awayteam_ft_score'];
    matchHometeamSystem = json['match_hometeam_system'];
    matchAwayteamSystem = json['match_awayteam_system'];
    matchLive = json['match_live'];
    matchRound = json['match_round'];
    matchStadium = json['match_stadium'];
    matchReferee = json['match_referee'];
    teamHomeBadge = json['team_home_badge'];
    teamAwayBadge = json['team_away_badge'];
    leagueLogo = json['league_logo'];
    countryLogo = json['country_logo'];
    leagueYear = json['league_year'];
    fkStageKey = json['fk_stage_key'];
    stageName = json['stage_name'];
  }
  String? matchId;
  String? countryId;
  String? countryName;
  String? leagueId;
  String? leagueName;
  String? matchDate;
  String? matchStatus;
  String? matchTime;
  String? matchHometeamId;
  String? matchHometeamName;
  String? matchHometeamScore;
  String? matchAwayteamName;
  String? matchAwayteamId;
  String? matchAwayteamScore;
  String? matchHometeamHalftimeScore;
  String? matchAwayteamHalftimeScore;
  String? matchHometeamExtraScore;
  String? matchAwayteamExtraScore;
  String? matchHometeamPenaltyScore;
  String? matchAwayteamPenaltyScore;
  String? matchHometeamFtScore;
  String? matchAwayteamFtScore;
  String? matchHometeamSystem;
  String? matchAwayteamSystem;
  String? matchLive;
  String? matchRound;
  String? matchStadium;
  String? matchReferee;
  String? teamHomeBadge;
  String? teamAwayBadge;
  String? leagueLogo;
  String? countryLogo;
  String? leagueYear;
  String? fkStageKey;
  String? stageName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['match_id'] = matchId;
    map['country_id'] = countryId;
    map['country_name'] = countryName;
    map['league_id'] = leagueId;
    map['league_name'] = leagueName;
    map['match_date'] = matchDate;
    map['match_status'] = matchStatus;
    map['match_time'] = matchTime;
    map['match_hometeam_id'] = matchHometeamId;
    map['match_hometeam_name'] = matchHometeamName;
    map['match_hometeam_score'] = matchHometeamScore;
    map['match_awayteam_name'] = matchAwayteamName;
    map['match_awayteam_id'] = matchAwayteamId;
    map['match_awayteam_score'] = matchAwayteamScore;
    map['match_hometeam_halftime_score'] = matchHometeamHalftimeScore;
    map['match_awayteam_halftime_score'] = matchAwayteamHalftimeScore;
    map['match_hometeam_extra_score'] = matchHometeamExtraScore;
    map['match_awayteam_extra_score'] = matchAwayteamExtraScore;
    map['match_hometeam_penalty_score'] = matchHometeamPenaltyScore;
    map['match_awayteam_penalty_score'] = matchAwayteamPenaltyScore;
    map['match_hometeam_ft_score'] = matchHometeamFtScore;
    map['match_awayteam_ft_score'] = matchAwayteamFtScore;
    map['match_hometeam_system'] = matchHometeamSystem;
    map['match_awayteam_system'] = matchAwayteamSystem;
    map['match_live'] = matchLive;
    map['match_round'] = matchRound;
    map['match_stadium'] = matchStadium;
    map['match_referee'] = matchReferee;
    map['team_home_badge'] = teamHomeBadge;
    map['team_away_badge'] = teamAwayBadge;
    map['league_logo'] = leagueLogo;
    map['country_logo'] = countryLogo;
    map['league_year'] = leagueYear;
    map['fk_stage_key'] = fkStageKey;
    map['stage_name'] = stageName;
    return map;
  }

}