import'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../aboutUs.dart';
import '../contactUs.dart';
import '../courses.dart';
import '../homePage.dart';



class DigitalMarketingPage extends StatefulWidget {
  const DigitalMarketingPage({super.key});

  @override
  State<DigitalMarketingPage> createState() => _DigitalMarketingPageState();
}

class _DigitalMarketingPageState extends State<DigitalMarketingPage> {
  List courses=[
    'HTML 6 Basics',
    'Digital Marketing Overview',
    'Advanced Keyword Research',
    'Website Planning and Structuring',
   ' WordPress Website Designing',
    'Advanced SEO - On page | Technical | Off page',
    'SEO Audits - Google Analytics',
    'SEO Audits - Google Search Console',
    'SEO Audits - Google Tag Manager',
    'Search Engine Marketing',
    'Social Media Marketing',
    'Google Search Advertising',
    'Affiliate Marketing',
    'Content Marketing',
    'Mobile SEO Techniques',
    'E-Commerce SEO',
    'BlackHat SEO',
    'Advanced SEO Techniques',
    'Live Projects with Suffix E Solutions',
    'Interview Preparation',
    'OJT'
  ];

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
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          // Status bar color
          statusBarColor: Colors.transparent,

          statusBarIconBrightness: Brightness.light, // For Android (dark icons)

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
                  SizedBox(height: 20,),
                  ElevatedButton(

                    onPressed: () {
                      print('Button 1 Pressed');
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
                ],
              ),
            ),

          ],
        ),
      ),
      body: ListView(
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
                  SizedBox(height: 30,),
                  Container(
                    child: Column(
                      children: [
                        Text("Digital Marketing Course & Internship",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 42,
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow
                            )),


                        SizedBox(height: 20,),
                        Text("All Trainers at SCOPE INDIA are working professionals, Software Engineers, Networking Engineers, and Software Test Engineers of Suffix E Solutions with ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.1,
                                wordSpacing: 0.1,
                                // letterSpacing: 0.1,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            )),

                        SizedBox(height: 40,),
                        Text("17 years of Industrial experience.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.2,
                                // wordSpacing: 0.1,
                                // letterSpacing: 0.1,
                                fontSize: 26,
                                color: Colors.yellow
                            )),

                        SizedBox(height: 20,),
                        Padding(
                          padding: EdgeInsets.all(30.0),
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.blue[200]?.withOpacity(0.3),
                                      border: Border.all(
                                          color: Colors.red[200]!.withOpacity(0.8),
                                          width: 3.0
                                      ),
                                      borderRadius: BorderRadius.circular(1.0)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text('3 months course + 3 months on the Job Training',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.blue[200]?.withOpacity(0.3),
                                      border: Border.all(
                                          color: Colors.red[200]!.withOpacity(0.8),
                                          width: 3.0
                                      ),
                                      borderRadius: BorderRadius.circular(1.0)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      children: [
                                        Text(" Next Batches \n ",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Colors.white),),

                                        Text("19th September 2024: 	Thampanoor TVM \n23rd September 2024:	Technopark TVM \n23rd September 2024:	Kochi \n26th September 2024:	Nagercoil \n23rd September 2024:	Online",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: Colors.white),),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),



                        Container(
                          height: 80,
                          width: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/homepage/star.png"),
                              fit: BoxFit.fill,
                            ),),
                        ),
                        Text("Google 4.9 * Rated Institute",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white
                            )),

                        SizedBox(height: 20,),
                        Container(
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: courses.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                tileColor: Colors.blue,
                                leading: CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  child: Text((index + 1).toString()), // Display tile number
                                ),
                                title: Text("${courses[index]}",style: TextStyle(color: Colors.white),),

                              );
                            },
                          ),
                        ),



                        SizedBox(height: 40,),
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(1),
                                ),
                                backgroundColor: Colors.grey,
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
                                      builder: (context)=>const Courses()
                                  )
                              );
                            },
                            child: Text("More Courses"),
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
                            onPressed: () {
                              print("Register now");
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(
                                    "Register Now")),
                              );
                            },
                            child: Text("Register Now!"),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ), //description

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
                          Text("1000+",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 42,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.yellow
                              )),
                          Text("STUDENTS ARE TRAINED EVERY YEAR",
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
                          Text("30+",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 42,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.yellow
                              )),
                          Text("COMPUTER COURSES",
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
                          Text("95%",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 42,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.yellow
                              )),
                          Text("STUDENTS ARE GETTINGPLACED EVERY YEAR",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  height: 1.1,
                                  wordSpacing: 0.1,
                                  // letterSpacing: 0.1,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              )),

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
            ),]

      ),
    );
  }
}
