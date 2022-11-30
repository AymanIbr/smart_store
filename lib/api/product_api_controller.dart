import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:smart_store/api/api_settings.dart';
import 'package:smart_store/api/models/home.dart';
import 'package:smart_store/api/models/product.dart';
import 'package:smart_store/helpers/api_helper.dart';
import 'package:smart_store/prefs/shared_pref_controller.dart';

class ProductsApiController with ApiHelper {

  final _token = SharedPrefController().token;

  Future<void> product() async {
    Future<List<Products>> getProducts({required int subCategoryId}) async {
      String token = SharedPrefController().getValueFor<String>(
          PrefKeys.token.name)!;
      Uri uri = Uri.parse(
          ApiSettings.product.replaceFirst('{id}', subCategoryId.toString()));
      var response = await http.get(uri, headers: {
        HttpHeaders.authorizationHeader: token,
        HttpHeaders.acceptHeader: 'application/json',
      });
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        var dataJsonObject = json['list'] as List;
        return dataJsonObject
            .map((jsonObject) => Products.fromJson(jsonObject))
            .toList();
      }
      return [];
    }
  }
  Future<Home> getHomeData() async {
    print("token ${_token}");
    Uri uri = Uri.parse(ApiSettings.home);
    var response = await http.get(uri,headers: {
      HttpHeaders.acceptHeader : "application/json",
      HttpHeaders.authorizationHeader : _token,
    });
    print("home ${response.body}");

    if(response.statusCode == 200 || response.statusCode == 400){
      var json = jsonDecode(response.body);
      return Home.fromJson(json["data"]);
    }
    return Home();
  }
}