class MyOrdersObject {
  MyOrdersObject({
    this.response,
    this.status,
  });

  List<Response> response;
  bool status;

  factory MyOrdersObject.fromMap(Map<String, dynamic> json) => MyOrdersObject(
        response: json["response"] == null
            ? null
            : List<Response>.from(
                json["response"].map((x) => Response.fromMap(x))),
        status: json["status"] == null ? null : json["status"],
      );
}

class Response {
  Response({
    this.id,
    this.active,
    this.clientName,
    this.clientPhone,
    this.clientAddress,
    this.status,
    this.paidAmount,
    this.price,
    this.deliveryFee,
    this.paymentStatus,
    this.paymentMethod,
    this.deliveryBoy,
    this.deliveryBoyPhone,
    this.specialRequest,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String active;
  String clientName;
  String clientPhone;
  String clientAddress;
  String status;
  String paidAmount;
  String price;
  dynamic deliveryFee;
  String paymentStatus;
  String paymentMethod;
  dynamic deliveryBoy;
  dynamic deliveryBoyPhone;
  String specialRequest;
  String userId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Response.fromMap(Map<String, dynamic> json) => Response(
        id: json["id"] == null ? null : json["id"],
        active: json["active"] == null ? null : json["active"],
        clientName: json["clientName"] == null ? null : json["clientName"],
        clientPhone: json["clientPhone"] == null ? null : json["clientPhone"],
        clientAddress:
            json["clientAddress"] == null ? null : json["clientAddress"],
        status: json["status"] == null ? null : json["status"],
        paidAmount: json["paidAmount"] == null ? null : json["paidAmount"],
        price: json["price"] == null ? null : json["price"],
        deliveryFee: json["deliveryFee"],
        paymentStatus:
            json["paymentStatus"] == null ? null : json["paymentStatus"],
        paymentMethod:
            json["paymentMethod"] == null ? null : json["paymentMethod"],
        deliveryBoy: json["deliveryBoy"],
        deliveryBoyPhone: json["deliveryBoyPhone"],
        specialRequest:
            json["specialRequest"] == null ? null : json["specialRequest"],
        userId: json["user_id"] == null ? null : json["user_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );
}
