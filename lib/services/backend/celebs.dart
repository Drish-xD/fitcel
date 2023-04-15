class Celebrity {
  final int id;
  final String name;
  final String avatar;
  final String dietype;

  const Celebrity({
    required this.id,
    required this.name,
    required this.avatar,
    required this.dietype,
  });

  factory Celebrity.fromJson(Map<String, dynamic> json) {
    return Celebrity(
      id: json['id'],
      name: json['name'],
      avatar: json['avatar'],
      dietype: json['diet_type'],
    );
  }
}
