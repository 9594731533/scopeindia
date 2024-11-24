import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:scopeindia/login/loginPage.dart';
import 'package:scopeindia/sideBar/dashboard/updateUser.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;
  var _email;

  // A function to delete user data and the user account
  Future<void> _deleteUser() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // Delete user data from Firestore
        await _firestore.collection('User Register').doc(user.uid).delete();
        // Delete user from Firebase Authentication
        await user.delete();
        // Show success message

      }
    } catch (e) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete user: $e')),
      );
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
      body: Center(
        child: Container(
          height: 810,
          width: 500,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/blue background.jpg"),
              fit: BoxFit.fill,
            ),),
          child: Column(
            children: [
              SizedBox(height: 100,),
              ElevatedButton(
                style: ButtonStyle(
                    padding: WidgetStateProperty.all(
                        EdgeInsets.all(10.0)
                    ),
                    foregroundColor: WidgetStateProperty.all(Colors.deepPurple[900]),
                    backgroundColor: WidgetStateProperty.all(Colors.blue[100]),
                    minimumSize: WidgetStateProperty.all(Size(30, 20)),
                    textStyle: WidgetStateProperty.all(TextStyle(fontSize: 22))

                ),
                onPressed: (){
                  _deleteUser;
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('User account and data deleted successfully')),
                  );
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context)=>const Loginpage()
                      )
                  );
                }, // Call the _deleteUser function
                child: const Text('       Delete Account       '),
              ),

              SizedBox(height: 20,),
              ElevatedButton(
                style: ButtonStyle(
                    padding: WidgetStateProperty.all(
                        EdgeInsets.all(10.0)
                    ),
                    foregroundColor: WidgetStateProperty.all(Colors.deepPurple[900]),
                    backgroundColor: WidgetStateProperty.all(Colors.blue[100]),
                    minimumSize: WidgetStateProperty.all(Size(100, 20)),
                    textStyle: WidgetStateProperty.all(TextStyle(fontSize: 22))

                ),
                onPressed: (){
                  setState(() {
                     _email= user?.email.toString();
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context)=>Updateuser(email: _email )
                      )
                  );
                  _deleteUser();

                  } ,// Call the _deleteAccount function
                child: const Text('      Update Account       '),
              ),
            ],
          ),
        ),
      ),
    );
  }
}






