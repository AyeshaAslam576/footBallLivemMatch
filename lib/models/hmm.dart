import 'dart:convert';
Hmm hmmFromJson(String str) => Hmm.fromJson(json.decode(str));
String hmmToJson(Hmm data) => json.encode(data.toJson());
class Hmm {
  Hmm({
      this.countryId, 
      this.countryName, 
      this.leagueId, 
      this.leagueName, 
      this.leagueSeason, 
      this.leagueLogo, 
      this.countryLogo,});

  Hmm.fromJson(dynamic json) {
    countryId = json['country_id'];
    countryName = json['country_name'];
    leagueId = json['league_id'];
    leagueName = json['league_name'];
    leagueSeason = json['league_season'];
    leagueLogo = json['league_logo'];
    countryLogo = json['country_logo'];
  }
  String? countryId;
  String? countryName;
  String? leagueId;
  String? leagueName;
  String? leagueSeason;
  String? leagueLogo;
  String? countryLogo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country_id'] = countryId;
    map['country_name'] = countryName;
    map['league_id'] = leagueId;
    map['league_name'] = leagueName;
    map['league_season'] = leagueSeason;
    map['league_logo'] = leagueLogo;
    map['country_logo'] = countryLogo;
    return map;
  }

}