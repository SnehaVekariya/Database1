import 'package:flutter/material.dart';

import 'FirstPage.dart';

void main(){

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context)=>firstpage(),
        // '/Second':(context)=>secondpage(),
      },

    ),
  );
}