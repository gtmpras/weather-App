import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(Colors.lightBlueAccent, BlendMode.overlay),
            image: AssetImage("images/frame.png"),
            fit: BoxFit.fill
          ),
        ),
        
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.all(25)),
                  FaIcon(FontAwesomeIcons.cloudSun,color: Colors.cyan,size: 85,),
                  SizedBox(height: 10,),
                  Text("We show weather for you..",
                  style:TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.cyan,
                  ), 
                  ),  
                ],
              ),
              Column(
              children: 
              [
                Padding(padding: EdgeInsets.symmetric(vertical: 85)),
                ElevatedButton(onPressed: (){
                
                },
                 child:Text('Skip',style: TextStyle(
                  fontSize: 20,color: Colors.black
                 ),),
                 style:ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 141, 184, 190)
                 )),
              ],
            )
            ],
          ),
        ),
        
      ),
    );
  }
}