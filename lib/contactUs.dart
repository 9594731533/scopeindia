import 'package:cloud_firestore/cloud_firestore.dart';
import'package:flutter/material.dart';
import 'package:scopeindia/registerNow.dart';


import 'aboutUs.dart';
import 'courses.dart';
import 'homePage.dart';


class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final _formkey=GlobalKey<FormState>();
  TextEditingController nameController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController emailController=TextEditingController();


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
            ListTile(
              leading: const Icon(Icons.home_filled),
              title: const Text('Home'),
              onTap: () async {
                await Navigator.push(
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
                await Navigator.push(
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
                await Navigator.push(
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
                await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context)=>const ContactUs()
                    )
                );
              },
            ),
            ElevatedButton(

              onPressed: () {
                print('Button 1 Pressed');
              },
              style:  ElevatedButton.styleFrom(
                backgroundColor:  Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text('Register Now'),
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/blue background.jpg"),
                    fit: BoxFit.fill,opacity: 0.9
                ),

              ),
              child: Column(
                children: [
                  SizedBox(height: 50,),




                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 30,),
                        Container(
                          child: Column(
                            children: [
                              Text("SCOPE INDIA, your career partner!",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 42,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.yellow
                                  )),

                              SizedBox(height: 20,),
                              Text("Let's discuss your career, 24/7 free Consultation",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      height: 1.1,
                                      wordSpacing: 0.1,
                                      // letterSpacing: 0.1,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                  )),

                              SizedBox(height: 20,),
                              Container(
                                height: 120,
                                width: 300,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/homepage/star.png"),
                                    fit: BoxFit.fill,
                                  ),),
                              ),
                              Container(
                                child: Text("Google 4.9 * Rated Institute",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.white
                                    )),
                              ),

                              const SizedBox(height: 20,),
                              Container(
                                width: 350,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/homepage/youtube background.jpg"),
                                    fit: BoxFit.fill,

                                  ),),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 40,),//Youtube video

                                    Padding(
                                      padding: EdgeInsets.all(30.0),
                                      child: Container(
                                        child: Column(
                                          children: [
                                            Text('SCOPE INDIA is open 365 days a year',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 32,
                                                  color: Colors.blue[900]
                                              ),),
                                            SizedBox(height: 60,),
                                            Text('We are open 7 days 24 hrs to talk to  you and listen to your queries.',
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  color: Colors.black
                                              ),),
                                            SizedBox(height: 60,),
                                            Text('GET A FREE CALL BACK',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 32,
                                                  color: Colors.brown[700]
                                              ),),
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
                                                      autofocus: false,
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
                                                      autofocus: false,
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
                                                      autofocus: false,
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


                              SizedBox(height: 40,),
                              Center(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(1),
                                      ),
                                      backgroundColor: Colors.green,
                                      foregroundColor: Colors.white,
                                      // padding: MaterialStateProperty.all(EdgeInsets.all(10.0)),
                                      minimumSize: Size(400, 60),
                                      textStyle: TextStyle(
                                          fontSize: 20.0
                                      )
                                  ),
                                  onPressed:() async {
                                    await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context)=>const Courses()
                                        )
                                    );
                                  },
                                  child: Text("Courses"),
                                ),
                              ),

                              SizedBox(height: 20,),
                              Center(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(1),
                                      ),
                                      backgroundColor: Colors.green,
                                      foregroundColor: Colors.white,
                                      // padding: MaterialStateProperty.all(EdgeInsets.all(10.0)),
                                      minimumSize: Size(400, 60),
                                      textStyle: TextStyle(
                                          fontSize: 20.0
                                      )
                                  ),
                                  onPressed: () async {
                                    await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context)=>const RegisterNow()
                                        )
                                    );
                                  },
                                  child: Text("Register Now!"),
                                ),
                              ),




                              




                            ],
                          ),
                        )
                      ],
                    ),
                  ), //description
                  SizedBox(height: 40,),
                  Text("Locations")



                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(color:Colors.deepPurple[900], ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 50,),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 400,
                            width: 350,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.white,
                                    width: 2.0
                                ),
                                borderRadius: BorderRadius.circular(25.0)
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: 20,),
                                Text("Technopark TVM, Kerala",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26,color: Colors.white),),
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.location_on_outlined),
                                    Text(" Phase 1, Main Gate, Diamond Arcade, \n Near Technopark, Trivandrum",style: TextStyle(fontSize: 16,color: Colors.white),),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                TextButton(onPressed: (){print("Text Button Is Pressed");},
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.phone),
                                      Text(" +919745936073",style: TextStyle(fontSize: 16,color: Colors.white),),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 10,),
                                TextButton(onPressed: (){print("Text Button Is Pressed");},
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.mail),
                                      Text("  info@scopeindia.org",style: TextStyle(fontSize: 16,color: Colors.white),),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 10,),
                                TextButton(onPressed: (){print("Text Button Is Pressed");},
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.link),
                                      Text("   www.scopeindia.org",style: TextStyle(fontSize: 16,color: Colors.white),),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 10,),
                                TextButton(onPressed: (){print("Text Button Is Pressed");},
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.map_outlined),
                                      Text("  Location Route Map",style: TextStyle(fontSize: 16,color: Colors.white),),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),

                          Container(
                            height: 400,
                            width: 350,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.white,
                                    width: 2.0
                                ),
                                borderRadius: BorderRadius.circular(25.0)
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: 20,),
                                Text("Thampanoor TVM, Kerala",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26,color: Colors.white),),
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.location_on_outlined),
                                    Text(" TC 25/1403/3, Athens Plaza, SS Kovil \nRoad, Thampanoor, Trivandrum, \nKerala 695001",style: TextStyle(fontSize: 16,color: Colors.white),),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                TextButton(onPressed: (){print("Text Button Is Pressed");},
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.phone),
                                      Text(" +919745936073",style: TextStyle(fontSize: 16,color: Colors.white),),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 10,),
                                TextButton(onPressed: (){print("Text Button Is Pressed");},
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.mail),
                                      Text("  info@scopeindia.org",style: TextStyle(fontSize: 16,color: Colors.white),),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 10,),
                                TextButton(onPressed: (){print("Text Button Is Pressed");},
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.link),
                                      Text("   www.scopeindia.org",style: TextStyle(fontSize: 16,color: Colors.white),),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 10,),
                                TextButton(onPressed: (){print("Text Button Is Pressed");},
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.map_outlined),
                                      Text("  Location Route Map",style: TextStyle(fontSize: 16,color: Colors.white),),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),

                          Container(
                            height: 400,
                            width: 350,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.white,
                                    width: 2.0
                                ),
                                borderRadius: BorderRadius.circular(25.0)
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: 10,),
                                Text("Kochi, Kerala",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26,color: Colors.white),),
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.location_on_outlined),
                                    Text("  SCOPE INDIA, Vasanth Nagar Rd,\nnear JLN Metro Station, Kaloor, Kochi,\nKerala 682025",style: TextStyle(fontSize: 16,color: Colors.white),),
                                  ],
                                ),
                                SizedBox(height: 20,),
                                TextButton(onPressed: (){print("Text Button Is Pressed");},
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.phone),
                                      Text(" +917592939481",style: TextStyle(fontSize: 16,color: Colors.white),),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 10,),
                                TextButton(onPressed: (){print("Text Button Is Pressed");},
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.mail),
                                      Text("  kochi@scopeindia.org",style: TextStyle(fontSize: 16,color: Colors.white),),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 10,),
                                TextButton(onPressed: (){print("Text Button Is Pressed");},
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.link),
                                      Text("   www.scopeindia.org",style: TextStyle(fontSize: 16,color: Colors.white),),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 10,),
                                TextButton(onPressed: (){print("Text Button Is Pressed");},
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.map_outlined),
                                      Text("  Location Route Map",style: TextStyle(fontSize: 16,color: Colors.white),),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),

                          Container(
                            height: 400,
                            width: 350,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.white,
                                    width: 2.0
                                ),
                                borderRadius: BorderRadius.circular(25.0)
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: 20,),
                                Text("Nagercoil, Tamil Nadu",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26,color: Colors.white),),
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.location_on_outlined),
                                    Text(" SCOPE INDIA, Near WCC College,\nPalace Rd, Nagercoil, Tamil Nadu 629001",style: TextStyle(fontSize: 16,color: Colors.white),),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                TextButton(onPressed: (){print("Text Button Is Pressed");},
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.phone),
                                      Text(" +918075536185",style: TextStyle(fontSize: 16,color: Colors.white),),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 10,),
                                TextButton(onPressed: (){print("Text Button Is Pressed");},
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.mail),
                                      Text("  ngl@scopeindia.org",style: TextStyle(fontSize: 16,color: Colors.white),),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 10,),
                                TextButton(onPressed: (){print("Text Button Is Pressed");},
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.link),
                                      Text("   www.scopeindia.org",style: TextStyle(fontSize: 16,color: Colors.white),),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 10,),
                                TextButton(onPressed: (){print("Text Button Is Pressed");},
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.map_outlined),
                                      Text("  Location Route Map",style: TextStyle(fontSize: 16,color: Colors.white),),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),

                          Container(
                            height: 400,
                            width: 350,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.white,
                                    width: 2.0
                                ),
                                borderRadius: BorderRadius.circular(25.0)
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: 20,),
                                Text("Nagercoil, Tamil Nadu",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26,color: Colors.white),),
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.location_on_outlined),
                                    Text(" SCOPE INDIA, Pharma Street, 5/2 Ward 28,\nDistillery Road, Putheri Nagercoil\n(Near WCC Jn)",style: TextStyle(fontSize: 16,color: Colors.white),),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                TextButton(onPressed: (){print("Text Button Is Pressed");},
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.phone),
                                      Text(" +918075536185",style: TextStyle(fontSize: 16,color: Colors.white),),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 10,),
                                TextButton(onPressed: (){print("Text Button Is Pressed");},
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.mail),
                                      Text("  ngl@scopeindia.org",style: TextStyle(fontSize: 16,color: Colors.white),),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 10,),
                                TextButton(onPressed: (){print("Text Button Is Pressed");},
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.link),
                                      Text("   www.scopeindia.org",style: TextStyle(fontSize: 16,color: Colors.white),),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 10,),
                                TextButton(onPressed: (){print("Text Button Is Pressed");},
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.map_outlined),
                                      Text("  Location Route Map",style: TextStyle(fontSize: 16,color: Colors.white),),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),


                          Container(
                            height: 200.0,
                            width:400,
                            child: Image.asset(
                              'assets/white2.png',
                              fit: BoxFit.fill,
                              height: 32,
                            ),

                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 50,),
                    Center(
                      child: Container(
                        height: 200.0,
                        width:400,
                        child: Image.asset(
                          'assets/homepage/scope India.png',
                          fit: BoxFit.fill,
                          height: 32,
                        ),

                      ),
                    ), //scopeindia

                    Text("Kerala: Technopark TVM | Thampanoor TVM | Kaloor Kochi, Tamil Nadu: Distillery Road | Palace Road Nagercoil",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            height: 1.1,
                            wordSpacing: 0.1,
                            // letterSpacing: 0.1,
                            fontSize: 20,
                            color: Colors.white
                        )), //address

                    Container(

                      child: Image.asset(
                        'assets/homepage/iso logo.png',
                        fit: BoxFit.fitHeight,
                      ),
                    ),


                    SizedBox(height: 30,),
                    Container(
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

                            Row(
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

                                    Text(" Suffix E Solutions ©  ",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            height: 1.1,
                                            wordSpacing: 0.1,
                                            fontSize: 18,
                                            color: Colors.white
                                        )),
                                  ],
                                ),
                                Text("2007-2024",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        height: 1.1,
                                        wordSpacing: 0.1,
                                        fontSize: 16,
                                        color: Colors.lightBlue[200]
                                    )),
                              ],
                            ),
                            SizedBox(height: 0.1,),



                          ]
                      ),
                    ),
                    SizedBox(height: 50,),
                    Column(
                      children: [
                        TextButton(
                          onPressed: (){},
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
                          onPressed: (){},
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
                          onPressed: (){},
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
                          onPressed: (){},
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
                          onPressed: (){},
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
