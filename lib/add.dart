// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import 'item.dart';

class AddList extends StatefulWidget {
  const AddList({super.key, required this.onAdd});
  final void Function(TodoModel todo) onAdd;

  @override
  State<AddList> createState() => _AddListState();
}

// Creating a Class and constructor.
class Todo {
  late String title_Ctr;
  late String desc_Ctr;
  Todo({required this.title_Ctr, required this.desc_Ctr});
}

class _AddListState extends State<AddList> {
  // Creating a TextEditingController for two Fiends,
  //one is for title TextField and second is for Description TextField.
  TextEditingController titleCtr = TextEditingController();
  TextEditingController contents = TextEditingController();

  // Creating a Method for Passing a data to back page.
  OnPressed(BuildContext context) {
    var data = Todo(title_Ctr: titleCtr.text, desc_Ctr: contents.text);
    Navigator.pop(context, data);
    final TodoModel todoCuaKhang =
        TodoModel(title: titleCtr.text, content: contents.text);
    widget.onAdd.call(todoCuaKhang);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Add Data")),
        body: Form(child: Builder(builder: (context) {
          return Column(children: [
            TextFormField(
              controller: titleCtr,
              decoration: const InputDecoration(hintText: "title"),
              validator: (value) {
                var newValue = value ?? "";
                if (newValue.isEmpty) {
                  return 'title is Required';
                }
                return null;
              },
            ),
            TextFormField(
              controller: contents,
              decoration: const InputDecoration(hintText: "Description"),
              validator: (value) {
                var newValue = value ?? "";
                if (newValue.isEmpty) {
                  return 'Discription is Required';
                }
                return null;
              },
            ),
            MaterialButton(
              color: Colors.red,
              onPressed: () {
                if (Form.of(context)?.validate() ?? false) {
                  OnPressed(context);
                }
              },
              child: const Text("Save"),
            )
          ]);
        })));
  }
}
