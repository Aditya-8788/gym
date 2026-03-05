import 'package:flutter/material.dart';
import 'package:gym/loginpage.dart';

class StartingPage extends StatelessWidget {
  const StartingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 150),
            
              Text('Welcome to My App', 
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w900,
                color: Colors.black,
                ),
            ),
            SizedBox(height: 400),
            Text("dataBuild strength. Build discipline.Results start with consistency.Learn exercises. Understand muscles.Train smarter for better results.",style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: const Color.fromARGB(255, 0, 0, 0),
            )),
            SizedBox(height: 50),
            SizedBox(
              height: 60,
              width: 300,
              
              child: ElevatedButton(onPressed:() {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  Loginpage()));
              },
               style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrangeAccent, 
                minimumSize: const Size(40, 50), 
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                ),
              ),
               child: Text('Get Started',
                style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: const Color.fromARGB(255, 255, 255, 255),
                
                ),
              ))
            ),
          ],
        ),
      ),
    );
  }
}