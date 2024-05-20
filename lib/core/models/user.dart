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

class Follower {
  String accountType;
  String avatar;
  int followersCount;
  String name;
  int storiesCount;
  String username;

  Follower({
    required this.accountType,
    required this.avatar,
    required this.followersCount,
    required this.name,
    required this.storiesCount,
    required this.username,
  });

  factory Follower.fromMap(Map<String, dynamic> map) {
    return Follower(
      accountType: map['account_type'] ?? '',
      avatar: map['avatar'] ?? '',
      followersCount: map['followers_count'] ?? 0,
      name: map['name'] ?? '',
      storiesCount: map['stories_count'] ?? 0,
      username: map['username'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'account_type': accountType,
      'avatar': avatar,
      'followers_count': followersCount,
      'name': name,
      'stories_count': storiesCount,
      'username': username,
    };
  }
}

class Following {
  String accountType;
  String avatar;
  int followersCount;
  String name;
  int storiesCount;
  String username;

  Following({
    required this.accountType,
    required this.avatar,
    required this.followersCount,
    required this.name,
    required this.storiesCount,
    required this.username,
  });

  factory Following.fromMap(Map<String, dynamic> map) {
    return Following(
      accountType: map['account_type'] ?? '',
      avatar: map['avatar'] ?? '',
      followersCount: map['followers_count'] ?? 0,
      name: map['name'] ?? '',
      storiesCount: map['stories_count'] ?? 0,
      username: map['username'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'account_type': accountType,
      'avatar': avatar,
      'followers_count': followersCount,
      'name': name,
      'stories_count': storiesCount,
      'username': username,
    };
  }
}
