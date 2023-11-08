import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop/user/login.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool obserText = true;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> registerUser() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

     
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));

      
      CollectionReference collRef = FirebaseFirestore.instance.collection('client');
      await collRef.add({
        'name': nameController.text,
        'email': emailController.text,
        'mobile': mobileController.text,
        'password':passwordController.text,
      });
    } catch (e) {
      // Handle registration errors.
      print("Error during registration: $e");
      // You can show an error message to the user.
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Registration failed. Please check your credentials."),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/wallpaper.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: ClipRRect(
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 100,
                        width: double.infinity,
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Register',
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 152, 146, 146),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 400,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                           TextFormField(
                          controller: nameController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              hintText: "UserName",
                              hintStyle: TextStyle(color: Colors.grey),
                               border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)
                              ),
                              
                              ),
                        ),
                        TextFormField(
                          controller: emailController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              hintText: "Email", hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)
                              )),
                        ),
                        TextFormField(
                          controller: mobileController,
                          
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              hintText: "Mobile Number",
                              hintStyle: TextStyle(color: Colors.grey),
                               border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)
                              )),
                        ),
                        TextFormField(
                          controller: passwordController,
                          style: TextStyle(color: Colors.white),
                          obscureText: obserText, // Controls password obscuring
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.grey),
                            suffixIcon: GestureDetector(
                              onTap: (){
                setState((){
                  obserText=!obserText;
                });
                FocusScope.of(context).unfocus();
                              },
                              child: Icon(
                             obserText==true? Icons.visibility:Icons.visibility_off,
                                color: const Color.fromARGB(255, 180, 130, 112),
                              ),
                            ),
                            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                            InkWell(
                              onTap: () {
                                registerUser();
                              },
                              child: Container(
                                height: 50,
                                width: 350,
                                child: Center(
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 125, 74, 55).withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Text("I Already Have an Account!!"),
                                SizedBox(width: 20),
                                InkWell(
                                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Login())),
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      color: Colors.cyan,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
