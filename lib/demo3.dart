import 'package:flutter/material.dart';

class Demo3 extends StatefulWidget {
  const Demo3({super.key});

  @override
  State<Demo3> createState() => _Demo3State();
}

class _Demo3State extends State<Demo3> {
  var item = 1;
  var items = [1, 2, 3, 4, 5, 6, 7];
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                items.add(10);
              });
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                items.remove(10);
              });
            },
            child: const Icon(Icons.delete_forever_outlined),
          ),
        ],
      ),
    );
  }
}
