import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart' ;

class StatusPage extends StatefulWidget {
  const StatusPage({ Key? key }) : super(key: key);



  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  double bmi = 0;
  double sugar = 0,cholestrol = 0,bp = 0,age = 0;
  String condition = '',gender='',scondition='',ccondition='',bcondition='';

  @override
  void initState() {
    super.initState();
    _cstatus();
  }

  void _cstatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState((){
    bmi = prefs.getDouble('bmi')??0;
    sugar = prefs.getDouble('sugar')??0;
    cholestrol = prefs.getDouble('fat')??0;
    bp = prefs.getDouble('bp')??0;
    age = prefs.getDouble('age')??0;
    gender = prefs.getString('gender')??'';
    });
    if(gender=='Male'){
      if(age>=18 && age <=34){
        if(bmi>=23.0 && bmi<=25.9){
          
            condition='Good';
          

        }
        else if(bmi<23.0){
          condition = 'UnderWeight';
        }
        else{
          condition='Overweight';
        }
      }
      else if(age>=35 && age<=44){
        if(bmi>=23.0 && bmi<=26.9){
          condition ='Good';
        }
        else if(bmi<23.0){
          condition='UnderWeight';
        }
        else{
          condition='OverWeight';
        }
      }
      else if(age>=45 && age<=54){
        if(bmi>=24.0 && bmi<=27.9){
          condition='Good';
        }
        else if(bmi<24.0){
          condition = 'UnderWeight';
        }
        else{
          condition ='OverWeight';
        }
      }
      else if(age>=55 && age<=64){
        if(bmi>=24.0 && bmi<=28.9){
          condition = 'Good';
        }
        else if(bmi<24.0){
          condition ='UnderWeight';
        }
        else{
          condition='Overweight';
        }
      }
      else{
        if(bmi>=25.0 && bmi<=28.9){
          condition='Good';
        }
        else if(bmi< 25.0){
          condition='UnderWeight';
        }
        else{
          condition = 'OverWeight';
        }
      }

    }
    else{
      if(age>=18 && age <=34){
        if(bmi>=15.5 && bmi<=24.9){
          condition='Good';
        }
        else if(bmi<15.5){
          condition = 'UnderWeight';
        }
        else{
          condition='Overweight';
        }
      }
      else if(age>=35 && age<=44){
        if(bmi>19.0 && bmi<=23.9){
          condition ='Good';
        }
        else if(bmi<19.0){
          condition='UnderWeight';
        }
        else{
          condition='OverWeight';
        }
      }
      else if(age>=45 && age<=54){
        if(bmi>=20.0 && bmi<=25.9){
          condition='Good';
        }
        else if(bmi<24.0){
          condition = 'UnderWeight';
        }
        else{
          condition ='OverWeight';
        }
      }
      else if(age>=55 && age<=64){
        if(bmi>=22.0 && bmi<=27.9){
          condition = 'Good';
        }
        else if(bmi<22.0){
          condition ='UnderWeight';
        }
        else{
          condition='Overweight';
        }
      }
      else{
        if(bmi>=24.0 && bmi<=28.9){
          condition='Good';
        }
        else if(bmi< 24.0){
          condition='UnderWeight';
        }
        else{
          condition = 'OverWeight';
        }
      }

    }
    if(sugar>=70 && sugar <=100){
      setState((){
        scondition = 'Good';
      });
    }
    else if(sugar<70){
      setState((){
        scondition=' Low Sugar Level';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Current Status'),
      ),
      body:  SingleChildScrollView(
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[ 
            
            const Text(""),           
            Container(
              decoration: BoxDecoration(
                color: condition=='Good'?  Color.fromARGB(143, 26, 196, 32) : Color.fromARGB(131, 255, 19, 2),
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(10),
                
              ),
              
            child:
            
               SizedBox(
               height: 50,
               width: 300,
               
               child: Text(' Body Mass Index(BMI): $bmi \n Condition: $condition',
                 style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),  
               ),
             ),
            
            ),
            const SizedBox(
              height: 50
            ),
            Container(
              decoration: BoxDecoration(
                color: scondition=='Good'?  Color.fromARGB(143, 26, 196, 32) : Color.fromARGB(131, 255, 19, 2),
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(10),
                
              ),
            child: SizedBox(
              height: 50,
              width: 300,
              
              child: Text(' Sugar: $sugar \n Condition: $scondition',
                style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),  
              ),
            ),
            
            ),
            const SizedBox(
              height: 50
            ),
            Container(
              decoration: BoxDecoration(
                color: condition=='Good'?  Color.fromARGB(143, 26, 196, 32) : Color.fromARGB(131, 255, 19, 2),
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(10),
                
              ),
            child: SizedBox(
              height: 50,
              width: 300,
              
              child: Text(' Cholestrol: $cholestrol \n Condition: $condition',
                style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),  
              ),
            ),
            
            ),
            const SizedBox(
              height: 50
            ),
            Container(
              decoration: BoxDecoration(
                color: condition=='Good'?  const Color.fromARGB(143, 26, 196, 32) : const Color.fromARGB(131, 255, 19, 2),
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(10),
                
              ),
            child: SizedBox(
              height: 50,
              width: 300,
              
              child: Text(' Blood Pressure(BP): $bp \n Condition: $condition',
                style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),  
              ),
            ),
            
            ),
          ]
        ),
      )
      )
    );
  }
}