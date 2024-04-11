import 'package:fitapp/Newpage.dart';
import 'package:flutter/material.dart';

class Thirdpage extends StatefulWidget {
  const Thirdpage({super.key, required this.title });
  final String title;
   
  @override
  _ThirdpageState createState() => _ThirdpageState();
}

class _ThirdpageState extends State<Thirdpage> {
  String _name="";
  void _changeName(String value){
    setState(() {
      _name=value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
              Text("Name: $_name",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
                Padding(
                  padding: const EdgeInsets.all(50),
                  child: TextField(
                    onChanged: (value) {
                        _changeName(value);
                    },
                 
                  decoration: const InputDecoration(
                    label: Text("Enter name"), border: OutlineInputBorder()
                  )
                  ),
                ),
            ElevatedButton(
              child: const Text("Enter"),
              onPressed: () {
                  if(_name.isNotEmpty && _name !="PLEASE ENTER NAME") {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Newpage(title: _name)));
                  }
                  else {
                    _name = "PLEASE ENTER NAME";
                    _changeName(_name);
                  }
                },        
            ),
          ]
        ),
      ),

    );
  }
}