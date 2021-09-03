class UserModel {
  int id;
  String phone;
  String firstName;
  String lastName;
  String city;
  String type;
  String province;
  String createdAt;
  String updatedAt;

  UserModel(
      {this.id,
      this.phone,
      this.firstName,
      this.lastName,
      this.city,
      this.type,
      this.province,
      this.createdAt,
      this.updatedAt});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phone = json['phone'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    city = json['city'];
    type = json['type'];
    province = json['Province'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phone'] = this.phone;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['city'] = this.city;
    data['type'] = this.type;
    data['Province'] = this.province;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
