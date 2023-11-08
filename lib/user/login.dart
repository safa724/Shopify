import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop/homepage.dart';
import 'package:shop/user/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _LoginState extends State<Login> {
  bool obserText = true;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> loginUser() async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
    
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
      } catch (e) {
       
        print("Error during login: $e");
       
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Login failed. Please check your credentials."),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(
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
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        height: 100,
                        width: double.infinity,
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Login',
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
                        validator: (value) {
                          if (value == '') {
                            return 'Please fill Email';
                          } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(value!)) {
                            return "Email is Invalid";
                          }
                          return null;
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            
                          ),
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.grey)
                        ),
                        controller: emailController,
                      ),
                     
                      TextFormField(
                        validator: (value) {
                          if (value == '') {
                            return 'Please fill Password';
                          } else if (value!.length < 8) {
                            return "Password is too short";
                          }
                          return null;
                        },
                        style: TextStyle(color: Colors.white),
                        obscureText: obserText,
                        decoration: InputDecoration(
                          hintText: "Password",
                           hintStyle: TextStyle(color: Colors.grey),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                obserText = !obserText;
                              });
                              FocusScope.of(context).unfocus();
                            },
                            child: Icon(
                              obserText ? Icons.visibility : Icons.visibility_off,
                              color: const Color.fromARGB(255, 180, 130, 112),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)
                          ),
                        ),
                        controller: passwordController,
                      ),
                      InkWell(
                        onTap: () {
                          loginUser();
                        },
                        child: Container(
                          height: 50,
                          width: 350,
                          child: Center(
                            child: Text(
                              'Login',
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
                          Text("I Don't Have An Account!!"),
                          SizedBox(width: 20),
                          InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUp(),
                              ),
                            ),
                            child: Text(
                              'Sign Up',
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
                    ]
                            ),
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
