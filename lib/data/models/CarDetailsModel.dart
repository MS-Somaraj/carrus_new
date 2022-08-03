class CarDetailsModel {
  bool? status;
  String? msg;
  List<Data>? data;

  CarDetailsModel({this.status, this.msg, this.data});

  CarDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? carname;
  String? type;
  int? price;
  String? available;
  String? status;
  int? iV;
  String? enginetype;

  Data(
      {this.sId,
        this.carname,
        this.type,
        this.price,
        this.available,
        this.status,
        this.iV,
        this.enginetype});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    carname = json['carname'];
    type = json['type'];
    price = json['price'];
    available = json['available'];
    status = json['status'];
    iV = json['__v'];
    enginetype = json['enginetype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['carname'] = this.carname;
    data['type'] = this.type;
    data['price'] = this.price;
    data['available'] = this.available;
    data['status'] = this.status;
    data['__v'] = this.iV;
    data['enginetype'] = this.enginetype;
    return data;
  }
}