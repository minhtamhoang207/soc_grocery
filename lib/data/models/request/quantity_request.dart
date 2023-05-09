import 'dart:convert';

QuantityRequest quantityRequestFromJson(String str) =>
    QuantityRequest.fromJson(json.decode(str));

String quantityRequestToJson(QuantityRequest data) =>
    json.encode(data.toJson());

class QuantityRequest {
  final int quantity;

  QuantityRequest({
    this.quantity = 1,
  });

  factory QuantityRequest.fromJson(Map<String, dynamic> json) =>
      QuantityRequest(
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() =>
      {
        "quantity": quantity,
      };
}
