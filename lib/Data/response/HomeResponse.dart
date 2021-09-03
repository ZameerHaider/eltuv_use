class HomeObject {
  HomeObject({
    this.message,
    this.response,
    this.status,
  });

  String message;
  Response response;
  bool status;

  factory HomeObject.fromMap(Map<String, dynamic> json) => HomeObject(
        message: json["message"] == null ? null : json["message"],
        response: json["response"] == null
            ? null
            : Response.fromMap(json["response"]),
        status: json["status"] == null ? null : json["status"],
      );
}

class Response {
  Response({
    this.services,
    this.sliders,
    this.stores,
  });

  List<Service> services;
  List<Service> sliders;
  List<Store> stores;

  factory Response.fromMap(Map<String, dynamic> json) => Response(
        services: json["services"] == null
            ? null
            : List<Service>.from(
                json["services"].map((x) => Service.fromMap(x))),
        sliders: json["sliders"] == null
            ? null
            : List<Service>.from(
                json["sliders"].map((x) => Service.fromMap(x))),
        stores: json["stores"] == null
            ? null
            : List<Store>.from(json["stores"].map((x) => Store.fromMap(x))),
      );
}

class Service {
  Service({
    this.id,
    this.serviceName,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.name,
  });

  int id;
  String serviceName;
  String image;
  DateTime createdAt;
  DateTime updatedAt;
  String name;

  factory Service.fromMap(Map<String, dynamic> json) => Service(
        id: json["id"] == null ? null : json["id"],
        serviceName: json["serviceName"] == null ? null : json["serviceName"],
        image: json["image"] == null ? null : json["image"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        name: json["name"] == null ? null : json["name"],
      );
}

class Store {
  Store({
    this.id,
    this.number,
    this.category,
    this.storeName,
    this.address,
    this.latitude,
    this.longitude,
    this.minOrder,
    this.openTime,
    this.closeTime,
    this.food,
    this.rating,
    this.status,
    this.ratingCount,
    this.createdAt,
    this.updatedAt,
    this.images,
    this.collection,
  });

  int id;
  String number;
  String category;
  String storeName;
  String address;
  dynamic latitude;
  dynamic longitude;
  String minOrder;
  String openTime;
  String closeTime;
  List<String> food;
  String rating;
  String status;
  int ratingCount;
  DateTime createdAt;
  DateTime updatedAt;
  List<String> images;
  List<Collection> collection;

  factory Store.fromMap(Map<String, dynamic> json) => Store(
        id: json["id"] == null ? null : json["id"],
        number: json["number"] == null ? null : json["number"],
        category: json["category"] == null ? null : json["category"],
        storeName: json["storeName"] == null ? null : json["storeName"],
        address: json["address"] == null ? null : json["address"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        minOrder: json["minOrder"] == null ? null : json["minOrder"],
        openTime: json["openTime"] == null ? null : json["openTime"],
        closeTime: json["closeTime"] == null ? null : json["closeTime"],
        food: json["food"] == null
            ? null
            : List<String>.from(json["food"].map((x) => x)),
        rating: json["rating"] == null ? null : json["rating"],
        status: json["status"] == null ? null : json["status"],
        ratingCount: json["ratingCount"] == null ? null : json["ratingCount"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        images: json["images"] == null
            ? null
            : List<String>.from(json["images"].map((x) => x)),
        collection: json["collection"] == null
            ? null
            : List<Collection>.from(
                json["collection"].map((x) => Collection.fromMap(x))),
      );
}

class Collection {
  Collection({
    this.id,
    this.sId,
    this.name,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.collectionProducts,
    this.isSelected = false,
  });

  int id;
  String sId;
  String name;
  String image;
  DateTime createdAt;
  DateTime updatedAt;
  List<CollectionProduct> collectionProducts;
  bool isSelected = false;

  factory Collection.fromMap(Map<String, dynamic> json) => Collection(
        id: json["id"] == null ? null : json["id"],
        sId: json["sID"] == null ? null : json["sID"],
        name: json["name"] == null ? null : json["name"],
        image: json["image"] == null ? null : json["image"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        collectionProducts: json["collection_products"] == null
            ? null
            : List<CollectionProduct>.from(json["collection_products"]
                .map((x) => CollectionProduct.fromMap(x))),
      );
}

class CollectionProduct {
  CollectionProduct({
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
    this.productOptional,
  });

  int id;
  String sId;
  Name collection;
  String title;
  String price;
  String discount;
  String description;
  String image;
  String optional;
  DateTime createdAt;
  DateTime updatedAt;
  List<ProductOptional> productOptional;

  factory CollectionProduct.fromMap(Map<String, dynamic> json) =>
      CollectionProduct(
        id: json["id"] == null ? null : json["id"],
        sId: json["sID"] == null ? null : json["sID"],
        collection: json["collection"] == null
            ? null
            : nameValues.map[json["collection"]],
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
        productOptional: json["product_optional"] == null
            ? null
            : List<ProductOptional>.from(json["product_optional"]
                .map((x) => ProductOptional.fromMap(x))),
      );
}

enum Name { BURGER, HAMZA }

final nameValues = EnumValues({"Burger": Name.BURGER, "hamza": Name.HAMZA});

class ProductOptional {
  ProductOptional({
    this.id,
    this.productId,
    this.name,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.isoptSelected = false,
  });

  int id;
  String productId;
  String name;
  String price;
  DateTime createdAt;
  DateTime updatedAt;
  bool isoptSelected = false;

  factory ProductOptional.fromMap(Map<String, dynamic> json) => ProductOptional(
        id: json["id"] == null ? null : json["id"],
        productId: json["product_id"] == null ? null : json["product_id"],
        name: json["name"] == null ? null : json["name"],
        price: json["price"] == null ? null : json["price"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
