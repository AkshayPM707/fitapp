import 'package:fitapp/signin.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
 State createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  String _user = '',pass='',pass2='',email='';
  int age=0,phone=0;
  String? _gender;
  //final List<String> _genderOptions = ['Male', 'Female', 'Other'];
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _mailTextFieldController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _password2Controller = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();


  @override
  void dispose() {
    _usernameController.dispose();
    _mailTextFieldController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _ageController.dispose();
    _password2Controller.dispose();
    super.dispose();
  }

  void _savedata() async {
    if(pass == pass2 && _user.isNotEmpty && pass.isNotEmpty && email.isNotEmpty && /*phone.isNaN && _gender!.isNotEmpty &&*/ age>0){
      final prefs = await SharedPreferences.getInstance();
      setState((){
        prefs.setString('user', _user);
        prefs.setString('pass',pass);
        prefs.setString('email',email);
        prefs.setInt('phone',phone);
        prefs.setString('gender',_gender!);
        prefs.setInt('age',age);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SignInPage()),
        );      
      });
    }
    else{
      if(pass != pass2){
      showDialog(
      context: context,
      builder:(BuildContext context){
        return AlertDialog(
          title: const Text('Error'),
          content: const Text('Passwords Dosent Match'),
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
    
    else{
    showDialog(
      context: context,
      builder:(BuildContext context){
        return AlertDialog(
          title: const Text('Error'),
          content: const Text('Please Fill All Fields'),
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
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 20.0),
              const CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage("https://cdn-icons-png.flaticon.com/512/6681/6681204.png"),
              ),


              const SizedBox(height: 20.0),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              
                onChanged: (value){
                  setState((){
                    _user = value;
                  });
                },
              ),


              const SizedBox(height: 20.0),
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(
                  labelText: 'Age',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                
                onChanged: (value){
                  setState((){
                    age = int.parse(value);
                  });
                }
              ),


              const SizedBox(height: 20.0),
              TextFormField(
                controller: _mailTextFieldController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
               
                onChanged: (value){
                  setState((){
                    email = value;
                  });
                },
              ),


              const SizedBox(height: 20.0),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: const Icon(Icons.visibility_off),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
               
                 onChanged: (value){
                  setState((){
                    pass = value;
                  });
                }
              ),


              const SizedBox(height: 20.0),
              TextFormField(
                controller: _password2Controller,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  suffixIcon: const Icon(Icons.visibility_off),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              
                 onChanged: (value){
                  setState((){
                    pass2 = value;
                  });
                }
              ),


              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _savedata, 
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
                  "Sign Up",
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
                    MaterialPageRoute(builder: (context) => const SignInPage()),
                  );
                },
                child: const Text.rich(
                  TextSpan(
                    text: 'Already have an account? ',
                    children: [
                      TextSpan(
                        text: 'Log In',
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
        ),
      ),
    );
  }
}
