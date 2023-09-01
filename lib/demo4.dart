import 'package:flutter/material.dart';

class Demo4 extends StatefulWidget {
  const Demo4({super.key});

  @override
  State<Demo4> createState() => _Demo4State();
}

class _Demo4State extends State<Demo4> {
  var item = 1;
  var items = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) => TextButton(
            onPressed: () {
              setState(() {
                items.removeAt(index);
              });
            },
            child: Text('${items[index]}')),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                items.add(111);
              });
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                items.remove(111);
              });
            },
            child: const Icon(Icons.delete_forever_outlined),
          ),
        ],
      ),
    );
  }
}
