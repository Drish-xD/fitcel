class User {
  final int id;
  final String uuid;
  final String email;
  final String createdAt;
  final String updatedAt;
  final int dietId;

  const User(
      {required this.id,
      required this.uuid,
      required this.email,
      required this.createdAt,
      required this.updatedAt,
      required this.dietId});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      uuid: json['uuid'],
      email: json['email'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      dietId: json['diet_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uuid'] = uuid;
    data['email'] = email;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['diet_id'] = dietId;
    return data;
  }
}
