class EditShopModel {
  EditShopModel({
      this.status, 
      this.msg, 
      this.data,});

  EditShopModel.fromJson(dynamic json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? status;
  String? msg;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['msg'] = msg;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.shopname, 
      this.ownername, 
      this.location, 
      this.phone, 
      this.email, 
      this.place, 
      this.status, 
      this.v,});

  Data.fromJson(dynamic json) {
    id = json['_id'];
    shopname = json['shopname'];
    ownername = json['ownername'];
    location = json['location'] != null ? json['location'].cast<double>() : [];
    phone = json['phone'];
    email = json['email'];
    place = json['place'];
    status = json['status'];
    v = json['__v'];
  }
  String? id;
  String? shopname;
  String? ownername;
  List<double>? location;
  int? phone;
  String? email;
  String? place;
  String? status;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['shopname'] = shopname;
    map['ownername'] = ownername;
    map['location'] = location;
    map['phone'] = phone;
    map['email'] = email;
    map['place'] = place;
    map['status'] = status;
    map['__v'] = v;
    return map;
  }

}