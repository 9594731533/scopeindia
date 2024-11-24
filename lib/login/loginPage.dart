import 'package:firebase_auth/firebase_auth.dart';
import'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scopeindia/login/emailOTP.dart';
import 'package:scopeindia/login/forgotPassword.dart';

import '../sideBar/homePage.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {

  final _formkey=GlobalKey<FormState>();
  var username_controller=TextEditingController();
  var password_controller=TextEditingController();

  Future<void> _login() async {
    try {
       await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: username_controller.text,
        password: password_controller.text, );
      // Handle successful login
       print('Login successful');
       Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context)=>const Homepage()
            )
        );
      }

    catch (e) {
      ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text(e.toString() as String)) );
      print('Error: $e');
    }
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final RegExp regex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }
  // String? _validatePassword(String? value) {
  //   if (value!.isEmpty) {
  //     return 'Password is required'; }
  //   else if (value.length < 8) {
  //     return 'Password must be at least 8 characters long'; }
  //   else if (!RegExp(r'^(?=.*[A-Z])').hasMatch(value)) {
  //     return 'Password must include at least one uppercase letter'; }
  //   else if (!RegExp(r'^(?=.*[a-z])').hasMatch(value)) {
  //     return 'Password must include at least one lowercase letter'; }
  //   else if (!RegExp(r'^(?=.*\d)').hasMatch(value)) {
  //     return 'Password must include at least one number'; }
  //   else if (!RegExp(r'^(?=.*[\W_])').hasMatch(value)) {
  //     return 'Password must include at least one special character'; }
  //   return null; }



      @override
      Widget build(BuildContext context) {
        return  Scaffold(
            appBar: AppBar(
              flexibleSpace: Image(
                image: AssetImage('assets/appbar.jpg'),
                fit: BoxFit.cover,
              ),
              backgroundColor: Colors.transparent,
              title: Center(
                child: Container(
                  height: 80.0,
                  width:80,
                  child: Image.asset(
                    'assets/homepage/logobird.png',
                    height: 32,
                  ),
                ),
              ),
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarBrightness: Brightness.light,
                // Status bar color
                statusBarColor: Colors.transparent,

                statusBarIconBrightness: Brightness.light, // For Android (dark icons)

              ),

            ),
                body:SingleChildScrollView(
                  child: Container(
                    height: 800,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/blue background.jpg"),
                        fit: BoxFit.fill,
                      ),),
                    child: Column(

                      children: [
                        Text("Welcome Back,",
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[100])
                        ),
                        Text("Enter your credential to login ",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[100])
                        ),

                        Form(
                          key:_formkey,
                          child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(20),

                                  child: Column(
                                    children: [
                                      TextFormField(
                                        controller:username_controller,
                                        keyboardType: TextInputType.name,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.blue.withOpacity(0.1),
                                          border:OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(15.0),

                                          ),
                                          labelText: "User Name",
                                          labelStyle: TextStyle(
                                            color: Colors.blue[100],
                                            fontSize: 20,
                                          ),
                                          prefixIcon: Icon(Icons.person),
                                          // prefixIconColor: Colors.blue

                                        ),
                                        validator: _validateEmail,
                                      ),
                                      SizedBox(height: 10,),

                                      TextFormField(
                                        controller: password_controller,
                                        keyboardType: TextInputType.name,
                                        obscureText: true,
                                        decoration: InputDecoration(

                                            filled: true,
                                            fillColor: Colors.blue.withOpacity(0.1),
                                            border:OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(15.0),

                                            ),
                                            focusColor: Colors.transparent,
                                            labelText: "Password",
                                            labelStyle: TextStyle(
                                              color: Colors.blue[100],
                                              fontSize: 20,
                                            ),
                                            prefixIcon: Icon(Icons.password),
                                            prefixIconColor: Colors.white

                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),

                                      SizedBox(
                                        width: 300,
                                        height: 45,
                                        child: ElevatedButton(
                                          onPressed:(){
                                            if (_formkey.currentState!.validate()){
                                              _login();
                                            }

                                            print(username_controller.text);
                                            print(password_controller.text);
                                            setState((){
                                              // name=username_controller.text;
                                              // password=password_controller.text;
                                              // username_controller.clear();
                                              // password_controller.clear();
                                            });

                                          },
                                          child: Text("Login"),
                                          style: ButtonStyle(
                                              padding: WidgetStateProperty.all(
                                                  EdgeInsets.all(10.0)
                                              ),
                                              foregroundColor: WidgetStateProperty.all(Colors.white),
                                              backgroundColor: WidgetStateProperty.all(Colors.green),
                                              minimumSize: WidgetStateProperty.all(Size(30, 20)),
                                              textStyle: WidgetStateProperty.all(TextStyle(fontSize: 22))

                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10,),

                                      Center(
                                          child: TextButton(
                                            onPressed: ()async {
                                              await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context)=>const ForgotPasswordScreen()
                                                  )
                                              );
                                            },
                                            child: Text("Forgot Password?",
                                              style: TextStyle(
                                                  color: Colors.blue[400],
                                                fontSize: 16
                                              ),),

                                          )
                                      ),

                                      Row(
                                        children: [
                                          Center(
                                            child: Text("      Don't have an account?",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.white
                                                )
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: ()async {
                                              await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context)=>RegisterPage()
                                                  )
                                              );
                                            },
                                            child: Text("SignUp",
                                              style: TextStyle(
                                                  color: Colors.blue[400],
                                                fontSize: 16
                                              ),),

                                          ),
                                        ],
                                      ),


                                    ],
                                  ),
                                ),


                              ]
                          ),

                        )
                      ],
                    ),
                  ),
                )
        );
      }
    }

