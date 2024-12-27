import 'dart:convert';
Videomodel videomodelFromJson(String str) => Videomodel.fromJson(json.decode(str));
String videomodelToJson(Videomodel data) => json.encode(data.toJson());
class Videomodel {
  Videomodel({
      this.matchId, 
      this.videoTitleFull, 
      this.videoTitle, 
      this.videoUrl,});

  Videomodel.fromJson(dynamic json) {
    matchId = json['match_id'];
    videoTitleFull = json['video_title_full'];
    videoTitle = json['video_title'];
    videoUrl = json['video_url'];
  }
  String? matchId;
  String? videoTitleFull;
  String? videoTitle;
  String? videoUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['match_id'] = matchId;
    map['video_title_full'] = videoTitleFull;
    map['video_title'] = videoTitle;
    map['video_url'] = videoUrl;
    return map;
  }

}