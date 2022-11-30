import 'package:smart_store/api/models/api_response.dart';

mixin ApiHelper {
  ApiResponse get errorResponse => ApiResponse('Somthing went wrong ', false);
}