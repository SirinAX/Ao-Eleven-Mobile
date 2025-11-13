// To parse this JSON data, do
//
//     final productEntry = productEntryFromJson(jsonString);

import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

String productEntryToJson(List<ProductEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
    int id;
    String name;
    String description;
    int price;
    int stock;
    String thumbnail;
    String category;
    bool isFeatured;
    String brand;
    int rating;
    String url;
    int ownerId;
    String ownerUsername;
    DateTime createdAt;

    ProductEntry({
        required this.id,
        required this.name,
        required this.description,
        required this.price,
        required this.stock,
        required this.thumbnail,
        required this.category,
        required this.isFeatured,
        required this.brand,
        required this.rating,
        required this.url,
        required this.ownerId,
        required this.ownerUsername,
        required this.createdAt,
    });

    factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        stock: json["stock"],
        thumbnail: json["thumbnail"],
        category: json["category"],
        isFeatured: json["is_featured"],
        brand: json["brand"],
        rating: json["rating"],
        url: json["url"],
        ownerId: json["owner_id"],
        ownerUsername: json["owner_username"],
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "stock": stock,
        "thumbnail": thumbnail,
        "category": category,
        "is_featured": isFeatured,
        "brand": brand,
        "rating": rating,
        "url": url,
        "owner_id": ownerId,
        "owner_username": ownerUsername,
        "created_at": createdAt.toIso8601String(),
    };
}
