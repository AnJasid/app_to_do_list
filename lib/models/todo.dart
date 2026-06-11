class Todo {
  String id;
  String title;
  bool isCompleted;

  Todo({
    required this.title,
    required this.id,
    this.isCompleted = false,
  });

  // Convert Todo to Map (JSON format)
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'id': id,
      'isCompleted': isCompleted,
    };
  }

  // Convert Map (JSON) to Todo
  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      title: json['title'],
      id: json['id'],
      isCompleted: json['isCompleted'],
    );
  }
}
