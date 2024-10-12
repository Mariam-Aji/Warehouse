class ModelMedicine {
  int? id;
  String? scientificName;
  String? commercialName;
  String? manufactureCompany;
  int? availableQuantity;
  String? expiryDate;
  int? price;
  String? image;
  int? category;
  int? warehouse;

  ModelMedicine(
      {this.id,
      this.scientificName,
      this.commercialName,
      this.manufactureCompany,
      this.availableQuantity,
      this.expiryDate,
      this.price,
      this.image,
      this.category,
      this.warehouse});

  ModelMedicine.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    scientificName = json["scientific_name"];
    commercialName = json["commercial_name"];
    manufactureCompany = json["manufacture_company"];
    availableQuantity = json["available_quantity"];
    expiryDate = json["expiry_date"];
    price = json["price"];
    image = json["image"];
    category = json["category"];
    warehouse = json["warehouse"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["scientific_name"] = scientificName;
    _data["commercial_name"] = commercialName;
    _data["manufacture_company"] = manufactureCompany;
    _data["available_quantity"] = availableQuantity;
    _data["expiry_date"] = expiryDate;
    _data["price"] = price;
    _data["image"] = image;
    _data["category"] = category;
    _data["warehouse"] = warehouse;
    return _data;
  }
}
