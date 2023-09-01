import 'package:flutter/material.dart';

class Demo2 extends StatefulWidget {
  const Demo2({super.key});

  @override
  State<Demo2> createState() => _Demo2State();
}

class _Demo2State extends State<Demo2> {
  var item = "aaaa";
  var items = [
    "aaaa",
    "bbbb",
    "cccc",
    'ddddd',
    "aaaa",
    "bbbb",
    "cccc",
    'ddddd'
  ];
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
            child: Text(items[index])),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                items.add('zzzzzzzzzz');
              });
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                items.remove('zzzzzzzzzz');
              });
            },
            child: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
