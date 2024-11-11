import'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scopeindia/aboutUs.dart';
import 'package:scopeindia/contactUs.dart';
import 'package:scopeindia/courses/aws.dart';
import 'package:scopeindia/courses/azure.dart';
import 'package:scopeindia/courses/devops.dart';
import 'package:scopeindia/courses/digitalmarketing.dart';
import 'package:scopeindia/courses/dotnet.dart';
import 'package:scopeindia/courses/flutter.dart';
import 'package:scopeindia/courses/java.dart';
import 'package:scopeindia/courses/mern.dart';
import 'package:scopeindia/courses/php.dart';
import 'package:scopeindia/courses/python.dart';
import 'package:scopeindia/courses/softwaretesting.dart';
import 'package:scopeindia/registerNow.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'courses.dart';


late String name;
late String phone;

bool validateEmail(String email) {
  // Define the regex pattern for a valid email address
  String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
  RegExp regex = RegExp(pattern);
  return regex.hasMatch(email);
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});


  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

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



  final _formkey=GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController nameController=TextEditingController();

  YoutubePlayerController _controller = YoutubePlayerController(

    initialVideoId: 'eIFj4nYNYbw',
    flags: YoutubePlayerFlags(
      mute: false,
      autoPlay: true,
      disableDragSeek: false,
      loop: false,
      isLive: false,
      forceHD: false,
      enableCaption: true,
    ),
  );




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
                ],
              ),
            ),

          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Container(

          decoration: BoxDecoration(
            image: DecorationImage(
            image: AssetImage("assets/blue background.jpg"),
            fit: BoxFit.fitHeight,
          ),),
          child: Column(
            children: [
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

              SizedBox(height: 20,),

              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context)=>const AWSPage()
                            )
                        );
                      },
                      child: Container(
                        height: 200,
                        width: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/homepage/aws.jpg"),
                            fit: BoxFit.fitHeight,
                          ),

                        ),
                      ),
                    ), //aws

                    GestureDetector(
                        onTap: () async {
                          await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context)=>const AzurePage()
                              )
                          );
                        },
                      child: Container(
                        height: 200,
                        width: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/homepage/azure.jpg"),
                            fit: BoxFit.fitHeight,
                          ),

                        ),
                      ),
                    ), //azure

                    GestureDetector(
                      onTap: () async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context)=>const DevOpsPage()
                            )
                        );
                      },
                      child: Container(
                        height: 200,
                        width: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/homepage/Devops training.jpg"),
                            fit: BoxFit.fitHeight,
                          ),

                        ),
                      ),
                    ), //Devops

                    GestureDetector(
                      onTap: () async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context)=>const DigitalMarketingPage()
                            )
                        );
                      },
                      child: Container(
                        height: 200,
                        width: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/homepage/digital marketing.jpg"),
                            fit: BoxFit.fitHeight,
                          ),

                        ),
                      ),
                    ), //digital marketing

                    GestureDetector(
                      onTap: () async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context)=>const DotnetPage()
                            )
                        );
                      },
                      child: Container(
                        height: 200,
                        width: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/homepage/dotnet core.jpg"),
                            fit: BoxFit.fitHeight,
                          ),

                        ),
                      ),
                    ), //dotnet core

                    GestureDetector(
                      onTap: () async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context)=>const FlutterPage()
                            )
                        );
                      },
                      child: Container(
                        height: 200,
                        width: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/homepage/flutter fullstack.jpg"),
                            fit: BoxFit.fitHeight,
                          ),

                        ),
                      ),
                    ), //flutter fullstack

                    GestureDetector(
                      onTap: () async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context)=>const JavaPage()
                            )
                        );
                      },
                      child: Container(
                        height: 200,
                        width: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/homepage/java fullstack.jpg"),
                            fit: BoxFit.fitHeight,
                          ),

                        ),
                      ),
                    ), //java fullstack

                    GestureDetector(
                      onTap: () async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context)=>const MERNPage()
                            )
                        );
                      },
                      child: Container(
                        height: 200,
                        width: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/homepage/mean-mern stack.jpg"),
                            fit: BoxFit.fitHeight,
                          ),

                        ),
                      ),
                    ), //mean-mern stack

                    GestureDetector(
                      onTap: () async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context)=>const PHPPage()
                            )
                        );
                      },
                      child: Container(
                        height: 200,
                        width: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/homepage/php fullstack.jpg"),
                            fit: BoxFit.fitHeight,
                          ),

                        ),
                      ),
                    ), //php fullstack

                    GestureDetector(
                      onTap: () async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context)=>const PythonPage()
                            )
                        );
                      },
                      child: Container(
                        height: 200,
                        width: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/homepage/python fullstack.jpg"),
                            fit: BoxFit.fitHeight,
                          ),

                        ),
                      ),
                    ), //python fullstack

                    GestureDetector(
                      onTap: () async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context)=>const SoftwareTestingPage()
                            )
                        );
                      },
                      child: Container(
                        height: 200,
                        width: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/homepage/softwaretesting-manual automation.jpg"),
                            fit: BoxFit.fitHeight,
                          ),

                        ),
                      ),
                    ), //softwaretesting-manual automation



                  ]
                ),
              ) ,//Courses
              SizedBox(height: 20,),

              Container(
                height: 920,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/homepage/youtube background.jpg"),
                    fit: BoxFit.fitHeight,
                    opacity: 0.7
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 300,
                      child: YoutubePlayer(
                        controller: _controller,
                        bottomActions: [

                          CurrentPosition(),
                          ProgressBar(isExpanded: true),
                          PlayPauseButton(),
                          PlaybackSpeedButton(),
                          FullScreenButton(),
                        ],
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: Colors.amber,
                        progressColors: const ProgressBarColors(
                          playedColor: Colors.amber,
                          handleColor: Colors.amberAccent,
                        ),



                        onReady: () {
                          _controller.addListener(() {
                            if (_controller.value.playerState == PlayerState.playing) {
                              // The video is playing!
                            } else if (_controller.value.playerState == PlayerState.paused) {
                              // Video playback is paused.
                            }
                            // You can perform actions based on other states like ended, buffering, etc.
                          });
                          _controller.value.metaData.title; // Accessing video title
                          _controller.value.metaData.author; // Accessing video author
                        },
                      ),


                    ),

                    SizedBox(height: 40,),//Youtube video

                    Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text('SCOPE INDIA \n is open 365 days a year',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 32,
                                color: Colors.blue[900]
                              ),),
                            SizedBox(height: 20,),
                            Text('We are open 7 days 24 hrs to talk to \n you and listen to your queries.',
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
                              padding:  EdgeInsets.all(5.0),
                              child: Form(
                                key:_formkey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
              ), //youtubeplayer


              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/homepage/youtube background.jpg"),
                    fit: BoxFit.fill,
                    opacity: 0.69
                  ),),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
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
                                color: Colors.purple[900]
                            )),
                      ),
                      SizedBox(height: 30,),

                      Container(
                        child: Column(
                          children: [
                            Text("SCOPE INDIA, your career partner!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 42,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple[900]
                                )),


                            SizedBox(height: 20,),
                            Text("One of the best Training Destination for Software, Networking and Cloud Computing courses in India with 17 years of Industrial experience.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  height: 1.1,
                                    wordSpacing: 0.1,
                                    // letterSpacing: 0.1,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurple[800]
                                )),

                            SizedBox(height: 40,),
                            Text("Software, Networking, and Cloud Professional Education Centre in Kerala and Tamil Nadu from Suffix E Solutions with WORKING PROFESSIONALS oriented on-the-job TRAINING model. SCOPE INDIA provides courses for Software Programming in Python (Data Science | Artificial Intelligence | Machine Learning | Deep Learning, Data Analytics), Java, PHP, .Net, MERN, Software Testing Manual and Automation, Cloud Computing (AWS | Azure), Server Administration (MicroSoft MCSE | Linux RHCE), Networking (CCNA), DevOps, Mobile App Development in Flutter, and Digital Marketing. Training with a 100% Trusted Job-Based Internship Model. SCOPE INDIA has a Strong Placement Cell that provides jobs to thousands of students every year. We assure you, you won't regret it after training from SCOPE INDIA! \n\n This is how SCOPE INDIA can support both newbies and experienced in the industry to upgrade their skills.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    height: 1.2,
                                    // wordSpacing: 0.1,
                                    // letterSpacing: 0.1,
                                    fontSize: 26,
                                    color: Colors.deepPurple[900]
                                )),


                            SizedBox(height: 40,),
                            Center(
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: WidgetStateProperty.all(Colors.grey),
                                    foregroundColor: WidgetStateProperty.all(Colors.white),
                                    // padding: MaterialStateProperty.all(EdgeInsets.all(10.0)),
                                    minimumSize: WidgetStateProperty.all(Size(400, 60)),
                                    textStyle: WidgetStateProperty.all(TextStyle(
                                        fontSize: 20.0
                                    ))
                                ),
                                onPressed:() async {
                                  await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context)=>const Courses()
                                      )
                                  );

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text(
                                        "Courses")),
                                  );
                                },
                                child: Text("Courses"),
                              ),
                            ),

                            SizedBox(height: 20,),
                            Center(
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: WidgetStateProperty.all(Colors.green),
                                    foregroundColor: WidgetStateProperty.all(Colors.white),
                                    // padding: MaterialStateProperty.all(EdgeInsets.all(10.0)),
                                    minimumSize: WidgetStateProperty.all(Size(400, 60)),
                                    textStyle: WidgetStateProperty.all(TextStyle(
                                        fontSize: 20.0
                                    ))
                                ),
                                onPressed: () async {
                                  await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context)=>const RegisterNow()
                                      )
                                  );

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(
                                        "Courses")),
                                  );
                                },
                                child: Text("Register Now!"),
                              ),
                            ),
                            SizedBox(height: 20,),





                          ],
                        ),
                      )
                    ],
                  ),
                ),

              ), //description

              Container(
                height: 1500,
                width: 500,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/homepage/youtube background.jpg"),
                      fit: BoxFit.fill,
                      opacity: 0.69
                  ),),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Container(
                        child:
                        Column(
                          children: [
                            Image.asset(
                              'assets/homepage/training logo.png',
                              fit: BoxFit.fill,
                              height: 100,
                            ),
                            GestureDetector(
                              onTap: () async {
                                await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context)=>const Courses()
                                    )
                                );
                              },
                              child: Text("Training",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 42,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple[900]),),
                            ),
                            SizedBox(height: 20,),
                            GestureDetector(
                              onTap: () async {
                                await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context)=>const Courses()
                                    )
                                );
                              },
                              child: Text("You are trained under Suffix E Solutions,working professionals, on-the-job training model.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 26,
                                    color: Colors.purple[900]),),
                            )
                          ],
                        ),
                      ),

                      SizedBox(height: 40,),
                      Container(
                        child:
                        Column(
                          children: [
                            Image.asset(
                              'assets/homepage/internship logo.png',
                              fit: BoxFit.fill,
                              height: 100,
                            ),
                            GestureDetector(
                              onTap: () async {
                                await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context)=>const Courses()
                                    )
                                );
                              },
                              child: Text("Internship",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 42,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple[900]),),
                            ),
                            SizedBox(height: 20,),
                            Text("After course completion,you will be proceeded to live projects with a 6 months experience certificates.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 26,
                                  color: Colors.purple[900]),)
                          ],
                        ),
                      ),


                      SizedBox(height: 40,),
                      Container(
                        child:
                        Column(
                          children: [
                            Image.asset(
                              'assets/homepage/grooming logo.png',
                              fit: BoxFit.fill,
                              height: 100,
                            ),
                            GestureDetector(
                              onTap: () async {
                                await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context)=>const Courses()
                                    )
                                );
                              },
                              child: Text("Grooming",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 42,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple[900]),),
                            ),
                            SizedBox(height: 20,),
                            Text("CV Preperation,interview Preperation, and Personality Development.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 26,
                                  color: Colors.purple[900]),)
                          ],
                        ),
                      ),

                      SizedBox(height: 40,),
                      Container(
                        child:
                        Column(
                          children: [
                            Image.asset(
                              'assets/homepage/placement logo.png',
                              fit: BoxFit.fill,
                              height: 100,
                            ),
                            GestureDetector(
                              onTap: () async {
                                await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context)=>const Courses()
                                    )
                                );
                              },
                              child: Text("Placement",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 42,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple[900]),),
                            ),
                            SizedBox(height: 20,),
                            Text("Gives 100% FREE placement support to all our fellow techies through SCOPE INDIA's Placement Cell.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 26,
                                  color: Colors.purple[900]),)
                          ],
                        ),
                      ),


                    ],
                  ),
                ),

              ),

              Container(

                width: 500,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/homepage/blue background.jpg"),
                      fit: BoxFit.fill,
                      opacity: 0.3
                  ),),
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
                                    color: Colors.blue[200]
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
                                    color: Colors.blue[200]
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
                                    color: Colors.blue[200]
                                )),
                            Text("STUDENTS ARE GETTING PLACED EVERY YEAR",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    height: 1.1,
                                    wordSpacing: 0.1,
                                    // letterSpacing: 0.1,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                )),


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
      ),




    );
  }
}



