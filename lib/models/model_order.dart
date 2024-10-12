class ModelOrder {
  int? id;
  int? userId;
  String? firstMed;
  String? quantity1;
  String? price1;
  String? secondMed;
  String? quantity2;
  String? price2;
  String? thirdMed;
  String? quantity3;
  String? price3;
  String? fourthMed;
  String? quantity4;
  String? price4;
  String? fifthMed;
  String? quantity5;
  String? price5;
  String? orderSatatus;
  String? paymentStatus;
  String? totalPrice;
  String? createdAt;
  String? updatedAt;

  ModelOrder({this.id, this.userId, this.firstMed, this.quantity1, this.price1, this.secondMed, this.quantity2, this.price2, this.thirdMed, this.quantity3, this.price3, this.fourthMed, this.quantity4, this.price4, this.fifthMed, this.quantity5, this.price5, this.orderSatatus, this.paymentStatus, this.totalPrice, this.createdAt, this.updatedAt});

  ModelOrder.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    userId = json["user_id"];
    firstMed = json["first_med"];
    quantity1 = json["quantity1"];
    price1 = json["price1"];
    secondMed = json["second_med"];
    quantity2 = json["quantity2"];
    price2 = json["price2"];
    thirdMed = json["third_med"];
    quantity3 = json["quantity3"];
    price3 = json["price3"];
    fourthMed = json["fourth_med"];
    quantity4 = json["quantity4"];
    price4 = json["price4"];
    fifthMed = json["fifth_med"];
    quantity5 = json["quantity5"];
    price5 = json["price5"];
    orderSatatus = json["order_satatus"];
    paymentStatus = json["payment_status"];
    totalPrice = json["total_price"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["user_id"] = userId;
    _data["first_med"] = firstMed;
    _data["quantity1"] = quantity1;
    _data["price1"] = price1;
    _data["second_med"] = secondMed;
    _data["quantity2"] = quantity2;
    _data["price2"] = price2;
    _data["third_med"] = thirdMed;
    _data["quantity3"] = quantity3;
    _data["price3"] = price3;
    _data["fourth_med"] = fourthMed;
    _data["quantity4"] = quantity4;
    _data["price4"] = price4;
    _data["fifth_med"] = fifthMed;
    _data["quantity5"] = quantity5;
    _data["price5"] = price5;
    _data["order_satatus"] = orderSatatus;
    _data["payment_status"] = paymentStatus;
    _data["total_price"] = totalPrice;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    return _data;
  }
}