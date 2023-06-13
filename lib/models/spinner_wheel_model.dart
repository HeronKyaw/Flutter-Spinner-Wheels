class SpinnerWheel {
  int id;
  int userId;
  String title;
  List<String>? items;

  SpinnerWheel({
    required this.id,
    required this.userId,
    required this.title,
    required this.items,
  });

  factory SpinnerWheel.fromJson(Map<String, dynamic> json) {
    return SpinnerWheel(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      items: json['items'].cast<String>(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'userId': userId,
    'title': title,
    'items': items,
  };
}