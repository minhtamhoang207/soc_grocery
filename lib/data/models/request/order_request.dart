import 'dart:convert';

OrderRequest orderRequestFromJson(String str) =>
    OrderRequest.fromJson(json.decode(str));

String orderRequestToJson(OrderRequest data) => json.encode(data.toJson());

class OrderRequest {
  String token;
  String orderId;
  String customerNumber;
  int amount;
  List<ItemOrder> items;
  int tax;
  int discount;

  OrderRequest({
    required this.token,
    required this.orderId,
    required this.customerNumber,
    required this.amount,
    required this.items,
    required this.tax,
    required this.discount,
  });

  factory OrderRequest.fromJson(Map<String, dynamic> json) =>
      OrderRequest(
        token: json["token"],
        orderId: json["orderId"],
        customerNumber: json["customerNumber"],
        amount: json["amount"],
        items: List<ItemOrder>.from(json["items"].map((x) => ItemOrder.fromJson(x))),
        tax: json["tax"],
        discount: json["discount"],
      );

  Map<String, dynamic> toJson() =>
      {
        "token": token,
        "orderId": orderId,
        "customerNumber": customerNumber,
        "amount": amount,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "tax": tax,
        "discount": discount,
      };
}

class ItemOrder {
  String product;
  int quantity;

  ItemOrder({
    required this.product,
    required this.quantity,
  });

  factory ItemOrder.fromJson(Map<String, dynamic> json) =>
      ItemOrder(
        product: json["product"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() =>
      {
        "product": product,
        "quantity": quantity,
      };
}
