import 'package:flutter/material.dart';
import 'package:t2/item.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key, required this.onEdit, required this.todo});
  final void Function(TodoModel todo) onEdit;
  final TodoModel todo;
  @override
  State<EditScreen> createState() => _EditScreenState();
}

TextEditingController titles = TextEditingController();
TextEditingController contents = TextEditingController();

class _EditScreenState extends State<EditScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titles.text = widget.todo.title;
    contents.text = widget.todo.content;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        child: Column(
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: titles,
                  decoration: const InputDecoration(hintText: "title"),
                  validator: (value) {
                    var newValue = value ?? "";
                    if (newValue.isEmpty) {
                      return 'title is Required';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: contents,
                  decoration: const InputDecoration(hintText: "Content"),
                  validator: (value) {
                    var newValue = value ?? "";
                    if (newValue.isEmpty) {
                      return 'Content is Required';
                    }
                    return null;
                  },
                ),
              ),
            ),
            MaterialButton(
              color: Colors.red,
              onPressed: () {
                ///Này là pop, mang theo giá trị [controller.text] về màn hình trước
                ///Màn hình trước là màn hình nào?
                ///tức là màn hình mà bạn dùng lệnh "Push" hay "pushnamed" để tới màn hình này ấy.
                Navigator.pop(
                  context,
                );
                widget.onEdit(
                    TodoModel(title: titles.text, content: contents.text));
              },
              child: const Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}
