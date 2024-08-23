class DashboardModel {
  bool? success;
  String? message;
  Data? data;

  DashboardModel({this.success, this.message, this.data});

  DashboardModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = Data.fromJson(json['data']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? totalVendor;
  int? totalCustomer;
  int? totalBalance;
  int? totalReceivableAmount;
  int? totalPayableAmount;
  int? totalAvailableStock;

  Data(
      {this.totalVendor,
      this.totalCustomer,
      this.totalBalance,
      this.totalReceivableAmount,
      this.totalPayableAmount,
      this.totalAvailableStock});

  Data.fromJson(Map<String, dynamic> json) {
    totalVendor = json['totalVendor'];
    totalCustomer = json['totalCustomer'];
    totalBalance = json['totalBalance'];
    totalReceivableAmount = json['totalReceivableAmount'];
    totalPayableAmount = json['totalPayableAmount'];
    totalAvailableStock = json['totalAvailableStock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalVendor'] = this.totalVendor;
    data['totalCustomer'] = this.totalCustomer;
    data['totalBalance'] = this.totalBalance;
    data['totalReceivableAmount'] = this.totalReceivableAmount;
    data['totalPayableAmount'] = this.totalPayableAmount;
    data['totalAvailableStock'] = this.totalAvailableStock;
    return data;
  }
}
