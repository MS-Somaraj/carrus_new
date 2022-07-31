class LoginModel {
  LoginModel({
      this.status, 
      this.msg, 
      this.data, 
      this.token, 
      this.role,});

  LoginModel.fromJson(dynamic json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    token = json['token'];
    role = json['role'];
  }
  bool? status;
  String? msg;
  Data? data;
  String? token;
  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['msg'] = msg;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['token'] = token;
    map['role'] = role;
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.role, 
      this.phoneNumber, 
      this.name, 
      this.email, 
      this.password, 
      this.place, 
      this.gender, 
      this.dateOfBirth, 
      this.status, 
      this.v,});

  Data.fromJson(dynamic json) {
    id = json['_id'];
    role = json['role'];
    phoneNumber = json['phoneNumber'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    place = json['place'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    status = json['status'];
    v = json['__v'];
  }
  String? id;
  String? role;
  int? phoneNumber;
  String? name;
  String? email;
  String? password;
  String? place;
  String? gender;
  String? dateOfBirth;
  String? status;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['role'] = role;
    map['phoneNumber'] = phoneNumber;
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['place'] = place;
    map['gender'] = gender;
    map['date_of_birth'] = dateOfBirth;
    map['status'] = status;
    map['__v'] = v;
    return map;
  }

}