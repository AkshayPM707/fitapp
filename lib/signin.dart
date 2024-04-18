import 'package:fitapp/Hform.dart';
import 'package:fitapp/signup.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key, });

  @override
State createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
 // final _formKey = GlobalKey<FormState>();
  var _email;
  String user = '',pass='';
  final TextEditingController _usernameFieldController = TextEditingController();
  final  TextEditingController _passwordController = TextEditingController();
  
  @override

  void initState(){
    super.initState();
    _checkon();
  }

  Future<void> _checkon() async{
  final prefs = await SharedPreferences.getInstance();
  setState((){
    user = prefs.getString('user')?? '';
    pass = prefs.getString('pass')?? '';
  });
 }

void  login(){
  if(_email == user && _passwordController.text == pass){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HForm(title: '',))
    );
  }
  else{
    showDialog(
      context: context,
      builder:(BuildContext context){
        return AlertDialog(
          title:  const Text('Error'),
          content:  const Text('Wrong Username Or Password'),
          actions: <Widget>[
             TextButton(
              onPressed: (){
                Navigator.of(context).pop();
              }, 
              child: const Text('OK'),
            )
          ]
          );
        
      }

    );
  }
}

 @override
  void dispose() {
    _usernameFieldController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 150.0,
            width: 190.0,
            padding: const EdgeInsets.only(top: 40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(200),
            ),
            child: const Center(
              child: Image(image: NetworkImage("https://cdn-icons-png.flaticon.com/512/6681/6681204.png") ),
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
               controller: _usernameFieldController,

              decoration: InputDecoration(
                labelText: 'User Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              
               onChanged: (value){
                  setState((){
                   _email = value;
                  });
                },
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: const Icon(Icons.visibility_off),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
             
              onChanged: (value) {
                  setState((){
                    pass= value;
                  });
                },
            ),
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: login,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 15,
              ),
            ),
            child: const Text(
              "Login",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          GestureDetector(
            onTap: () {
              Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpPage()),
                  );
            },
            child: const Text.rich(
              TextSpan(
                text: 'Don\'t have an account? ',
                children: [
                  TextSpan(
                    text: 'Signup',
                    style: TextStyle(
                      color: Color(0xffEE7B23),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
