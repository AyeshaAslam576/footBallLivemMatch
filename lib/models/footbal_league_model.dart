import 'dart:convert';
CountryModel countryModelFromJson(String str) => CountryModel.fromJson(json.decode(str));
String countryModelToJson(CountryModel data) => json.encode(data.toJson());
class CountryModel {
  CountryModel({
      this.countryId, 
      this.countryName, 
      this.countryLogo,});

  CountryModel.fromJson(dynamic json) {
    countryId = json['country_id'];
    countryName = json['country_name'];
    countryLogo = json['country_logo'];
  }
  String? countryId;
  String? countryName;
  String? countryLogo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country_id'] = countryId;
    map['country_name'] = countryName;
    map['country_logo'] = countryLogo;
    return map;
  }

}