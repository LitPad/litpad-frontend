
//Todo: Details to be modified to suit backend details
class User {
  final String id;
  String firstName;
  String lastName;
  String email;
  String token;
  String? phone;
  String? photoUrl;
  String? phoneVerifiedAt;

  User(
      {required this.email,
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.token,
        required this.phone,
        required this.photoUrl,
        required this.phoneVerifiedAt});

  factory User.fromMap(Map<dynamic, dynamic> map) {
    return User(
      email: map['email'] ?? '',
      id: map['id'] ?? '',
      lastName: map['last_name'] ?? '',
      firstName: map['first_name'] ?? '',
      phone: map['phone'] ?? '',
      token: map['token'] ?? '',
      phoneVerifiedAt: map['phone_verified_at'],
      photoUrl : map['avatar']?? '',
    );
  }

  Map<String, String?> toMap() {
    return {
      'email': email,
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
      'token': token,
      'phone_verified_at': phoneVerifiedAt,
      'avatar' : photoUrl
    };
  }

  @override
  String toString() => 'ID: $id, Name: $firstName $lastName';
}
