import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smart_store/api/api_settings.dart';
import 'package:smart_store/api/models/User.dart';
import 'package:smart_store/api/models/api_response.dart';
import 'package:smart_store/helpers/api_helper.dart';
import 'package:smart_store/prefs/shared_pref_controller.dart';

class AuthAPiController with ApiHelper {
  Future<ApiResponse> login({required String mobile, required String password}) async {
    Uri uri = Uri.parse(ApiSettings.login);
    var response = await http.post(uri, body: {
      'mobile': mobile,
      'password': password,
    });
    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        User user = User.fromJson(json['data']);
        SharedPrefController().save(user);
      }
      return ApiResponse(json['message'], json['status']);
    }
    return errorResponse;
  }

  Future<ApiResponse<int>> register(User user) async {
    Uri uri = Uri.parse(ApiSettings.register);
    var response = await http.post(uri, body: {
      'name': user.name,
      'mobile': user.mobile,
      'password': user.password,
      'gender': user.gender,
      'city_id': user.cityId.toString(),
      'STORE_API_KEY': ApiSettings.STORE_API_KEY
    });
    if (response.statusCode == 201 || response.statusCode == 400) {
      print("sas");
      var json = jsonDecode(response.body);
      return ApiResponse<int>(json['message'], json['status'], json['code']);
    }
    return ApiResponse('Something  went worn, try again', true);
  }

  Future<ApiResponse> logout() async {
    String token =
        SharedPrefController().getValueFor<String>(PrefKeys.token.name)!;
    Uri uri = Uri.parse(ApiSettings.logout);
    var response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: token,
      HttpHeaders.acceptHeader: 'application/json'
    });
    if (response.statusCode == 200 || response.statusCode == 400) {
      SharedPrefController().clear();
      return ApiResponse('Logged out successfully', true);
    }
    return errorResponse;
  }

  Future<ApiResponse<List<City>>> getCities() async {
    print("Asdasd");
    Uri uri = Uri.parse(ApiSettings.cities);
    var response = await http.get(uri, headers: {
      HttpHeaders.acceptHeader: 'application/json',
    });
    print("status ${response.statusCode}");
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var jsonList = json["list"] as List;
      List<City> list = jsonList.map((e) => City.fromJson(e)).toList();
      return ApiResponse<List<City>>(json["message"], json["status"],list);
    }
    return ApiResponse('Something  went worn, try again', true);
  }


  Future<ApiResponse> activate(String mobile, int code) async {
    Uri uri = Uri.parse(ApiSettings.activate);
    var response = await http.post(uri, body: {
      'mobile': mobile,
      'code': code.toString(),
    });
    print('${response.statusCode}');
    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      return ApiResponse(json['message'], json['status']);
    }
    return ApiResponse('Something went wrong,try again!', false);
  }
}
