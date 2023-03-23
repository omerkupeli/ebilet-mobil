// To parse this JSON data, do
//
//     final events = eventsFromJson(jsonString);

import 'dart:convert';

Events eventsFromJson(String str) => Events.fromJson(json.decode(str));

String eventsToJson(Events data) => json.encode(data.toJson());

class Events {
  Events({
    this.id,
    this.name,
    this.merchantId,
    this.categoryId,
    this.minPrice,
    this.seats,
    this.tags,
    this.description,
    this.startDate,
    this.endDate,
    this.location,
    this.image,
    this.status,
    this.createdAt,
    this.deletedAt,
    this.products,
    this.merchant,
    this.category,
  });

  int? id;
  String? name;
  int? merchantId;
  int? categoryId;
  int? minPrice;
  dynamic seats;
  dynamic tags;
  String? description;
  DateTime? startDate;
  DateTime? endDate;
  String? location;
  String? image;
  int? status;
  DateTime? createdAt;
  dynamic deletedAt;
  List<Product>? products;
  Merchant? merchant;
  dynamic category;

  Events copyWith({
    int? id,
    String? name,
    int? merchantId,
    int? categoryId,
    int? minPrice,
    dynamic seats,
    dynamic tags,
    String? description,
    DateTime? startDate,
    DateTime? endDate,
    String? location,
    String? image,
    int? status,
    DateTime? createdAt,
    dynamic deletedAt,
    List<Product>? products,
    Merchant? merchant,
    dynamic category,
  }) =>
      Events(
        id: id ?? this.id,
        name: name ?? this.name,
        merchantId: merchantId ?? this.merchantId,
        categoryId: categoryId ?? this.categoryId,
        minPrice: minPrice ?? this.minPrice,
        seats: seats ?? this.seats,
        tags: tags ?? this.tags,
        description: description ?? this.description,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        location: location ?? this.location,
        image: image ?? this.image,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        deletedAt: deletedAt ?? this.deletedAt,
        products: products ?? this.products,
        merchant: merchant ?? this.merchant,
        category: category ?? this.category,
      );

  factory Events.fromJson(Map<String, dynamic> json) => Events(
    id: json["id"],
    name: json["name"],
    merchantId: json["merchant_id"],
    categoryId: json["category_id"],
    minPrice: json["min_price"],
    seats: json["seats"],
    tags: json["tags"],
    description: json["description"],
    startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
    endDate: json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
    location: json["location"],
    image: json["image"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    deletedAt: json["deleted_at"],
    products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
    merchant: json["merchant"] == null ? null : Merchant.fromJson(json["merchant"]),
    category: json["category"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "merchant_id": merchantId,
    "category_id": categoryId,
    "min_price": minPrice,
    "seats": seats,
    "tags": tags,
    "description": description,
    "start_date": startDate?.toIso8601String(),
    "end_date": endDate?.toIso8601String(),
    "location": location,
    "image": image,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "deleted_at": deletedAt,
    "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
    "merchant": merchant?.toJson(),
    "category": category,
  };
}

class Merchant {
  Merchant({
    this.id,
    this.adminId,
    this.merchantName,
    this.countryId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? adminId;
  String? merchantName;
  int? countryId;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  Merchant copyWith({
    int? id,
    int? adminId,
    String? merchantName,
    int? countryId,
    dynamic deletedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Merchant(
        id: id ?? this.id,
        adminId: adminId ?? this.adminId,
        merchantName: merchantName ?? this.merchantName,
        countryId: countryId ?? this.countryId,
        deletedAt: deletedAt ?? this.deletedAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Merchant.fromJson(Map<String, dynamic> json) => Merchant(
    id: json["id"],
    adminId: json["admin_id"],
    merchantName: json["merchant_name"],
    countryId: json["country_id"],
    deletedAt: json["deleted_at"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "admin_id": adminId,
    "merchant_name": merchantName,
    "country_id": countryId,
    "deleted_at": deletedAt,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class Product {
  Product({
    this.id,
    this.name,
    this.description,
    this.price,
    this.status,
    this.eventId,
    this.categoryId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? description;
  int? price;
  int? status;
  int? eventId;
  int? categoryId;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  Product copyWith({
    int? id,
    String? name,
    String? description,
    int? price,
    int? status,
    int? eventId,
    int? categoryId,
    dynamic deletedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Product(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        price: price ?? this.price,
        status: status ?? this.status,
        eventId: eventId ?? this.eventId,
        categoryId: categoryId ?? this.categoryId,
        deletedAt: deletedAt ?? this.deletedAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    price: json["price"],
    status: json["status"],
    eventId: json["event_id"],
    categoryId: json["category_id"],
    deletedAt: json["deleted_at"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "price": price,
    "status": status,
    "event_id": eventId,
    "category_id": categoryId,
    "deleted_at": deletedAt,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
