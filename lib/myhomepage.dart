import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[500],
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Icon(
                Icons.account_circle,
                size: 48,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("HOME"),
              onTap: () {
                Navigator.pop(context);

                Navigator.push(context, '/firstpage' as Route<Object?>);
              },
            ),
            const ListTile(
              leading: Icon(Icons.settings),
              title: Text("S E T T I N G S"),
            ),
            const ListTile(
              leading: Icon(Icons.login),
              title: Text("login/register"),
            ),
            const ListTile(
              leading: Icon(Icons.support),
              title: Text("support"),
            ),
          ],
        ),
      ),
    );
  }
}