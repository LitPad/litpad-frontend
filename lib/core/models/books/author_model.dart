class Author {
  final String avatar;
  final String fullName;
  final String username;

  Author({required this.avatar, required this.fullName, required this.username});

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      avatar: json['avatar'] ?? '',
      fullName: json['full_name'] ?? '',
      username: json['username'] ?? '',
    );
  }
}
