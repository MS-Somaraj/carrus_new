class AddCarModel {
  AddCarModel({
      this.status, 
      this.msg, 
      this.user,});

  AddCarModel.fromJson(dynamic json) {
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
      this.carname, 
      this.type, 
      this.price, 
      this.available, 
      this.enginetype, 
      this.status, 
      this.id, 
      this.v,});

  User.fromJson(dynamic json) {
    carname = json['carname'];
    type = json['type'];
    price = json['price'];
    available = json['available'];
    enginetype = json['enginetype'];
    status = json['status'];
    id = json['_id'];
    v = json['__v'];
  }
  String? carname;
  String? type;
  int? price;
  String? available;
  String? enginetype;
  String? status;
  String? id;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['carname'] = carname;
    map['type'] = type;
    map['price'] = price;
    map['available'] = available;
    map['enginetype'] = enginetype;
    map['status'] = status;
    map['_id'] = id;
    map['__v'] = v;
    return map;
  }

}