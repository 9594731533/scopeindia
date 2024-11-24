import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scopeindia/sideBar/aboutUs.dart';
import 'package:scopeindia/sideBar/contactUs.dart';
import 'package:scopeindia/courses/aws.dart';
import 'package:scopeindia/courses/azure.dart';
import 'package:scopeindia/courses/cisco.dart';
import 'package:scopeindia/courses/daatascience.dart';
import 'package:scopeindia/courses/dataanalytics.dart';
import 'package:scopeindia/courses/devops.dart';
import 'package:scopeindia/courses/digitalmarketing.dart';
import 'package:scopeindia/courses/dotnet.dart';
import 'package:scopeindia/courses/flutter.dart';
import 'package:scopeindia/courses/ionic.dart';
import 'package:scopeindia/courses/java.dart';
import 'package:scopeindia/courses/mean.dart';
import 'package:scopeindia/courses/mern.dart';
import 'package:scopeindia/courses/microsoft.dart';
import 'package:scopeindia/courses/networking.dart';
import 'package:scopeindia/courses/php.dart';
import 'package:scopeindia/courses/python.dart';
import 'package:scopeindia/courses/rhce.dart';
import 'package:scopeindia/courses/rhcsa.dart';
import 'package:scopeindia/courses/softwaretesting.dart';
import 'package:scopeindia/courses/uiux.dart';
import 'package:scopeindia/sideBar/registerNow.dart';
import 'package:url_launcher/url_launcher.dart';

import '../login/loginPage.dart';
import 'dashboard/dashboard.dart';
import 'homePage.dart';

class Courses extends StatefulWidget {
  const Courses({super.key});

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  void _addData() {
    firestore.collection('phone number').add({
      'email_id': emailController.text,
      'name': nameController.text,
      'phone': phoneController.text,
    }).then((_) {

      setState(() {});
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Number Submitted")),
      );
      print('Data added successfully.');
    }).catchError((error) {
      print('Failed to add data: $error');
    });
  }
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launch(launchUri.toString());
  }

  Future<void> _sendEmail(String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=Your Subject&body=Your Email Body',
    );
    await launch(emailUri.toString());
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
            width: 80,
            child: Image.asset(
              'assets/homepage/logobird.png',
              height: 32,
            ),
          ),
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/blue background.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Text(
                'SCOPE INDIA',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            Container(
              height: 650,
              decoration: BoxDecoration(
                  color: Colors.blueAccent
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.supervised_user_circle_outlined),
                    title: const Text('Dashboard'),
                    onTap: () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context)=>Dashboard()
                          )
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.home_filled),
                    title: const Text('Home'),
                    onTap: () async {
                      await Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context)=>const Homepage()
                          )
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.library_books_outlined),
                    title: const Text('Courses'),
                    onTap: () async {
                      await Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context)=>const Courses()
                          )
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.people_alt_outlined),
                    title: const Text('Know SCOPE INDIA'),
                    onTap: () async {
                      await Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context)=>const Aboutus()
                          )
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.contact_support_outlined),
                    title: const Text('Contact US'),
                    onTap: () async {
                      await Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context)=>const ContactUs()
                          )
                      );
                    },
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(

                    onPressed: () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context)=>const RegisterNow()
                          )
                      );
                    },
                    style:  ElevatedButton.styleFrom(
                      backgroundColor:  Colors.deepPurple,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text('Register Now'),
                  ),
                  SizedBox(height: 10,),
                  ElevatedButton(

                    onPressed: () async {
                      ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text('Logged Out Successfully')), );
                      await Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context)=>const Loginpage()
                          )
                      );
                    },
                    style:  ElevatedButton.styleFrom(
                      backgroundColor:  Colors.white,
                      foregroundColor: Colors.deepPurple,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text('     Log out     '),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/blue background.jpg"),
                  fit: BoxFit.fitHeight,
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),

                  Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  child: Column(
                                    children: [
                                      Text("SCOPE INDIA",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 42,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.yellow[900])),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                          "Center for Software, Networking, & Cloud Education",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              height: 1.1,
                                              wordSpacing: 0.1,
                                              // letterSpacing: 0.1,
                                              fontSize: 28,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Text(
                                          " All Trainers at SCOPE INDIA are working professionals, Software Engineers, Networking Engineers, and Software Test Engineers of Suffix E Solutions with ",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              height: 1.2,
                                              // wordSpacing: 0.1,
                                              // letterSpacing: 0.1,
                                              fontSize: 26,
                                              color: Colors.white)),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text("17 years of Industrial experience.",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              height: 1.1,
                                              wordSpacing: 0.1,
                                              // letterSpacing: 0.1,
                                              fontSize: 28,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.yellow)),
                                      SizedBox(
                                        height: 40,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 120,
                                  width: 300,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/homepage/star.png"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Text("Google 4.9 * Rated Institute",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 22, color: Colors.white)),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  Container(
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            "Software Programming Courses",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all(Colors.white),
                                foregroundColor:
                                    WidgetStateProperty.all(Colors.blue[900]),
                                // padding: MaterialStateProperty.all(EdgeInsets.all(10.0)),
                                minimumSize: WidgetStateProperty.all(
                                    const Size(400, 60)),
                                textStyle: WidgetStateProperty.all(
                                    TextStyle(fontSize: 20.0))),
                            onPressed: () async {
                              await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context)=>const JavaPage()
                                  )
                              );
                            },
                            child: Text("Java Full Stack Internship"),
                          ), //java
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all(Colors.white),
                                foregroundColor:
                                    WidgetStateProperty.all(Colors.blue[900]),
                                // padding: MaterialStateProperty.all(EdgeInsets.all(10.0)),
                                minimumSize: WidgetStateProperty.all(
                                    const Size(400, 60)),
                                textStyle: WidgetStateProperty.all(
                                    TextStyle(fontSize: 20.0))),
                            onPressed: () async {
                              await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context)=>const PythonPage()
                                  )
                              );
                            },
                            child: Text("Python Full Stack Internship"),
                          ), //python
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all(Colors.white),
                                foregroundColor:
                                    WidgetStateProperty.all(Colors.blue[900]),
                                // padding: MaterialStateProperty.all(EdgeInsets.all(10.0)),
                                minimumSize: WidgetStateProperty.all(
                                    const Size(400, 60)),
                                textStyle: WidgetStateProperty.all(
                                    TextStyle(fontSize: 20.0))),
                            onPressed: () async {
                              await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context)=>const PHPPage()
                                  )
                              );
                            },
                            child: Text("PHP Full Stack Internship"),
                          ), //PHP
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all(Colors.white),
                                foregroundColor:
                                    WidgetStateProperty.all(Colors.blue[900]),
                                // padding: MaterialStateProperty.all(EdgeInsets.all(10.0)),
                                minimumSize: WidgetStateProperty.all(
                                    const Size(400, 60)),
                                textStyle: WidgetStateProperty.all(
                                    TextStyle(fontSize: 20.0))),
                            onPressed: () async {
                              await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context)=>const DotnetPage()
                                  )
                              );
                            },
                            child: Text(".Net Core Full Stack Internship"),
                          ), //.net
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all(Colors.white),
                                foregroundColor:
                                    WidgetStateProperty.all(Colors.blue[900]),
                                // padding: MaterialStateProperty.all(EdgeInsets.all(10.0)),
                                minimumSize: WidgetStateProperty.all(
                                    const Size(400, 60)),
                                textStyle: WidgetStateProperty.all(
                                    TextStyle(fontSize: 20.0))),
                            onPressed: () async {
                              await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context)=>const MERNPage()
                                  )
                              );
                            },
                            child: Text("MERN Full Stack Internship"),
                          ), //mern
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all(Colors.white),
                                foregroundColor:
                                    WidgetStateProperty.all(Colors.blue[900]),
                                // padding: MaterialStateProperty.all(EdgeInsets.all(10.0)),
                                minimumSize: WidgetStateProperty.all(
                                    const Size(400, 60)),
                                textStyle: WidgetStateProperty.all(
                                    TextStyle(fontSize: 20.0))),
                            onPressed: () async {
                              await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context)=>const MEANPage()
                                  )
                              );
                            },
                            child: Text("MEAN Full Stack Internship"),
                          ), //mean
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all(Colors.white),
                                foregroundColor:
                                    WidgetStateProperty.all(Colors.blue[900]),
                                // padding: MaterialStateProperty.all(EdgeInsets.all(10.0)),
                                minimumSize: WidgetStateProperty.all(
                                    const Size(400, 60)),
                                textStyle: WidgetStateProperty.all(
                                    TextStyle(fontSize: 20.0))),
                            onPressed: () async {
                              await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context)=>const FlutterPage()
                                  )
                              );
                            },
                            child: Text(
                                "Android/iOS Mobile App Course in Google Flutter"),
                          ), //flutter
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all(Colors.white),
                                foregroundColor:
                                    WidgetStateProperty.all(Colors.blue[900]),
                                // padding: MaterialStateProperty.all(EdgeInsets.all(10.0)),
                                minimumSize: WidgetStateProperty.all(
                                    const Size(400, 60)),
                                textStyle: WidgetStateProperty.all(
                                    TextStyle(fontSize: 20.0))),
                            onPressed: () async {
                              await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context)=>const IonicPage()
                                  )
                              );
                            },
                            child:
                                Text("Android/iOS Mobile App Course in IONIC"),
                          ), //IONIC
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all(Colors.white),
                                foregroundColor:
                                    WidgetStateProperty.all(Colors.blue[900]),
                                // padding: MaterialStateProperty.all(EdgeInsets.all(10.0)),
                                minimumSize: WidgetStateProperty.all(
                                    const Size(400, 60)),
                                textStyle: WidgetStateProperty.all(
                                    TextStyle(fontSize: 20.0))),
                            onPressed: () async {
                              await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context)=>const PHPPage()
                                  )
                              );
                            },
                            child: Text("Website Designing Course"),
                          ), //Website Designing
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all(Colors.white),
                                foregroundColor:
                                    WidgetStateProperty.all(Colors.blue[900]),
                                // padding: MaterialStateProperty.all(EdgeInsets.all(10.0)),
                                minimumSize: WidgetStateProperty.all(
                                    const Size(400, 60)),
                                textStyle: WidgetStateProperty.all(
                                    TextStyle(fontSize: 20.0))),
                            onPressed: () async {
                              await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context)=>const UIUXPage()
                                  )
                              );
                            },
                            child: Text("UI/UX Designing"),
                          ), //UI/Ux designing
                          const SizedBox(
                            height: 10,
                          ),

                          Text(
                            "Software Testing Courses",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all(Colors.white),
                                foregroundColor:
                                    WidgetStateProperty.all(Colors.blue[900]),
                                // padding: MaterialStateProperty.all(EdgeInsets.all(10.0)),
                                minimumSize: WidgetStateProperty.all(
                                    const Size(400, 60)),
                                textStyle: WidgetStateProperty.all(
                                    TextStyle(fontSize: 20.0))),
                            onPressed: () async {
                              await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context)=>const SoftwareTestingPage()
                                  )
                              );
                            },
                            child: Text("Software Testing Advanced Course"),
                          ), //software testing
                          const SizedBox(
                            height: 10,
                          ),

                          Text(
                            "Networking , Server , & Cloud",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all(Colors.white),
                                foregroundColor:
                                    WidgetStateProperty.all(Colors.blue[900]),
                                // padding: MaterialStateProperty.all(EdgeInsets.all(10.0)),
                                minimumSize: WidgetStateProperty.all(
                                    const Size(400, 60)),
                                textStyle: WidgetStateProperty.all(
                                    TextStyle(fontSize: 20.0))),
                            onPressed: () async {
                              await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context)=>const NetworkingPage()
                                  )
                              );
                            },
                            child: Text(
                                "Networking, Server,& Cloud Administration"),
                          ), //networking
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all(Colors.white),
                                foregroundColor:
                                    WidgetStateProperty.all(Colors.blue[900]),
                                // padding: MaterialStateProperty.all(EdgeInsets.all(10.0)),
                                minimumSize: WidgetStateProperty.all(
                                    const Size(400, 60)),
                                textStyle: WidgetStateProperty.all(
                                    TextStyle(fontSize: 20.0))),
                            onPressed: () async {
                              await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context)=>const AWSPage()
                                  )
                              );
                            },
                            child: Text("AWS Architect Associate"),
                          ), //aws
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all(Colors.white),
                                foregroundColor:
                                    WidgetStateProperty.all(Colors.blue[900]),
                                // padding: MaterialStateProperty.all(EdgeInsets.all(10.0)),
                                minimumSize: WidgetStateProperty.all(
                                    const Size(400, 60)),
                                textStyle: WidgetStateProperty.all(
                                    TextStyle(fontSize: 20.0))),
                            onPressed: () async {
                              await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context)=>const AzurePage()
                                  )
                              );
                            },
                            child: Text("Ms Azure Cloud Administator"),
                          ), //Ms Azure
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all(Colors.white),
                                foregroundColor:
                                    WidgetStateProperty.all(Colors.blue[900]),
                                // padding: MaterialStateProperty.all(EdgeInsets.all(10.0)),
                                minimumSize: WidgetStateProperty.all(
                                    const Size(400, 60)),
                                textStyle: WidgetStateProperty.all(
                                    TextStyle(fontSize: 20.0))),
                            onPressed: () async {
                              await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context)=>const RHCSAPage()
                                  )
                              );
                            },
                            child: Text(
                                "Red Hat Certified System Administator (RHCSA)"),
                          ), //RHCSA
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all(Colors.white),
                                foregroundColor:
                                    WidgetStateProperty.all(Colors.blue[900]),
                                // padding: MaterialStateProperty.all(EdgeInsets.all(10.0)),
                                minimumSize: WidgetStateProperty.all(
                                    const Size(400, 60)),
                                textStyle: WidgetStateProperty.all(
                                    TextStyle(fontSize: 20.0))),
                            onPressed: () async {
                              await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context)=>const RHCEPage()
                                  )
                              );
                            },
                            child: Text("Red Hat Certified Engineer (RHCE)"),
                          ), //RHCE
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all(Colors.white),
                                foregroundColor:
                                    WidgetStateProperty.all(Colors.blue[900]),
                                // padding: MaterialStateProperty.all(EdgeInsets.all(10.0)),
                                minimumSize: WidgetStateProperty.all(
                                    const Size(400, 60)),
                                textStyle: WidgetStateProperty.all(
                                    TextStyle(fontSize: 20.0))),
                            onPressed: () async {
                              await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context)=>const DevOpsPage()
                                  )
                              );
                            },
                            child: Text("DevOps Engineer"),
                          ), //DevOPs
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all(Colors.white),
                                foregroundColor:
                                    WidgetStateProperty.all(Colors.blue[900]),
                                // padding: MaterialStateProperty.all(EdgeInsets.all(10.0)),
                                minimumSize: WidgetStateProperty.all(
                                    const Size(400, 60)),
                                textStyle: WidgetStateProperty.all(
                                    TextStyle(fontSize: 20.0))),
                            onPressed: () async {
                              await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context)=>const CISCOPage()
                                  )
                              );
                            },
                            child: Text(
                                "Cisco Certified Network Associate (CCNA)"),
                          ), //Cisco
                          const SizedBox(
                            height: 10,
                          ),

                          Text(
                            "Other Courses",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all(Colors.white),
                                foregroundColor:
                                    WidgetStateProperty.all(Colors.blue[900]),
                                // padding: MaterialStateProperty.all(EdgeInsets.all(10.0)),
                                minimumSize: WidgetStateProperty.all(
                                    const Size(400, 60)),
                                textStyle: WidgetStateProperty.all(
                                    TextStyle(fontSize: 20.0))),
                            onPressed: () async {
                              await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context)=>const DaatasciencePage()
                                  )
                              );
                            },
                            child: Text("Data Science & AI"),
                          ), //Data Science
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all(Colors.white),
                                foregroundColor:
                                    WidgetStateProperty.all(Colors.blue[900]),
                                // padding: MaterialStateProperty.all(EdgeInsets.all(10.0)),
                                minimumSize: WidgetStateProperty.all(
                                    const Size(400, 60)),
                                textStyle: WidgetStateProperty.all(
                                    TextStyle(fontSize: 20.0))),
                            onPressed: () async {
                              await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context)=>const DataAnalyticsPage()
                                  )
                              );
                            },
                            child: Text("Data Analytics"),
                          ), //Data Analytics
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all(Colors.white),
                                foregroundColor:
                                    WidgetStateProperty.all(Colors.blue[900]),
                                // padding: MaterialStateProperty.all(EdgeInsets.all(10.0)),
                                minimumSize: WidgetStateProperty.all(
                                    const Size(400, 60)),
                                textStyle: WidgetStateProperty.all(
                                    TextStyle(fontSize: 20.0))),
                            onPressed: () async {
                              await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context)=>const DigitalMarketingPage()
                                  )
                              );
                            },
                            child: Text("Digital Marketing Expert"),
                          ), //Digital marketing
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all(Colors.white),
                                foregroundColor:
                                    WidgetStateProperty.all(Colors.blue[900]),
                                // padding: MaterialStateProperty.all(EdgeInsets.all(10.0)),
                                minimumSize: WidgetStateProperty.all(
                                    const Size(400, 60)),
                                textStyle: WidgetStateProperty.all(
                                    TextStyle(fontSize: 20.0))),
                            onPressed: () async {
                              await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context)=>const MicrosoftPage()
                                  )
                              );
                            },
                            child: Text("Microsoft Power BI"),
                          ), //Microsoft Power BI
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ), //Courses
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 350,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            "assets/homepage/youtube background.jpg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ), //Youtube video

                        Padding(
                          padding: EdgeInsets.all(30.0),
                          child: Container(
                            child: Column(
                              children: [
                                Text(
                                  'SCOPE INDIA is open 365 days a year',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 32,
                                      color: Colors.blue[900]),
                                ),
                                SizedBox(
                                  height: 60,
                                ),
                                Text(
                                  'We are open 7 days 24 hrs to talk to  you and listen to your queries.',
                                  style: TextStyle(
                                      fontSize: 24, color: Colors.black),
                                ),
                                SizedBox(
                                  height: 60,
                                ),
                                Text(
                                  'GET A FREE CALL BACK',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 32,
                                      color: Colors.brown[700]),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Form(
                                    key: _formkey,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 10,),
                                        TextFormField(
                                          onChanged: (i){
                                            name=i;
                                          },
                                          controller: emailController,
                                          autovalidateMode: AutovalidateMode.onUserInteraction,
                                          keyboardType: TextInputType.emailAddress,style: TextStyle(color: Colors.grey[500]),
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.grey[200],
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(25.0),
                                              borderSide: BorderSide(
                                                color: Colors.blueGrey,
                                                width: 2.0,
                                              ),
                                            ),


                                            labelText: "Enter your email",
                                            labelStyle: TextStyle(
                                                color: Colors.grey[500]
                                            ),
                                            hintText: "Your email id is your username",
                                            hintStyle: TextStyle(
                                                color: Colors.grey[200]
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

                                        ),      //email
                                        SizedBox(height: 10,),
                                        TextFormField(
                                          onChanged: (i){
                                            name=i;
                                          },
                                          controller: nameController,
                                          autovalidateMode: AutovalidateMode.onUserInteraction,
                                          keyboardType: TextInputType.text,style: TextStyle(color: Colors.grey[500]),
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.grey[200],
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(25.0),
                                              borderSide: BorderSide(
                                                color: Colors.blueGrey,
                                                width: 2.0,
                                              ),
                                            ),


                                            labelText: "Enter your name",
                                            labelStyle: TextStyle(
                                                color: Colors.grey[500]
                                            ),
                                            hintText: "Your email id is your username",
                                            hintStyle: TextStyle(
                                                color: Colors.grey[200]
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return 'Please enter your name';
                                            }
                                            return null;
                                          },

                                        ), //name
                                        SizedBox(height: 10),
                                        TextFormField(
                                          onChanged: (i){
                                            phone=i;
                                          },
                                          controller: phoneController,
                                          autovalidateMode: AutovalidateMode.onUserInteraction,
                                          keyboardType: TextInputType.phone,style: TextStyle(color: Colors.grey[500]),
                                          decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.grey[200],
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(25.0),
                                                borderSide: BorderSide(
                                                  color: Colors.blueGrey,
                                                  width: 2.0,
                                                ),
                                              ),
                                              labelText: "Enter your phone number",
                                              labelStyle: TextStyle(
                                                  color: Colors.grey[500]
                                              )
                                          ),
                                          validator: (value){
                                            if(value!.length<10){
                                              return "Please Enter valid phone number";
                                            }
                                            return null;
                                          },
                                        ), //phone

                                        SizedBox(height: 10,),
                                        Center(
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor: WidgetStateProperty.all(Colors.purple),
                                                foregroundColor: WidgetStateProperty.all(Colors.white),
                                                // padding: MaterialStateProperty.all(EdgeInsets.all(10.0)),
                                                minimumSize: WidgetStateProperty.all(Size(200, 40)),
                                                textStyle: WidgetStateProperty.all(TextStyle(
                                                    fontSize: 20.0
                                                ))
                                            ),
                                            onPressed: _addData,

                                            child: Text("Call Me"),
                                          ),
                                        ), //button "call me"


                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.deepPurple[900],
              width: 500,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Text("1000+",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 42,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[200])),
                          Text("STUDENTS ARE TRAINED EVERY YEAR",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  height: 1.1,
                                  wordSpacing: 0.1,
                                  // letterSpacing: 0.1,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          SizedBox(
                            height: 20,
                          ),
                          Text("30+",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 42,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[200])),
                          Text("COMPUTER COURSES",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  height: 1.1,
                                  wordSpacing: 0.1,
                                  // letterSpacing: 0.1,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          SizedBox(
                            height: 20,
                          ),
                          Text("95%",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 42,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[200])),
                          Text("STUDENTS ARE GETTINGPLACED EVERY YEAR",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  height: 1.1,
                                  wordSpacing: 0.1,
                                  // letterSpacing: 0.1,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 200.0,
                      width: 400,
                      child: Image.asset(
                        'assets/white2.png',
                        fit: BoxFit.fill,
                        height: 32,
                      ),
                    ),

                    SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: Container(
                        height: 200.0,
                        width: 400,
                        child: Image.asset(
                          'assets/homepage/scope India.png',
                          fit: BoxFit.fill,
                          height: 32,
                        ),
                      ),
                    ), //scopeindia

                    Text(
                        "Kerala: Technopark TVM | Thampanoor TVM | Kaloor Kochi, Tamil Nadu: Distillery Road | Palace Road Nagercoil",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            height: 1.1,
                            wordSpacing: 0.1,
                            // letterSpacing: 0.1,
                            fontSize: 20,
                            color: Colors.white)), //address

                    Container(
                      child: Image.asset(
                        'assets/homepage/iso logo.png',
                        fit: BoxFit.fitHeight,
                      ),
                    ),

                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: EdgeInsets.all(1.0),
                      child: Column(
                          children: [
                            Text("An ISO 9001:2015 Certified Company",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    height: 1.1,
                                    wordSpacing: 0.1,
                                    fontSize: 16,
                                    color: Colors.lightBlue[200]
                                )),
                            SizedBox(height: 0.1,),

                            Column(
                              children: [
                                Text("All Rights Reserved ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        height: 1.1,
                                        wordSpacing: 0.1,
                                        fontSize: 16,
                                        color: Colors.lightBlue[200]
                                    )),
                                Column(
                                  children: [

                                    Text(" Suffix E Solutions ©  2007-2024",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            height: 1.1,
                                            wordSpacing: 0.1,
                                            fontSize: 18,
                                            color: Colors.white
                                        )),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 0.1,),

                            SizedBox(height: 50,),
                            Column(
                              children: [
                                TextButton(
                                  onPressed: () => _makePhoneCall("+919745936073"),
                                  child: Text("+91 9745936073 (TKP)",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          height: 1.1,
                                          wordSpacing: 0.1,
                                          fontSize: 20,
                                          color: Colors.white
                                      )
                                  ),

                                ),
                                TextButton(
                                  onPressed: () => _makePhoneCall("+91 9745936073"),
                                  child: Text("+91 9745936073 (TVM)",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          height: 1.1,
                                          wordSpacing: 0.1,
                                          fontSize: 20,
                                          color: Colors.white
                                      )
                                  ),

                                ),
                                TextButton(
                                  onPressed: () => _makePhoneCall("+917592939481"),
                                  child: Text("+91 7592939481 (EKM)",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          height: 1.1,
                                          wordSpacing: 0.1,
                                          fontSize: 20,
                                          color: Colors.white
                                      )
                                  ),

                                ),

                                TextButton(
                                  onPressed: () => _makePhoneCall("+918075536185"),
                                  child: Text("+91 8075536185 (NGL)",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          height: 1.1,
                                          wordSpacing: 0.1,
                                          fontSize: 20,
                                          color: Colors.white
                                      )
                                  ),

                                ),

                                TextButton(
                                  onPressed: () => _sendEmail("info@scopeindia.org"),
                                  child: Text("info@scopeindia.org",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          height: 1.1,
                                          wordSpacing: 0.1,
                                          fontSize: 20,
                                          color: Colors.white
                                      )
                                  ),

                                )
                              ],
                            )



                          ]
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
