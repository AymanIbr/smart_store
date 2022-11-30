class User {
  late int id;
  late String name;
  String? email;
  late String mobile;
  late String gender;
  late bool active;
  late bool verified;
  late String cityId;
  late String storeId;
  String? fcmToken;
  late String token;
  late String tokenType;
  late String refreshToken;
  late City city;
  late Store store;

  late String password;

  User();

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    gender = json['gender'];
    active = json['active'];
    verified = json['verified'];
    cityId = json['city_id'];
    storeId = json['store_id'];
    fcmToken = json['fcm_token'];
    token = json['token'];
    tokenType = json['token_type'];
    refreshToken = json['refresh_token'];
  }
}

class City {
  late int id;
  late String nameEn;
  late String nameAr;

  City();

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
  }

  Map<String, dynamic> toJson(City city) {
    final map = <String, dynamic>{};
    map['id'] = city.id;
    map['name_en'] = city.nameEn;
    map['name_ar'] = city.nameAr;
    return map;
  }
}

class Store {
  late int _id;
  late String _name;
  late String _storeName;
  late String _email;
  String? _emailVerifiedAt;
  late String _mobile;
  late String _storeUuid;
  late String _cityId;
  String? _verificationCode;
  late String _active;
  late String _verified;
  late String _firebaseKey;
  String? _image;
  late String _address;
  String? _facebook;
  String? _instagram;
  late String _createdAt;
  late String _updatedAt;

  Store();

  Store.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _storeName = json['store_name'];
    _email = json['email'];
    _emailVerifiedAt = json['email_verified_at'];
    _mobile = json['mobile'];
    _storeUuid = json['store_uuid'];
    _cityId = json['city_id'];
    _verificationCode = json['verification_code'];
    _active = json['active'];
    _verified = json['verified'];
    _firebaseKey = json['firebase_key'];
    _image = json['image'];
    _address = json['address'];
    _facebook = json['facebook'];
    _instagram = json['instagram'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
}
