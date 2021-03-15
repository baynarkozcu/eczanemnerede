import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:nobetcieczane/models/ilce.dart';

class Services {
  static String ilceApi = "https://api.collectapi.com/health/districtList?il=";

  static Future<List<Ilce>> getIlce(String city) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'apikey 3m9wMvn7C9mm0EU1Ly2ANo:18sQ4J7LBimrZ3kcwVArr0'
    };

    var response = await http.get(ilceApi + city, headers: requestHeaders);

    if (response.statusCode == 200) {
      print("Response Body : " + response.body);
      //List<Ilce> list = parseResponse(response.body);
      Map<String, dynamic> map = json.decode(response.body);
      List<dynamic> data = map["result"];
      return data;
    }
  }

  static List<Ilce> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Ilce>((json) => Ilce.fromJson(json)).toList();
  }
}
