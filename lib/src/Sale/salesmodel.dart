class SalesModel {
  bool? success;
  String? message;
  List<Data>? data;
  int? totalCount;

  SalesModel({this.success, this.message, this.data, this.totalCount});

  SalesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    totalCount = json['total_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['total_count'] = this.totalCount;
    return data;
  }
}

class Data {
  int? id;
  String? customer;
  String? totalPrice;
  String? createdAt;

  Data({this.id, this.customer, this.totalPrice, this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customer = json['customer'];
    totalPrice = json['total_price'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer'] = this.customer;
    data['total_price'] = this.totalPrice;
    data['created_at'] = this.createdAt;
    return data;
  }
}
