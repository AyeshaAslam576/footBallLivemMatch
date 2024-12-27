import 'dart:convert';
H2hModel h2hModelFromJson(String str) => H2hModel.fromJson(json.decode(str));
String h2hModelToJson(H2hModel data) => json.encode(data.toJson());
class H2hModel {
  H2hModel({
      this.firstTeamVSSecondTeam, 
      this.firstTeamLastResults, 
      this.secondTeamLastResults,});

  H2hModel.fromJson(dynamic json) {
    if (json['firstTeam_VS_secondTeam'] != null) {
      firstTeamVSSecondTeam = [];
      json['firstTeam_VS_secondTeam'].forEach((v) {
        firstTeamVSSecondTeam?.add(FirstTeamVsSecondTeam.fromJson(v));
      });
    }
    if (json['firstTeam_lastResults'] != null) {
      firstTeamLastResults = [];
      json['firstTeam_lastResults'].forEach((v) {
        firstTeamLastResults?.add(FirstTeamLastResults.fromJson(v));
      });
    }
    if (json['secondTeam_lastResults'] != null) {
      secondTeamLastResults = [];
      json['secondTeam_lastResults'].forEach((v) {
        secondTeamLastResults?.add(SecondTeamLastResults.fromJson(v));
      });
    }
  }
  List<FirstTeamVsSecondTeam>? firstTeamVSSecondTeam;
  List<FirstTeamLastResults>? firstTeamLastResults;
  List<SecondTeamLastResults>? secondTeamLastResults;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (firstTeamVSSecondTeam != null) {
      map['firstTeam_VS_secondTeam'] = firstTeamVSSecondTeam?.map((v) => v.toJson()).toList();
    }
    if (firstTeamLastResults != null) {
      map['firstTeam_lastResults'] = firstTeamLastResults?.map((v) => v.toJson()).toList();
    }
    if (secondTeamLastResults != null) {
      map['secondTeam_lastResults'] = secondTeamLastResults?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

SecondTeamLastResults secondTeamLastResultsFromJson(String str) => SecondTeamLastResults.fromJson(json.decode(str));
String secondTeamLastResultsToJson(SecondTeamLastResults data) => json.encode(data.toJson());
class SecondTeamLastResults {
  SecondTeamLastResults({
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
      this.matchAwayteamId, 
      this.matchAwayteamName, 
      this.matchAwayteamScore, 
      this.matchHometeamHalftimeScore, 
      this.matchAwayteamHalftimeScore, 
      this.matchLive, 
      this.teamHomeBadge, 
      this.teamAwayBadge, 
      this.leagueLogo, 
      this.countryLogo,});

  SecondTeamLastResults.fromJson(dynamic json) {
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
    matchAwayteamId = json['match_awayteam_id'];
    matchAwayteamName = json['match_awayteam_name'];
    matchAwayteamScore = json['match_awayteam_score'];
    matchHometeamHalftimeScore = json['match_hometeam_halftime_score'];
    matchAwayteamHalftimeScore = json['match_awayteam_halftime_score'];
    matchLive = json['match_live'];
    teamHomeBadge = json['team_home_badge'];
    teamAwayBadge = json['team_away_badge'];
    leagueLogo = json['league_logo'];
    countryLogo = json['country_logo'];
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
  String? matchAwayteamId;
  String? matchAwayteamName;
  String? matchAwayteamScore;
  String? matchHometeamHalftimeScore;
  String? matchAwayteamHalftimeScore;
  String? matchLive;
  String? teamHomeBadge;
  String? teamAwayBadge;
  String? leagueLogo;
  String? countryLogo;

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
    map['match_awayteam_id'] = matchAwayteamId;
    map['match_awayteam_name'] = matchAwayteamName;
    map['match_awayteam_score'] = matchAwayteamScore;
    map['match_hometeam_halftime_score'] = matchHometeamHalftimeScore;
    map['match_awayteam_halftime_score'] = matchAwayteamHalftimeScore;
    map['match_live'] = matchLive;
    map['team_home_badge'] = teamHomeBadge;
    map['team_away_badge'] = teamAwayBadge;
    map['league_logo'] = leagueLogo;
    map['country_logo'] = countryLogo;
    return map;
  }

}

FirstTeamLastResults firstTeamLastResultsFromJson(String str) => FirstTeamLastResults.fromJson(json.decode(str));
String firstTeamLastResultsToJson(FirstTeamLastResults data) => json.encode(data.toJson());
class FirstTeamLastResults {
  FirstTeamLastResults({
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
      this.matchAwayteamId, 
      this.matchAwayteamName, 
      this.matchAwayteamScore, 
      this.matchHometeamHalftimeScore, 
      this.matchAwayteamHalftimeScore, 
      this.matchLive, 
      this.teamHomeBadge, 
      this.teamAwayBadge, 
      this.leagueLogo, 
      this.countryLogo,});

  FirstTeamLastResults.fromJson(dynamic json) {
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
    matchAwayteamId = json['match_awayteam_id'];
    matchAwayteamName = json['match_awayteam_name'];
    matchAwayteamScore = json['match_awayteam_score'];
    matchHometeamHalftimeScore = json['match_hometeam_halftime_score'];
    matchAwayteamHalftimeScore = json['match_awayteam_halftime_score'];
    matchLive = json['match_live'];
    teamHomeBadge = json['team_home_badge'];
    teamAwayBadge = json['team_away_badge'];
    leagueLogo = json['league_logo'];
    countryLogo = json['country_logo'];
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
  String? matchAwayteamId;
  String? matchAwayteamName;
  String? matchAwayteamScore;
  String? matchHometeamHalftimeScore;
  String? matchAwayteamHalftimeScore;
  String? matchLive;
  String? teamHomeBadge;
  String? teamAwayBadge;
  String? leagueLogo;
  String? countryLogo;

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
    map['match_awayteam_id'] = matchAwayteamId;
    map['match_awayteam_name'] = matchAwayteamName;
    map['match_awayteam_score'] = matchAwayteamScore;
    map['match_hometeam_halftime_score'] = matchHometeamHalftimeScore;
    map['match_awayteam_halftime_score'] = matchAwayteamHalftimeScore;
    map['match_live'] = matchLive;
    map['team_home_badge'] = teamHomeBadge;
    map['team_away_badge'] = teamAwayBadge;
    map['league_logo'] = leagueLogo;
    map['country_logo'] = countryLogo;
    return map;
  }

}

FirstTeamVsSecondTeam firstTeamVsSecondTeamFromJson(String str) => FirstTeamVsSecondTeam.fromJson(json.decode(str));
String firstTeamVsSecondTeamToJson(FirstTeamVsSecondTeam data) => json.encode(data.toJson());
class FirstTeamVsSecondTeam {
  FirstTeamVsSecondTeam({
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
      this.matchAwayteamId, 
      this.matchAwayteamName, 
      this.matchAwayteamScore, 
      this.matchHometeamHalftimeScore, 
      this.matchAwayteamHalftimeScore, 
      this.matchLive, 
      this.teamHomeBadge, 
      this.teamAwayBadge, 
      this.leagueLogo, 
      this.countryLogo,});

  FirstTeamVsSecondTeam.fromJson(dynamic json) {
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
    matchAwayteamId = json['match_awayteam_id'];
    matchAwayteamName = json['match_awayteam_name'];
    matchAwayteamScore = json['match_awayteam_score'];
    matchHometeamHalftimeScore = json['match_hometeam_halftime_score'];
    matchAwayteamHalftimeScore = json['match_awayteam_halftime_score'];
    matchLive = json['match_live'];
    teamHomeBadge = json['team_home_badge'];
    teamAwayBadge = json['team_away_badge'];
    leagueLogo = json['league_logo'];
    countryLogo = json['country_logo'];
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
  String? matchAwayteamId;
  String? matchAwayteamName;
  String? matchAwayteamScore;
  String? matchHometeamHalftimeScore;
  String? matchAwayteamHalftimeScore;
  String? matchLive;
  String? teamHomeBadge;
  String? teamAwayBadge;
  String? leagueLogo;
  String? countryLogo;

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
    map['match_awayteam_id'] = matchAwayteamId;
    map['match_awayteam_name'] = matchAwayteamName;
    map['match_awayteam_score'] = matchAwayteamScore;
    map['match_hometeam_halftime_score'] = matchHometeamHalftimeScore;
    map['match_awayteam_halftime_score'] = matchAwayteamHalftimeScore;
    map['match_live'] = matchLive;
    map['team_home_badge'] = teamHomeBadge;
    map['team_away_badge'] = teamAwayBadge;
    map['league_logo'] = leagueLogo;
    map['country_logo'] = countryLogo;
    return map;
  }

}