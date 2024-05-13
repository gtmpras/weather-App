

import 'package:flutter/material.dart';

class HomePageScreeen extends StatefulWidget {
  const HomePageScreeen({super.key});

  @override
  State<HomePageScreeen> createState() => _HomePageScreeenState();
}

class _HomePageScreeenState extends State<HomePageScreeen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dang",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
    
    );
  }
}