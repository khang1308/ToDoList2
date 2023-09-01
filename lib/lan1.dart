import 'package:flutter/material.dart';

class Lan1 extends StatefulWidget {
  const Lan1({super.key});

  @override
  State<Lan1> createState() => _Lan1State();
}

class _Lan1State extends State<Lan1> {
  var item = int;
  var items = [1, 2, 3, 4, 5, 6];
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(
                () {
                  items.add(8);
                },
              );
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                items.remove(8);
              });
            },
            child: const Icon(Icons.delete_forever_outlined),
          )
        ],
      ),
    );
  }
}
