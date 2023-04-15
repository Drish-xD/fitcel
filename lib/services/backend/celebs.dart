class Celebrity {
  final int id;
  final String name;
  final String avatar;
  final String dietType;

  const Celebrity({
    required this.id,
    required this.name,
    required this.avatar,
    required this.dietType,
  });

  factory Celebrity.fromJson(Map<String, dynamic> json) {
    return Celebrity(
      id: json['id'],
      name: json['name'],
      avatar: json['avatar'],
      dietType: json['diet_type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['avatar'] = avatar;
    data['diet_type'] = dietType;
    return data;
  }
}
