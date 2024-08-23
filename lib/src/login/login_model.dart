class LoginModel {
  bool? success;
  Data? data;
  String? token;
  String? message;

  LoginModel({this.success, this.data, this.token, this.message});

  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    token = json['token'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['token'] = this.token;
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  String? role;
  String? firstName;
  String? lastName;
  String? email;
  String? emailVerifiedAt;
  int? isVerified;
  String? verifiedAt;
  int? isActive;
  int? isDeleted;
  Null? deletedAt;
  Null? lastLoginAt;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.role,
      this.firstName,
      this.lastName,
      this.email,
      this.emailVerifiedAt,
      this.isVerified,
      this.verifiedAt,
      this.isActive,
      this.isDeleted,
      this.deletedAt,
      this.lastLoginAt,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    role = json['role'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    isVerified = json['is_verified'];
    verifiedAt = json['verified_at'];
    isActive = json['is_active'];
    isDeleted = json['is_deleted'];
    deletedAt = json['deleted_at'];
    lastLoginAt = json['last_login_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['role'] = this.role;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['is_verified'] = this.isVerified;
    data['verified_at'] = this.verifiedAt;
    data['is_active'] = this.isActive;
    data['is_deleted'] = this.isDeleted;
    data['deleted_at'] = this.deletedAt;
    data['last_login_at'] = this.lastLoginAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
