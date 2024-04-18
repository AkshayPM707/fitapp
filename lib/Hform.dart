import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart' ;
import 'status.dart' ;

class HForm extends StatefulWidget {
  const HForm({super.key, required this.title, });
  final String title;

  @override
  _HFormState createState() => _HFormState();
}

class _HFormState extends State<HForm> {

  double height =0, weight =0, bp=0,sugar=0,cholestrol=0;
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _bpController = TextEditingController();
  final TextEditingController _sugarController = TextEditingController();
  final TextEditingController _cholestrolController = TextEditingController();

 @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    _bpController.dispose();
    _sugarController.dispose();
    _cholestrolController.dispose();
    
    super.dispose();
  }
  
  
  void _savedata() async {
    if(height>0 && weight>20 && sugar>0 && cholestrol>0 && bp>0 ){
      final prefs = await SharedPreferences.getInstance();
      
      double bmi= (weight/(height*height));
      String bmiString = bmi.toStringAsFixed(2);
      bmi = double.parse(bmiString);
      setState((){
        prefs.setDouble('bmi', bmi);
        prefs.setDouble('sugar',sugar);
        prefs.setDouble('bp',bp);
        prefs.setDouble('fat',cholestrol);
        
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=> const StatusPage()));
      
      });
    }
    else{    
    showDialog(
      context: context,
      builder:(BuildContext context){
        return AlertDialog(
          title: const Text('Error'),
          content:  Text('Please Fill All Fields $weight $height $bp $sugar $cholestrol'),
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text( 'Enter Current Health Status', style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Text(""),
            SizedBox(
              width:  300,
              height: 80,
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _heightController,
                style: const TextStyle(fontWeight: FontWeight.bold),
                decoration: const InputDecoration(labelText: 'Enter Age',
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0)),)
                ),
                onChanged: (value){
                  setState((){
                    height = double.parse(value) ;
                  });
                },
              ),
            ),
            SizedBox(
              width:  300,
              height: 80,
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _heightController,
                style: const TextStyle(fontWeight: FontWeight.bold),
                decoration: const InputDecoration(labelText: 'Enter Gender',
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0)),)
                ),
                onChanged: (value){
                  setState((){
                    height = double.parse(value) ;
                  });
                },
              ),
            ),
            SizedBox(
              width:  300,
              height: 80,
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _heightController,
                style: const TextStyle(fontWeight: FontWeight.bold),
                decoration: const InputDecoration(labelText: 'Enter Height',
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0)),)
                ),
                onChanged: (value){
                  setState((){
                    height = double.parse(value) ;
                  });
                },
              ),
            ),
             SizedBox(
              width:  300,
              height: 80,
              child: TextField(
                controller: _weightController,
                style: const TextStyle(fontWeight: FontWeight.bold),
                decoration: const InputDecoration(labelText: 'Enter Weight',
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0)),)
                ),
                onChanged: (value){
                  setState((){
                    weight = double.parse(value) ;
                  });
                },
              ),
            ),
             SizedBox(
              width:  300,
              height: 80,
              child: TextField(
                controller: _bpController,
                style: const TextStyle(fontWeight: FontWeight.bold),
                decoration: const InputDecoration(labelText: 'Blood Pressure',
                
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0)),)
                ),
                
                onChanged: (value){
                  setState((){
                    bp = double.parse(value);
                  });
                }
              ),
            ),
             SizedBox(
              width:  300,
              height: 80,
              child: TextField(
                controller: _sugarController,
                onChanged: (value){
                  setState((){
                    sugar = double.parse(value);
                  });
                },
                style: const TextStyle(fontWeight: FontWeight.bold),
                decoration: const InputDecoration(labelText: 'Sugar Level',
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0)),)
                ),
                

              ),
            ),
             SizedBox(
              width:  300,
              height: 80,
              child: TextField(
                controller: _cholestrolController,
                style: const TextStyle(fontWeight: FontWeight.bold),
                decoration: const InputDecoration(labelText: 'Colestrol Count',
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0)),)
                ),
                onChanged: (value){
                  setState((){
                    cholestrol = double.parse(value);
                  });
                }
              ),
            ),
            
           
            TextButton(onPressed: _savedata, child: const Text('Check Status'))
          ]
        )

      )
    );

  }
}
