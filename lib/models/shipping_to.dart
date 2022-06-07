class ShippingTo {
  int id;
  String address;
  String provinceAndCity;
  String postalCode;
  String country;
  bool active;

  ShippingTo({
    required this.id,
    required this.address,
    required this.provinceAndCity,
    required this.postalCode,
    required this.country,
    this.active = false,
  });

  factory ShippingTo.fromMap(Map<String, dynamic> data) {
    return ShippingTo(
      id: data['id'],
      address: data['address'],
      provinceAndCity: data['province_city'],
      postalCode: data['postal_code'],
      country: data['country'],
      active: data['active'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'address': address,
      'province_city': provinceAndCity,
      'postal_code': postalCode,
      'country': country,
      'active': active
    };
  }
}
