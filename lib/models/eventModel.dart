class Events {
  Data? data;

  Events({this.data});

  Events.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  int? merchantId;
  int? categoryId;
  int? minPrice;
  Null? seats;
  Null? tags;
  String? description;
  String? startDate;
  String? endDate;
  String? location;
  String? image;
  int? status;
  String? createdAt;
  Null? deletedAt;
  List<Products>? products;
  Merchant? merchant;
  Null? category;

  Data(
      {this.id,
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
      this.category});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    merchantId = json['merchant_id'];
    categoryId = json['category_id'];
    minPrice = json['min_price'];
    seats = json['seats'];
    tags = json['tags'];
    description = json['description'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    location = json['location'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    deletedAt = json['deleted_at'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    merchant = json['merchant'] != null
        ? new Merchant.fromJson(json['merchant'])
        : null;
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['merchant_id'] = this.merchantId;
    data['category_id'] = this.categoryId;
    data['min_price'] = this.minPrice;
    data['seats'] = this.seats;
    data['tags'] = this.tags;
    data['description'] = this.description;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['location'] = this.location;
    data['image'] = this.image;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['deleted_at'] = this.deletedAt;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    if (this.merchant != null) {
      data['merchant'] = this.merchant!.toJson();
    }
    data['category'] = this.category;
    return data;
  }
}

class Products {
  int? id;
  String? name;
  String? description;
  int? price;
  int? status;
  int? eventId;
  int? categoryId;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;

  Products(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.status,
      this.eventId,
      this.categoryId,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    status = json['status'];
    eventId = json['event_id'];
    categoryId = json['category_id'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['status'] = this.status;
    data['event_id'] = this.eventId;
    data['category_id'] = this.categoryId;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Merchant {
  int? id;
  int? adminId;
  String? merchantName;
  int? countryId;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;

  Merchant(
      {this.id,
      this.adminId,
      this.merchantName,
      this.countryId,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  Merchant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adminId = json['admin_id'];
    merchantName = json['merchant_name'];
    countryId = json['country_id'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['admin_id'] = this.adminId;
    data['merchant_name'] = this.merchantName;
    data['country_id'] = this.countryId;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
