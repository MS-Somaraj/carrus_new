class SignInModel {
  SignInModel({
      this.status, 
      this.msg, 
      this.user,});

  SignInModel.fromJson(dynamic json) {
    status = json['status'];
    msg = json['msg'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  bool? status;
  String? msg;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['msg'] = msg;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}

class User {
  User({
      this.role, 
      this.phoneNumber, 
      this.name, 
      this.email, 
      this.password, 
      this.gender, 
      this.dateOfBirth, 
      this.status, 
      this.id, 
      this.v,});

  User.fromJson(dynamic json) {
    role = json['role'];
    phoneNumber = json['phoneNumber'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    status = json['status'];
    id = json['_id'];
    v = json['__v'];
  }
  String? role;
  int? phoneNumber;
  String? name;
  String? email;
  String? password;
  String? gender;
  String? dateOfBirth;
  String? status;
  String? id;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['role'] = role;
    map['phoneNumber'] = phoneNumber;
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['gender'] = gender;
    map['date_of_birth'] = dateOfBirth;
    map['status'] = status;
    map['_id'] = id;
    map['__v'] = v;
    return map;
  }

}