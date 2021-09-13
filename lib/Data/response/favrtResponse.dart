class MyFavrtsObject {
  MyFavrtsObject({
    this.response,
    this.status,
  });

  List<Response> response;
  bool status;

  factory MyFavrtsObject.fromMap(Map<String, dynamic> json) => MyFavrtsObject(
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
    this.title,
    this.price,
    this.discount,
    this.description,
    this.image,
  });

  int id;
  String title;
  String price;
  String discount;
  String description;
  String image;

  factory Response.fromMap(Map<String, dynamic> json) => Response(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        price: json["price"] == null ? null : json["price"],
        discount: json["discount"] == null ? null : json["discount"],
        description: json["description"] == null ? null : json["description"],
        image: json["image"] == null ? null : json["image"],
      );
}
