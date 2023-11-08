
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/cartprovider.dart';
import 'package:shop/firee.dart';
import 'package:shop/starters/splash.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
   ChangeNotifierProvider(
      create: (context) => Cart<Dress>(),
       // Initialize the cart
      
      child: MyApp()));
}



class MyApp extends StatefulWidget {
  

  @override
  
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:SplashScreen ()
    );
  }
}
