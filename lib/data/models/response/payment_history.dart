// To parse this JSON data, do
//
//     final paymentHistory = paymentHistoryFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PaymentHistory paymentHistoryFromJson(String str) =>
    PaymentHistory.fromJson(json.decode(str));

String paymentHistoryToJson(PaymentHistory data) => json.encode(data.toJson());

class PaymentHistory {
  String id;
  String userId;
  List<Item> items;
  int discount;
  int tax;
  int subtotal;
  int total;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  PaymentHistory({
    required this.id,
    required this.userId,
    required this.items,
    required this.discount,
    required this.tax,
    required this.subtotal,
    required this.total,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PaymentHistory.fromJson(Map<String, dynamic> json) =>
      PaymentHistory(
        id: json["_id"],
        userId: json["userId"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        discount: json["discount"],
        tax: json["tax"],
        subtotal: json["subtotal"],
        total: json["total"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() =>
      {
        "_id": id,
        "userId": userId,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "discount": discount,
        "tax": tax,
        "subtotal": subtotal,
        "total": total,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class Item {
  String product;
  int quantity;
  DateTime createdAt;
  DateTime updatedAt;

  Item({
    required this.product,
    required this.quantity,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Item.fromJson(Map<String, dynamic> json) =>
      Item(
        product: json["product"],
        quantity: json["quantity"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() =>
      {
        "product": product,
        "quantity": quantity,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
