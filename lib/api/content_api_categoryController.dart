import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:smart_store/api/api_settings.dart';
import 'package:smart_store/api/models/api_response.dart';
import 'package:smart_store/api/models/category.dart';
import 'package:smart_store/api/models/home.dart';
import 'package:smart_store/prefs/shared_pref_controller.dart';

class CategoriesApiController {

  final _token = SharedPrefController().token;
  Future<ApiResponse<List<Categories>>> getCategories() async {
    Uri uri = Uri.parse(ApiSettings.category);
    var response = await http.get(uri,headers: {
      HttpHeaders.authorizationHeader:_token,
    });
    if(response.statusCode == 200 || response.statusCode == 401){
      var json = jsonDecode(response.body);
      var jsonObj = json["list"] as List;
      List<Categories> list = jsonObj.map((e) => Categories.fromJson(e)).toList();
      return ApiResponse<List<Categories>>(json["message"],json["status"],list);
    }
    return ApiResponse<List<Categories>>("Wrong",false);
    //return ApiResponse<List<Category>>(message: "Something going wrong!", status: false,model: []);
  }



}
