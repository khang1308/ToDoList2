import 'package:flutter/material.dart';
import 'package:t2/edit.dart';

import 'package:t2/add.dart';
import 'package:t2/item.dart';

class SaveTodo extends StatefulWidget {
  const SaveTodo({super.key});

  @override
  State<SaveTodo> createState() => _SaveTodoState();
}

class _SaveTodoState extends State<SaveTodo> {
  List<TodoModel> todolist = [];
  // => List of items that come form next page.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Hello"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddList(onAdd: (todoCuaKhang) {
                setState(() {
                  todolist.add(todoCuaKhang);
                });
              }),
            ),
          );
          child:
          const Icon(Icons.add);
        }),
        body: todolist.isNotEmpty
            ? Column(children: [
                Expanded(
                    child: ListView.builder(
                        itemCount: todolist.length,
                        itemBuilder: ((context, index) {
                          return Container(
                            margin: const EdgeInsets.only(
                                top: 10, left: 10, right: 10),
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            height: 80,
                            decoration: BoxDecoration(
                                color: Colors.pinkAccent,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: ListTile(
                                title: Text(todolist[index].title),
                                subtitle: Text(todolist[index].content),
                                leading: const Icon(Icons.emoji_people),
                                trailing: SizedBox(
                                  width: 200,
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                          onTap: () async {
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return EditScreen(
                                                    todo: todolist[index],
                                                    onEdit:
                                                        (todoCuaKhang) async {
                                                      setState(() {
                                                        todolist[index] =
                                                            todoCuaKhang;
                                                      });
                                                    },
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                          child: const Icon(Icons.edit)),
                                      InkWell(
                                          onTap: () {
                                            setState(() {
                                              todolist.removeAt(index);
                                            });
                                          },
                                          child: Icon(
                                              Icons.delete_forever_outlined))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        })))
              ])
            : const Center(
                child: Text("No Record Found"),
              ));
  }
}
