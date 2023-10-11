import 'package:flutter/material.dart';

Widget textField(){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(
      decoration: InputDecoration(
        // filled: true,
        // fillColor: Colors.blueAccent,
        hintText: "Search city",
        prefixIcon: const Icon(Icons.search,color: Colors.blue,),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 4,
            color: Colors.blue
          ),
          borderRadius: BorderRadius.circular(12),
          
          
          
        )
      ),
      onSubmitted: (value){
          
      },
    ),
  );
}