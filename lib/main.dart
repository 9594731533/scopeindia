import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:scopeindia/homePage.dart';

// void main() {
//   runApp(const MyApp());
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try{
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyA6FxgSb17Jl0KVgrEHVNoF9FFgPcY0_Dk",
          appId: "1:471363912660:android:2205acbf9b4b5504be8c41",
          messagingSenderId: "471363912660",
          projectId: "scope-f9232"
      ),
    );
    runApp((MaterialApp(darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        home:const Homepage())));
  }
  catch(error){
    if (kDebugMode) {
      print(error) ;
    }

  }
}

