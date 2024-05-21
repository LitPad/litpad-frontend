import 'models.dart';

class User {
  final String id;
  String firstName;
  String lastName;
  String email;
  String token;
  String avatar;
  String bio;
  String username;
  String accountType;
  List<Follower> followers;
  List<Following> followings;

  User({
    required this.email,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.token,
    required this.avatar,
    required this.bio,
    required this.username,
    required this.accountType,
    required this.followers,
    required this.followings,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      email: map['email'] ?? '',
      id: map['id'] ?? '',
      lastName: map['last_name'] ?? '',
      firstName: map['first_name'] ?? '',
      token: map['token'] ?? '',
      avatar: map['avatar'] ?? '',
      bio: map['bio'] ?? '',
      username: map['username'] ?? '',
      accountType: map['account_type'] ?? '',
      followers: List<Follower>.from(map['followers']?.map((x) => Follower.fromMap(x)) ?? []),
      followings: List<Following>.from(map['followings']?.map((x) => Following.fromMap(x)) ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'token': token,
      'avatar': avatar,
      'bio': bio,
      'username': username,
      'account_type': accountType,
      'followers': followers.map((x) => x.toMap()).toList(),
      'followings': followings.map((x) => x.toMap()).toList(),
    };
  }

  @override
  String toString() => 'ID: $id, Name: $firstName $lastName';
}


