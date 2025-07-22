import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:test_application/auth_wrapper.dart';
import 'package:test_application/chatting.dart';
import 'package:test_application/update.dart';

import 'package:test_application/verification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Auth Demo',
      // routes: {
      //   '/': (context) => Verification(),
      //   '/update': (context) => UpdateUserPage(),
        
      // },
      // initialRoute: '/',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
      debugShowCheckedModeBanner: false,
      home:Verification()
    );
  }
}
// import 'package:flutter/material.dart';

class Chatting extends StatefulWidget {
  const Chatting({super.key});

  @override
  State<Chatting> createState() => _ChattingState();
}

class _ChattingState extends State<Chatting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.blue),
        ),
        // backgroundColor: Colors.white,
        actions: [
          Row(
            children: [
              CircleAvatar(radius: 25, backgroundColor: Colors.blue),
              SizedBox(width: 25),
              Text('Martha', style: TextStyle(fontSize: 20)),
              SizedBox(width: 100),
              Icon(Icons.call, color: Colors.blue, size: 25),
              SizedBox(width: 20),
              Icon(Icons.video_call, color: Colors.blue, size: 25),
              SizedBox(width: 25),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              height: 275,
              width: 255,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(0)),
              child: Column(
                children: [
                  SizedBox(height: 15),
                  Center(
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: CircleAvatar(backgroundColor: Colors.blue),
                    ),
                  ),
                  Text('Martha', style: TextStyle(fontSize: 20)),
                  SizedBox(height: 50),
                  Text(
                    'say hi to your new Friend, Martha',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 136, 134, 134),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Text('10:28'),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.only(left: 250),
            child: Container(
              height: 83,
              width: 107,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(0)),
              child: Center(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 83,
                    width: 83,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/hand.png'),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Text('10:35'),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(right: 200),
            child: Container(
              height: 36,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(95, 162, 160, 160),
              ),
              child: Center(child: Text('Hello, How are you...?')),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          TextField(
            
          )
        ],
      ),
    );
  }
}
