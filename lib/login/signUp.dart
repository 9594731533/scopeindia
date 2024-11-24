import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scopeindia/login/loginPage.dart';

class Signup extends StatefulWidget {
  final String email;
   Signup({super.key, required this.email});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formkey=GlobalKey<FormState>();
  var passwordController=TextEditingController();
  var confirmController=TextEditingController();
  var emailController=TextEditingController();

  var undo=0;

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

  // bool validateEmail(String email) {
  //   // Define the regex pattern for a valid email address
  //   String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
  //   RegExp regex = RegExp(pattern);
  //   return regex.hasMatch(email);
  // }
  String? _validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Password is required'; }
    else if (value.length < 8) {
      return 'Password must be at least 8 characters long'; }
    else if (!RegExp(r'^(?=.*[A-Z])').hasMatch(value)) {
      return 'Password must include at least one uppercase letter'; }
    else if (!RegExp(r'^(?=.*[a-z])').hasMatch(value)) {
      return 'Password must include at least one lowercase letter'; }
    else if (!RegExp(r'^(?=.*\d)').hasMatch(value)) {
      return 'Password must include at least one number'; }
    else if (!RegExp(r'^(?=.*[\W_])').hasMatch(value)) {
      return 'Password must include at least one special character'; }
    return null; }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;


  Future<void> _addData() async {
     await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: widget.email,
      password: passwordController.text, );
    firestore.collection('User Register').add({
      'email_id': widget.email,
      'password': passwordController.text,
    }).then((_) {

      setState(() {});
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Registered Successfully")),
      );
      print('Data added successfully.');
    }).catchError((e) {
      if (e is FirebaseAuthException && e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content: Text('The email address is already in use by another account.')), ); }
      else {
        if (kDebugMode) {
          print('Failed to add data: $e');
        }
      }
    });
  }



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
          body: SingleChildScrollView(
            child: Container(
              height: 800,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/blue background.jpg"),
                  fit: BoxFit.fill,
                ),),
              child: Column(
                  children: [
                    Text("Sign up ",
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[100])
                    ),
                     Text("Create your account ",
                         style: TextStyle(
                             fontSize: 26,
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
                                    initialValue: widget.email as String,
                                    readOnly: true,
                                    // controller:emailController,
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.blue.withOpacity(0.1),
                                      // border:OutlineInputBorder(
                                      //   borderRadius: BorderRadius.circular(15.0),
                                      // ),
                                      labelText: "Email",
                                      labelStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                      prefixIcon: Icon(Icons.email),
                                    ),
                                    validator: _validateEmail
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),

                                  TextFormField(
                                      autovalidateMode: AutovalidateMode.always,
                                      controller:passwordController,
                                      keyboardType: TextInputType.name,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.blue.withOpacity(0.1),
                                        // border:OutlineInputBorder(
                                        //   borderRadius: BorderRadius.circular(15.0),
                                        // ),

                                        labelText: "Password",
                                        labelStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                        prefixIcon: Icon(Icons.password),
                                      ),
                                    validator: _validatePassword,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),

                                  TextFormField(
                                      autovalidateMode: AutovalidateMode.always,
                                      controller:confirmController,
                                      keyboardType: TextInputType.name,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.blue.withOpacity(0.1),
                                        // border:OutlineInputBorder(
                                        //   borderRadius: BorderRadius.circular(15.0),
                                        // ),
                                        labelText: "Confirm Password",
                                        labelStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                        prefixIcon: Icon(Icons.password),
                                      ),
                                      validator:(value){
                                        if (value != passwordController.text) {
                                          return 'Passwords do not match';
                                        }
                                        return null;

                                      }

                                  ),
                                  SizedBox(
                                    width: 500,
                                    height: 20,
                                  ),

                                  ElevatedButton(
                                    onPressed: () {
                                      if (_formkey.currentState!.validate()){
                                        _addData();
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context)=>Loginpage()
                                            )
                                        );

                                      }

                                      // if (_formkey.currentState!.validate()) {
                                      //   ScaffoldMessenger.of(context).showSnackBar(
                                      //   SnackBar(content: Text('Password is valid')),
                                      //   );
                                      // }
                                      // else {
                                      //   ScaffoldMessenger.of(context).showSnackBar(
                                      //   SnackBar(content: Text('Error Occurred'))
                                      //   );
                                      // }
                                      // if (_formkey.currentState!.validate()) {
                                      //   ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text('Email is valid')), ); }
                                      // else { ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text('Please correct the errors')), );}
                                      },
                                      child: Text("Sign up"),
                                      style: ButtonStyle(
                                          padding: WidgetStateProperty.all(
                                              EdgeInsets.all(10.0)
                                          ),
                                          foregroundColor: WidgetStateProperty.all(Colors.white),
                                          backgroundColor: WidgetStateProperty.all(Colors.deepPurple),
                                          minimumSize: WidgetStateProperty.all(Size(30, 20)),
                                          textStyle: WidgetStateProperty.all(TextStyle(fontSize: 22))
                                      ),
                                  ),


                                  Row(
                                      children: [
                                        Center(
                                          child: Text("               Already have an account?",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white
                                              )
                                          ),
                                        ),
                                        TextButton(onPressed: () async {
                                        await Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                        builder: (context)=>const Loginpage()
                                        )
                                        );
                                        },
                                          child: Text("Login",
                                            style: TextStyle(
                                                color: Colors.blue[400],
                                              fontSize: 16
                                            ),
                                          ),
                                        ),
                                      ]
                                  )



                                ],
                              ),

                            )    ]
                      ),
                    ),
                  ]
              ),
            ),
          ),
    );
  }
}
