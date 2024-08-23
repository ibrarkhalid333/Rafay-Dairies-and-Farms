class ExpenseModel {
  bool? success;
  String? message;
  List<Data>? data;
  int? totalCount;

  ExpenseModel({this.success, this.message, this.data, this.totalCount});

  ExpenseModel.fromJson(Map<String, dynamic> json) {
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
  String? amount;
  String? description;
  String? createdAt;
  int? isDeleted;
  int? isActive;

  Data(
      {this.id,
      this.amount,
      this.description,
      this.createdAt,
      this.isDeleted,
      this.isActive});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    description = json['description'];
    createdAt = json['created_at'];
    isDeleted = json['is_deleted'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['amount'] = this.amount;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['is_deleted'] = this.isDeleted;
    data['is_active'] = this.isActive;
    return data;
  }
}
