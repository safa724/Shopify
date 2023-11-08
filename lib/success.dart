import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';






class SuccessPage extends StatefulWidget {
  @override
  _SuccessPageState createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
 bool isPlaying =false;
 final controller=ConfettiController();

  @override
  void initState() {
    super.initState();
   controller.play();
    }
  

  @override
  void dispose(){
    controller.dispose();
    super.dispose()
;  }
@override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Scaffold(
         
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  height: 160,
image:AssetImage('images/shoppingbag.png')
                ),
                Text(
                  'Success!!!!!!!!!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Your order will be delivered soon',
                  style: TextStyle(fontSize: 16),
                ),
             

// Inside your widget:
ConfettiWidget(
  blastDirection: -pi/2 ,
  confettiController: controller,
  shouldLoop: false,
  emissionFrequency: 0.01,
  numberOfParticles: 10,
  gravity: 0.1,
  colors: const [Colors.red, Colors.blue, Colors.pink,Colors.yellow],
),
              ],
            ),
          ),
        ),
      ],
    );
  }

}
