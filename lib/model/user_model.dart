class UserData {
  String username;
  String email;

  UserData({required this.username, required this.email});

  Map<String, dynamic> toFirestore() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['email'] = email;
    return data;
  }

  factory UserData.fromFirestore(Map<String, dynamic> json) {
    return UserData(
      username: json['username'],
      email: json['email'],
    );
  }
}
