import 'package:flutter/material.dart';

class Newpage extends StatefulWidget {
  const Newpage({super.key , required this.title});
  final String title;
  @override
  _NewpageState createState() => _NewpageState();
}

class _NewpageState extends State<Newpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(onPressed: () {
            Navigator.pop(context);},
            child: const Text("Back"),
          )
        ],
      ),
      
    );
  }
}