import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../models/footbal_league_model.dart';
class HomeController extends GetxController {
  String baseUrl = "https://apiv3.apifootball.com/";
  String apiKey = "d5be4f2ec995c47867206600ee18f02bf98431483e534e021a86843d98c6e3a4";
RxList<CountryModel> countrylist=RxList();
  @override
  void onReady() {
    getCountriesdata();
    super.onReady();
  }

Future<void>getCountriesdata()async{
    Dio dio=Dio();
  try{
    var response= await dio.get(baseUrl,queryParameters: {"action":"get_countries","APIkey":apiKey});
    if(response.statusCode! >=200 && response.statusCode! <=300){
      print(response);
      List<dynamic> data = response.data;
      countrylist.addAll(data.map((json) => CountryModel.fromJson(json)).toList());
    }
  }catch(e){print(e);}
}
}