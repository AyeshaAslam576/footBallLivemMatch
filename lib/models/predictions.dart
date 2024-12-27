import 'dart:convert';

Predictions predictionsFromJson(String str) => Predictions.fromJson(json.decode(str));

String predictionsToJson(Predictions data) => json.encode(data.toJson());

class Predictions {
  Predictions({
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
    this.matchHometeamSystem,
    this.matchAwayteamSystem,
    this.matchLive,
    this.probHW,
    this.probD,
    this.probAW,
    this.probHWD,
    this.probAWD,
    this.probHWAW,
    // this.probO,
    // this.probU,
    // this.probO1,
    // this.probU1,
    // this.probO3,
    // this.probU3,
    // this.probBts,
    // this.probOts,
    // this.probAhH45,
    // this.probAhA45,
    // this.probAhH35,
    // this.probAhA35,
    // this.probAhH25,
    // this.probAhA25,
    // this.probAhH15,
    // this.probAhA15,
    // this.probAhH05,
    // this.probAhA05,
  });

  Predictions.fromJson(dynamic json) {
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
    matchHometeamSystem = json['match_hometeam_system'];
    matchAwayteamSystem = json['match_awayteam_system'];
    matchLive = json['match_live'];
    probHW = json['prob_HW'];
    probD = json['prob_D'];
    probAW = json['prob_AW'];
    probHWD = json['prob_HW_D'];
    probAWD = json['prob_AW_D'];
    probHWAW = json['prob_HW_AW'];
    // probO = json['prob_O'];
    // probU = json['prob_U'];
    // probO1 = json['prob_O_1'];
    // probU1 = json['prob_U_1'];
    // probO3 = json['prob_O_3'];
    // probU3 = json['prob_U_3'];
    // probBts = json['prob_bts'];
    // probOts = json['prob_ots'];
    // probAhH45 = json['prob_ah_h_45'];
    // probAhA45 = json['prob_ah_a_45'];
    // probAhH35 = json['prob_ah_h_35'];
    // probAhA35 = json['prob_ah_a_35'];
    // probAhH25 = json['prob_ah_h_25'];
    // probAhA25 = json['prob_ah_a_25'];
    // probAhH15 = json['prob_ah_h_15'];
    // probAhA15 = json['prob_ah_a_15'];
    // probAhH05 = json['prob_ah_h_05'];
    // probAhA05 = json['prob_ah_a_05'];
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
  String? matchHometeamSystem;
  String? matchAwayteamSystem;
  String? matchLive;
  String? probHW;
  String? probD;
  String? probAW;
  String? probHWD;
  String? probAWD;
  String? probHWAW;
  // String? probO;
  // String? probU;
  // String? probO1;
  // String? probU1;
  // String? probO3;
  // String? probU3;
  // String? probBts;
  // String? probOts;
  // String? probAhH45;
  // String? probAhA45;
  // String? probAhH35;
  // String? probAhA35;
  // String? probAhH25;
  // String? probAhA25;
  // String? probAhH15;
  // String? probAhA15;
  // String? probAhH05;
  // String? probAhA05;

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
    map['match_hometeam_system'] = matchHometeamSystem;
    map['match_awayteam_system'] = matchAwayteamSystem;
    map['match_live'] = matchLive;
    map['prob_HW'] = probHW;
    map['prob_D'] = probD;
    map['prob_AW'] = probAW;
    map['prob_HW_D'] = probHWD;
    map['prob_AW_D'] = probAWD;
    map['prob_HW_AW'] = probHWAW;
    // map['prob_O'] = probO;
    // map['prob_U'] = probU;
    // map['prob_O_1'] = probO1;
    // map['prob_U_1'] = probU1;
    // map['prob_O_3'] = probO3;
    // map['prob_U_3'] = probU3;
    // map['prob_bts'] = probBts;
    // map['prob_ots'] = probOts;
    // map['prob_ah_h_45'] = probAhH45;
    // map['prob_ah_a_45'] = probAhA45;
    // map['prob_ah_h_35'] = probAhH35;
    // map['prob_ah_a_35'] = probAhA35;
    // map['prob_ah_h_25'] = probAhH25;
    // map['prob_ah_a_25'] = probAhA25;
    // map['prob_ah_h_15'] = probAhH15;
    // map['prob_ah_a_15'] = probAhA15;
    // map['prob_ah_h_05'] = probAhH05;
    // map['prob_ah_a_05'] = probAhA05;
    return map;
  }
}
