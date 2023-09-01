

class Todo {
  late String title_Ctr;
  late String content_Ctr;

  Todo({required this.title_Ctr, required this.content_Ctr});
}

class TodoModel {
  final String title;
  final String content;

  TodoModel({required this.title, required this.content});
  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(title: map["title"], content: map["content"]);
  }

  //để convert từ TodoModel => Map
  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "content": content,
    };
  }
}
