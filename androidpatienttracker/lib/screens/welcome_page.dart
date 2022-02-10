import 'package:flutter/material.dart';
import 'package:androidpatienttracker/screens/login_page.dart';
import 'package:androidpatienttracker/screens/register_page.dart';
class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Expanded(child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(top:150),
                  child: Center(
                    child: Image.asset("images/logo.png"),
                  ),
                )
            )),
            Expanded(child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Welcome to APT", style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue)),
                    Column(
                      children: [
                        Text("Android Patient Tracker"),
                        Text("App to Track patient Progress"),
                      ],
                    ),

                    //button("Login", Colors.blue, Colors.white),
                    Container(
                      height: 60,
                      width: 300,
                      child: RaisedButton(
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(30)
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                        },
                        child: Text("Login", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                      ),
                    ),

                    //button("Register", Colors.white, Colors.blue),
                    Container(
                      height: 60,
                      width: 300,
                      child: RaisedButton(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.blueGrey),
                            borderRadius: BorderRadius.circular(30)
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RegisterPage()),
                          );
                        },
                        child: Text("Register", style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 20),),
                      ),
                    ),
                  ],
                )))
          ],
        )
    );
  }
}