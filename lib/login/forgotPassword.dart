import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  final _formkey=GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  Future<void> _sendPasswordResetEmail() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.trim());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password reset email sent.')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body:  Container(
          height: 810,
          width: 500,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/blue background.jpg"),
              fit: BoxFit.fill,
            ),),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child:Column(
            children: [
              Text("Forgot Password ",
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[100])
              ),
              SizedBox(height: 20),
              TextFormField(
                key: _formkey,
                controller: _emailController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.blue.withOpacity(0.1),
                    border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),

                    ),
                    focusColor: Colors.transparent,
                    labelText: "Email ",
                    labelStyle: TextStyle(
                      color: Colors.blue[100],
                      fontSize: 20,
                    ),
                    prefixIcon: Icon(Icons.mail),
                    prefixIconColor: Colors.white

                ),
                validator: _validateEmail,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  style: ButtonStyle(
                      padding: WidgetStateProperty.all(
                          EdgeInsets.all(10.0)
                      ),
                      foregroundColor: WidgetStateProperty.all(Colors.deepPurple[900]),
                      backgroundColor: WidgetStateProperty.all(Colors.blue[100]),
                      minimumSize: WidgetStateProperty.all(Size(10, 20)),
                      textStyle: WidgetStateProperty.all(TextStyle(fontSize: 18))

                  ),
                  onPressed: (){
                    if (_formkey.currentState!.validate()) {
                      _sendPasswordResetEmail;
                    }
                  },

                  child: Text('Reset Password')

              ),
            ],
          ),
        ),
      ),
    );
  }
}
