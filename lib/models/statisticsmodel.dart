import 'dart:convert';

Statistics statisticsModelFromJson(String str) => Statistics.fromJson(json.decode(str));

String statisticsModelToJson(Statistics data) => json.encode(data.toJson());

class Statistics {
  String? type;
  String? home;
  String? away;

  Statistics({this.type, this.home, this.away});

  factory Statistics.fromJson(Map<String, dynamic> json) => Statistics(
    type: json['type'],
    home: json['home'],
    away: json['away'],
  );

  Map<String, dynamic> toJson() => {
    'type': type,
    'home': home,
    'away': away,
  };
}
