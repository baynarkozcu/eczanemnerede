import 'package:http/http.dart' as http;
import 'package:nobetcieczane/models/eczane.dart';
import 'dart:convert';
import 'package:nobetcieczane/models/ilce.dart';

import '../models/ilce.dart';

class Services {
  static String ilceApi = "https://api.collectapi.com/health/districtList?il=";
  static String eczaneApi = "https://api.collectapi.com/health/dutyPharmacy?ilce=";

  static Future<Ilce> getIlce(String city) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Authorization': 'apikey 3m9wMvn7C9mm0EU1Ly2ANo:18sQ4J7LBimrZ3kcwVArr0'
    };

    var response = await http.get(ilceApi + city, headers: requestHeaders);

    if (response.statusCode == 200) {
      var jsonresponse = Ilce.fromJson(json.decode(response.body));
      return jsonresponse;
    }
  }

  static Future<Eczane> getEczane(String ilce, String il)async{
        Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Authorization': 'apikey 3m9wMvn7C9mm0EU1Ly2ANo:18sQ4J7LBimrZ3kcwVArr0'
    };

    var response = await http.get(eczaneApi + ilce + "&il="+il, headers: requestHeaders);

    if (response.statusCode == 200) {
      var jsonresponse = Eczane.fromJson(json.decode(response.body));
      return jsonresponse;
    }
  }

}
