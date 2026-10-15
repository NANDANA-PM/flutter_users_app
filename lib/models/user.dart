class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final String companyName;
  final String companyCatchPhrase;

  const User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.companyName,
    required this.companyCatchPhrase,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    final address = (json['address'] as Map<String, dynamic>?) ?? {};
    final company = (json['company'] as Map<String, dynamic>?) ?? {};
    return User(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      username: json['username'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      website: json['website'] as String? ?? '',
      street: address['street'] as String? ?? '',
      suite: address['suite'] as String? ?? '',
      city: address['city'] as String? ?? '',
      zipcode: address['zipcode'] as String? ?? '',
      companyName: company['name'] as String? ?? '',
      companyCatchPhrase: company['catchPhrase'] as String? ?? '',
    );
  }

  String get fullAddress => '$suite, $street, $city - $zipcode';
}
