class CheckUser {
  CheckUser({
    this.message,
    this.user,
    this.status,
  });

  Message message;
  User user;
  bool status;

  factory CheckUser.fromMap(Map<String, dynamic> json) => CheckUser(
        message:
            json["message"] == null ? null : Message.fromMap(json["message"]),
        user: json["user"] == null ? null : User.fromMap(json["user"]),
        status: json["status"] == null ? null : json["status"],
      );
}

class Message {
  Message({
    this.account,
    this.store,
  });

  int account;
  int store;

  factory Message.fromMap(Map<String, dynamic> json) => Message(
        account: json["account"] == null ? null : json["account"],
        store: json["store"] == null ? null : json["store"],
      );
}

class User {
  User({
    this.id,
    this.phone,
    this.firstName,
    this.lastName,
    this.city,
    this.province,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String phone;
  String firstName;
  String lastName;
  String city;
  String province;
  String type;
  DateTime createdAt;
  DateTime updatedAt;

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"] == null ? null : json["id"],
        phone: json["phone"] == null ? null : json["phone"],
        firstName: json["firstName"] == null ? null : json["firstName"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        city: json["city"] == null ? null : json["city"],
        province: json["Province"] == null ? null : json["Province"],
        type: json["type"] == null ? null : json["type"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );
}
