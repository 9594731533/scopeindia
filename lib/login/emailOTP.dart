import 'package:email_auth/email_auth.dart';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scopeindia/sideBar/homePage.dart';
import 'package:scopeindia/login/signUp.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // late TextEditingController _email;
  late EmailAuth emailAuth;

  void initState() {
    super.initState();
    emailAuth = EmailAuth(sessionName: "Session Name");
  }

  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  void _sendOTP() async{
    bool result = await EmailOTP.sendOTP(email: _emailController.text);
    if (result) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("OTP sent successfully")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to send OTP")));
    }
  }

  void _verifyOTP() {
    bool result =  EmailOTP.verifyOTP(otp: _otpController.text);
    if (result) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("OTP verified successfully")));
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context)=>const Homepage()
          ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Invalid OTP")));
    }
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
      body:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/blue background.jpg"),
            fit: BoxFit.fill,
          ),),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
              children: [
                SizedBox(height: 30,),
                TextFormField(
                  // onChanged: (i){
                  //   _email=i as TextEditingController;
                  // },
                  controller: _emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.emailAddress,style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.blue[800],
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                        width: 2.0,
                      ),
                    ),


                    labelText: "Enter your email",
                    labelStyle: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an email address';
                    } else if (!validateEmail(value)) {
                      return 'Invalid email address';
                    }
                    return null;
                  },
                ),

                ElevatedButton(
                  onPressed: _sendOTP,
                  child: Text('Send OTP'),
                ),

                TextFormField(
                  onChanged: (i){
                    name=i;
                  },
                  controller: _otpController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.number,style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.blue[800],
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                        width: 2.0,
                      ),
                    ),


                    labelText: "Enter OTP",
                    labelStyle: TextStyle(
                        color: Colors.white
                    ),
                  ),
                ),

                ElevatedButton(
                  onPressed: (){
                    _verifyOTP;
                    Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context)=>Signup(email: _emailController.text)
                    ));
                    },
                    child: const Text('Verify OTP')
    ,
                ),
              ]
          ),
        ),
      ),
    );
  }
}


