class OrderModel {
  List<Products> products;
  int totalPrice;
  int discount;
  String clientName;
  String clientAddress;
  String clientPhone;
  String paymentStatus;
  String orderStatus;
  String paymentMethod;
  String userId;
  String specialRequest;

  OrderModel(
      {this.products,
      this.totalPrice,
      this.discount,
      this.clientName,
      this.clientAddress,
      this.clientPhone,
      this.paymentStatus,
      this.orderStatus,
      this.paymentMethod,
      this.userId,
      this.specialRequest});

  OrderModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = new List<Products>();
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
    totalPrice = json['total_price'];
    discount = json['discount'];
    clientName = json['client_name'];
    clientAddress = json['client_address'];
    clientPhone = json['client_phone'];
    paymentStatus = json['payment_status'];
    orderStatus = json['order_status'];
    paymentMethod = json['payment_method'];
    userId = json['user_id'];
    specialRequest = json['special_request'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    data['total_price'] = this.totalPrice;
    data['discount'] = this.discount;
    data['client_name'] = this.clientName;
    data['client_address'] = this.clientAddress;
    data['client_phone'] = this.clientPhone;
    data['payment_status'] = this.paymentStatus;
    data['order_status'] = this.orderStatus;
    data['payment_method'] = this.paymentMethod;
    data['user_id'] = this.userId;
    data['special_request'] = this.specialRequest;
    return data;
  }
}

class Products {
  int sID;
  String cID;
  int pID;
  int quantity;
  List<Optional> optional;

  Products({this.sID, this.cID, this.pID, this.quantity, this.optional});

  Products.fromJson(Map<String, dynamic> json) {
    sID = json['sID'];
    cID = json['cID'];
    pID = json['pID'];
    quantity = json['quantity'];
    if (json['optional'] != null) {
      optional = new List<Optional>();
      json['optional'].forEach((v) {
        optional.add(new Optional.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sID'] = this.sID;
    data['cID'] = this.cID;
    data['pID'] = this.pID;
    data['quantity'] = this.quantity;
    if (this.optional != null) {
      data['optional'] = this.optional.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Optional {
  String name;
  int price;

  Optional({this.name, this.price});

  Optional.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    return data;
  }
}
