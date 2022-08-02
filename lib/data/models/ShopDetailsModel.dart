class ShopDetailsModel {
  ShopDetailsModel({
      this.status, 
      this.msg, 
      this.data,});

  ShopDetailsModel.fromJson(dynamic json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  bool? status;
  String? msg;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['msg'] = msg;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
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