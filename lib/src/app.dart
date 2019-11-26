import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:newsapp/src/widgets/image_list.dart';
import 'models/image_models.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images =[];

  void fetchImage() async{
    counter++;
    var response = await get('https://jsonplaceholder.typicode.com/photos/$counter');
    var imageModel = ImageModel.fromJson(json.decode(response.body));
    
    setState(() {
      images.add(imageModel);
    });

  }
  @override
  Widget build( context) {
    return MaterialApp(
       home: Scaffold(
         body: ImageList(images),
         floatingActionButton: FloatingActionButton(
           child: Icon(Icons.add),
           onPressed: fetchImage,

         ),
         appBar: AppBar(
           title: Text('Lets see some image from fake Api'),
         ),
       ),
    );
  }
}