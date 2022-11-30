

import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_store/api/models/User.dart';

enum PrefKeys{ loggedIn , id , name , mobile , city_id,store_id , gender , token  }
class SharedPrefController {

  SharedPrefController._();
  late SharedPreferences _sharedPreferences;

  static SharedPrefController? _instance ;

  factory SharedPrefController (){
    return _instance ??= SharedPrefController._();
  }

  Future<void> initPreferences () async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }


  void save(User user) async {
   await _sharedPreferences.setBool(PrefKeys.loggedIn.name,true);
   await _sharedPreferences.setString(PrefKeys.name.name , user.name);
   await _sharedPreferences.setInt(PrefKeys.id.name, user.id );
   await _sharedPreferences.setString(PrefKeys.mobile.name, user.mobile);
   await _sharedPreferences.setString(PrefKeys.city_id.name, user.cityId);
   await _sharedPreferences.setString(PrefKeys.store_id.name, user.storeId);
   await _sharedPreferences.setString(PrefKeys.gender.name, user.gender);
   await _sharedPreferences.setString(PrefKeys.token.name, user.token);

  }

  String get token => "Bearer ${getValueFor(PrefKeys.token.name)}";


  Future<bool> clear(){
    return _sharedPreferences.clear();
  }

  T? getValueFor<T> (String key){
    if(_sharedPreferences.containsKey(key)){
      return _sharedPreferences.get(key) as T ;
    }
    return null ;
  }
}