class UserModel {
  bool? status;
  String? message;
  Data? data;

  UserModel({this.status, this.message, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  User? user;
  String? token;

  Data({this.user, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class User {
  int? id;
  String? fullName;
  String? email;
  Null? emailVerifiedAt;
  String? mobileNo;
  String? photoUrl;
  int? notification;
  String? timeZone;
  Null? googleId;
  Null? googleToken;
  Null? googleRefreshToken;
  Null? googleExpiresIn;
  Null? appleToken;
  Null? userRole;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
        this.fullName,
        this.email,
        this.emailVerifiedAt,
        this.mobileNo,
        this.photoUrl,
        this.notification,
        this.timeZone,
        this.googleId,
        this.googleToken,
        this.googleRefreshToken,
        this.googleExpiresIn,
        this.appleToken,
        this.userRole,
        this.createdAt,
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    mobileNo = json['mobile_no'];
    photoUrl = json['photo_url'];
    notification = json['notification'];
    timeZone = json['time_zone'];
    googleId = json['google_id'];
    googleToken = json['google_token'];
    googleRefreshToken = json['google_refresh_token'];
    googleExpiresIn = json['google_expires_in'];
    appleToken = json['apple_token'];
    userRole = json['user_role'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['mobile_no'] = this.mobileNo;
    data['photo_url'] = this.photoUrl;
    data['notification'] = this.notification;
    data['time_zone'] = this.timeZone;
    data['google_id'] = this.googleId;
    data['google_token'] = this.googleToken;
    data['google_refresh_token'] = this.googleRefreshToken;
    data['google_expires_in'] = this.googleExpiresIn;
    data['apple_token'] = this.appleToken;
    data['user_role'] = this.userRole;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
