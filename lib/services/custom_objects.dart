class Plans {
  final int celebId;
  final String name;
  final String avatar;
  final String dType;
  final String wType;

  const Plans({
    required this.celebId,
    required this.name,
    required this.avatar,
    required this.dType,
    required this.wType,
  });

  factory Plans.fromJson(Map<String, dynamic> json) {
    return Plans(
      celebId: json['name'],
      name: json['title'],
      avatar: json['avatar'],
      dType: json['diet_type'],
      wType: "intense",
    );
  }
}
