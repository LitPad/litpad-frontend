class SiteDetails {
  final String address;
  final String email;
  final String fb;
  final String ig;
  final String name;
  final String phone;
  final String tw;
  final String wh;

  SiteDetails({
    required this.address,
    required this.email,
    required this.fb,
    required this.ig,
    required this.name,
    required this.phone,
    required this.tw,
    required this.wh,
  });

  factory SiteDetails.fromMap(Map<String, dynamic> map) {
    return SiteDetails(
      address: map['address'] ?? '',
      email: map['email'] ?? '',
      fb: map['fb'] ?? '',
      ig: map['ig'] ?? '',
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      tw: map['tw'] ?? '',
      wh: map['wh'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'address': address,
      'email': email,
      'fb': fb,
      'ig': ig,
      'name': name,
      'phone': phone,
      'tw': tw,
      'wh': wh,
    };
  }
}
