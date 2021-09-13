class MyOrdersDetailsObject {
  MyOrdersDetailsObject({
    this.response,
    this.status,
  });

  List<OrderDetails> response;
  bool status;

  factory MyOrdersDetailsObject.fromMap(Map<String, dynamic> json) =>
      MyOrdersDetailsObject(
        response: json["response"] == null
            ? null
            : List<OrderDetails>.from(
                json["response"].map((x) => OrderDetails.fromMap(x))),
        status: json["status"] == null ? null : json["status"],
      );
}

class OrderDetails {
  OrderDetails({
    this.id,
    this.orderId,
    this.storeId,
    this.collectionId,
    this.productId,
    this.quantity,
    this.price,
    this.orderTotal,
    this.createdAt,
    this.updatedAt,
    this.product,
  });

  int id;
  String orderId;
  String storeId;
  String collectionId;
  String productId;
  String quantity;
  String price;
  String orderTotal;
  DateTime createdAt;
  DateTime updatedAt;
  Product product;

  factory OrderDetails.fromMap(Map<String, dynamic> json) => OrderDetails(
        id: json["id"] == null ? null : json["id"],
        orderId: json["order_id"] == null ? null : json["order_id"],
        storeId: json["store_id"] == null ? null : json["store_id"],
        collectionId:
            json["collection_id"] == null ? null : json["collection_id"],
        productId: json["product_id"] == null ? null : json["product_id"],
        quantity: json["quantity"] == null ? null : json["quantity"],
        price: json["price"] == null ? null : json["price"],
        orderTotal: json["order_total"] == null ? null : json["order_total"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        product:
            json["product"] == null ? null : Product.fromMap(json["product"]),
      );
}

class Product {
  Product({
    this.id,
    this.sId,
    this.collection,
    this.title,
    this.price,
    this.discount,
    this.description,
    this.image,
    this.optional,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String sId;
  String collection;
  String title;
  String price;
  String discount;
  String description;
  String image;
  String optional;
  DateTime createdAt;
  DateTime updatedAt;

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"] == null ? null : json["id"],
        sId: json["sID"] == null ? null : json["sID"],
        collection: json["collection"] == null ? null : json["collection"],
        title: json["title"] == null ? null : json["title"],
        price: json["price"] == null ? null : json["price"],
        discount: json["discount"] == null ? null : json["discount"],
        description: json["description"] == null ? null : json["description"],
        image: json["image"] == null ? null : json["image"],
        optional: json["optional"] == null ? null : json["optional"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );
}
