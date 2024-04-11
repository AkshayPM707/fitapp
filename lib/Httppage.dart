import 'dart:async';
import 'dart:convert';



import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
Future<Product> fetchProduct() async {
 
  final response=await http.get(Uri.parse("http://fakestoreapi.com/products/4"));
  if(response.statusCode == 200)
  {
   return Product.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  }
  else
  {
    throw Exception("Failed to load Product");
  }
}
class Product
{
  final int id;
  final String title;
  final double price;
  final String image;



  const Product({
     required this.id,
     required this.title,
     required this.price,
     required this.image,
  });



  factory Product.fromJson(Map<String,dynamic> json)
  {
    return switch(json)
    {
      {
        'id' : int id,
        'title' : String title,
        'price' : double price,
        'image' : String image,
      } =>
      Product(id: id, title: title, price: price, image: image),
      _=> throw const FormatException("Failed to load Product")
    };
  }
}
class Httppage extends StatefulWidget {
  const Httppage({super.key, required String title});
  
  @override
  _HttppageState createState() => _HttppageState();
}



class _HttppageState extends State<Httppage> {
  late Future<Product> futureProduct;



  @override
  void initState() {
    super.initState();
    futureProduct=fetchProduct();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("RESPOND PAGE "),
      ),
       body:   SingleChildScrollView(
         child: Center(        
          child:FutureBuilder<Product>(future: futureProduct, builder: (context,snapshot)
          {
            if(snapshot.hasData)
            {
              return  Column(          
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(snapshot.data!.image),
              Text(snapshot.data!.title),
              Text(snapshot.data!.price.toString()),
            ],
              );
            }else if(snapshot.hasError)
            {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          }
          ), 
         ),
       ),
      );
  }
}