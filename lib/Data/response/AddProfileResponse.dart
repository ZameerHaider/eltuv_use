
import 'package:eltuv_use/Data/models/UserModel.dart';

class AddProfileResponse {
  String message;
  UserModel response;
  bool status;

  AddProfileResponse({this.message, this.response, this.status});

  AddProfileResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    response = json['response'] != null
        ? new UserModel.fromJson(json['response'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.response != null) {
      data['response'] = this.response.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}