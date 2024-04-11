import 'package:fitapp/myhomepage.dart';
import 'package:flutter/material.dart';

class Secondpage extends StatefulWidget{
  const Secondpage({super.key, required this .title});
final String title;
  @override
  _SecondpageState createState() => _SecondpageState();
}

class _SecondpageState extends State<Secondpage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Image(image: AssetImage('assets/images/avatar.png'), width: 155),
          Image(image: NetworkImage("https://blog.logrocket.com/wp-content/uploads/2022/06/internationalization-flutter-apps.png")),
        Text(
          "My First Flutter App"
        ),
        ElevatedButton(
          child: const Text("Enter"),
          onPressed:() {
            Navigator.push(context,
            MaterialPageRoute(
              builder: (context) => const MyHomePage(title: "My First App",)
              ),
              
              );
              }, 
            ),
        ],
      
      ),
      ),
    );
  }
}