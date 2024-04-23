
//Todo: Details to be modified to suit backend details
class User {
  final String id;
  String firstName;
  String lastName;
  String email;
  String token;

  User(
      {required this.email,
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.token,
     });

  factory User.fromMap(Map<dynamic, dynamic> map) {
    return User(
      email: map['email'] ?? '',
      id: map['id'] ?? '',
      lastName: map['last_name'] ?? '',
      firstName: map['first_name'] ?? '',
      token: map['token'] ?? '',
    );
  }

  Map<String, String?> toMap() {
    return {
      'email': email,
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'token': token,

    };
  }

  @override
  String toString() => 'ID: $id, Name: $firstName $lastName';
}
