class HomeModel {
  int donorMode;
  int totalRequest;
  int totalDonor;
  int totalNotifications;
  List<RecentActivities> recentActivities;

  HomeModel(
      {this.donorMode,
        this.totalRequest,
        this.totalDonor,
        this.totalNotifications,
        this.recentActivities});

  HomeModel.fromJson(Map<String, dynamic> json) {
    donorMode = json['donorMode'];
    totalRequest = json['totalRequest'];
    totalDonor = json['totalDonor'];
    totalNotifications = json['totalNotifications'];
    if (json['recentActivities'] != null) {
      recentActivities = new List<RecentActivities>();
      json['recentActivities'].forEach((v) {
        recentActivities.add(new RecentActivities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['donorMode'] = this.donorMode;
    data['totalRequest'] = this.totalRequest;
    data['totalDonor'] = this.totalDonor;
    data['totalNotifications'] = this.totalNotifications;
    if (this.recentActivities != null) {
      data['recentActivities'] =
          this.recentActivities.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RecentActivities {
  Activity activity;
  User user;
  int reacts;

  RecentActivities({this.activity, this.user, this.reacts});

  RecentActivities.fromJson(Map<String, dynamic> json) {
    activity = json['activity'] != null
        ? new Activity.fromJson(json['activity'])
        : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    reacts = json['reacts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.activity != null) {
      data['activity'] = this.activity.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['reacts'] = this.reacts;
    return data;
  }
}

class Activity {
  int id;
  String address;
  String image;
  String time;
  int userId;
  String description;

  Activity(
      {this.id,
        this.address,
        this.image,
        this.time,
        this.userId,
        this.description});

  Activity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    image = json['image'];
    time = json['time'];
    userId = json['userId'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['address'] = this.address;
    data['image'] = this.image;
    data['time'] = this.time;
    data['userId'] = this.userId;
    data['description'] = this.description;
    return data;
  }
}

class User {
  int id;
  String name;
  String phone;
  String gender;
  String email;
  String address;
  String bloodGroup;
  int socialLogin;
  Null socialId;
  String image;
  int contactVisiable;
  int donorMode;
  String zipCode;
  String division;

  User(
      {this.id,
        this.name,
        this.phone,
        this.gender,
        this.email,
        this.address,
        this.bloodGroup,
        this.socialLogin,
        this.socialId,
        this.image,
        this.contactVisiable,
        this.donorMode,
        this.zipCode,
        this.division});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    gender = json['gender'];
    email = json['email'];
    address = json['address'];
    bloodGroup = json['bloodGroup'];
    socialLogin = json['socialLogin'];
    socialId = json['socialId'];
    image = json['image'];
    contactVisiable = json['contactVisiable'];
    donorMode = json['donorMode'];
    zipCode = json['zipCode'];
    division = json['division'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['gender'] = this.gender;
    data['email'] = this.email;
    data['address'] = this.address;
    data['bloodGroup'] = this.bloodGroup;
    data['socialLogin'] = this.socialLogin;
    data['socialId'] = this.socialId;
    data['image'] = this.image;
    data['contactVisiable'] = this.contactVisiable;
    data['donorMode'] = this.donorMode;
    data['zipCode'] = this.zipCode;
    data['division'] = this.division;
    return data;
  }
}
