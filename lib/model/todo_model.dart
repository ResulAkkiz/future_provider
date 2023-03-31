class Todo {
  Todo({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userId,
  });

  int id;
  String todo;
  bool completed;
  int userId;

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        id: json["id"],
        todo: json["todo"],
        completed: json["completed"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "todo": todo,
        "completed": completed,
        "userId": userId,
      };
}