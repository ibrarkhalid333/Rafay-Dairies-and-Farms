class PaymentModel {
  bool? success;
  List<Data>? data;
  String? message;

  PaymentModel({this.success, this.data, this.message});

  PaymentModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? type;
  String? date;
  String? amount;
  String? balance;

  Data({this.type, this.date, this.amount, this.balance});

  Data.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    date = json['date'];
    amount = json['amount'];
    balance = json['balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['date'] = this.date;
    data['amount'] = this.amount;
    data['balance'] = this.balance;
    return data;
  }
}
