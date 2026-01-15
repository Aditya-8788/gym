import 'package:flutter/material.dart';
import 'package:gym/muscle_page.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children:[
            SizedBox(height: 120),
            Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Login Page',
                  style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text('This is the login page.',
              style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
              
              ) 
            ),
            SizedBox(
              height: 100,
              width: 300,
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.orange,
                    width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                
                labelText: 'Email',
                prefixIcon: Icon(Icons.email, color: Colors.orange,),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 100,
              width: 300,
              child: TextField(
                keyboardType: TextInputType.numberWithOptions(),
                decoration: InputDecoration(
                  helper: Text('Enter your password'),
                  labelText: 'Password',
                ),
              obscureText: true,
              ),
            ),
            SizedBox(height: 330),
            Row(
              children: [
                SizedBox(width: 20),
                SizedBox(
                    height:50,
                    width:140,
                    child:ElevatedButton(onPressed: (){
                      Navigator.pop(context);
                    },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrangeAccent, 
                        minimumSize: const Size(40, 50), 
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text("previous",style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),))
                  ),
                  SizedBox(
                    width: 90,
                  ),
                  SizedBox(
                    height: 50,
                    width: 140,
                    child:ElevatedButton(onPressed: (){
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MusclePage()),
                      );
                    },
                    style:ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrangeAccent, 
                      minimumSize: const Size(40, 50), 
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text("next",style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),))
                  )
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}