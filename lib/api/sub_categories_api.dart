import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:smart_store/api/models/Sub_Category.dart';
import 'package:smart_store/api/models/api_response.dart';
import '../prefs/shared_pref_controller.dart';
import 'api_settings.dart';

class SubCategoriesApiController {
  Future<ApiResponse<List<SubCategories>>> getSubCategories({required String categoryId}) async {
    Uri uri = Uri.parse(ApiSettings.subCategories.replaceFirst('{id}', categoryId.toString()));
    var response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader:SharedPrefController().getValueFor(PrefKeys.token.name),
      HttpHeaders.acceptHeader: 'application/json'
    });
    if (response.statusCode == 200 || response.statusCode == 401) {

      var json = jsonDecode(response.body);
      var jsonObj = json["list"] as List;
      List<SubCategories> list =  jsonObj.map((e) => SubCategories.fromJson(e)).toList();

      return ApiResponse<List<SubCategories>>(
          json["message"], json["status"], list);
    }
    print('Test20:');

    return ApiResponse('Something went wrong,try again!', false);
  }
}
