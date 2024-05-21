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
