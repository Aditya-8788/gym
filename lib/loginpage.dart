import 'package:flutter/material.dart';
import 'package:gym/firstpage.dart';

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
                  color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            Text('Enter your email ',
              style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: const Color.fromARGB(255, 120, 120, 120),
              
              ) 
            ),
            SizedBox(height: 20), 
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
                    borderSide: BorderSide(color: const Color.fromARGB(255, 4, 4, 4)),
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
            //SizedBox(height: 20),
            Text('Enter your password',
              style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: const Color.fromARGB(255, 120, 120, 120),
              )
              ),
              SizedBox(height: 20),
             SizedBox(
              height: 80,
              width: 300,
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 0, 255, 26),
                    width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: const Color.fromARGB(255, 0, 0, 0)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock, color: const Color.fromARGB(255, 0, 255, 26),),
                ),
              ),
            ),
            SizedBox(height: 260),
            Row(
              children: [
                SizedBox(width: 20),
                SizedBox(
                    height:60,
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
                      child: Text("previous ",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontSize: 20,
                      ),))
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  SizedBox(
                    height: 60,
                    width: 140,
                    child:ElevatedButton(onPressed: (){
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FirstPage()),
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