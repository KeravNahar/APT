import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:androidpatienttracker/screens/home_page.dart';
class FeedbackPage extends StatelessWidget {
  TextEditingController email = new TextEditingController();
  TextEditingController user = new TextEditingController();
  TextEditingController contact = new TextEditingController();
  TextEditingController feedback = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:Text('Feedback', style:TextStyle(fontSize: 20, color: Colors.blue) ,),
        leading: IconButton(icon: Icon(Icons.arrow_back_rounded,color: Colors.blue,),onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        },),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Enter valid details and fill the given form , "
                "Help us improve the app",style: TextStyle(color: Colors.blue,
                fontSize: 20,
                fontWeight: FontWeight.normal), textAlign: TextAlign.center,),
            Column(
              children: [

                TextFormField(
                  controller: user,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person,color: Colors.grey,),
                      hintText: "User Name",
                      hintStyle: TextStyle(color: Colors.grey),
                      enabledBorder: UnderlineInputBorder(
                          borderSide:  BorderSide(color: Colors.grey)
                      )
                  ),
                ),

                SizedBox(height: 30,),
                TextFormField(
                  controller: email,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_rounded,color: Colors.grey,),
                      hintText: "Email Address",
                      hintStyle: TextStyle(color: Colors.grey),
                      enabledBorder: UnderlineInputBorder(
                          borderSide:  BorderSide(color: Colors.grey)
                      )
                  ),
                ),
                SizedBox(height: 30,),
                TextFormField(
                  controller: contact,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.call,color: Colors.grey,),
                      hintText: "Contact Number",
                      hintStyle: TextStyle(color: Colors.grey),
                      enabledBorder: UnderlineInputBorder(
                          borderSide:  BorderSide(color: Colors.grey)
                      )
                  ),
                ),
                SizedBox(height: 30,),
                TextFormField(
                  controller: feedback,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.feedback,color: Colors.grey,),
                      hintText: "Enter Feedback",
                      hintStyle: TextStyle(color: Colors.grey),
                      enabledBorder: UnderlineInputBorder(
                          borderSide:  BorderSide(color: Colors.grey)
                      )
                  ),
                ),

              ],
            ),

            Container(
              height: 60,
              width : 200,
              child: RaisedButton(
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black12),
                    borderRadius: BorderRadius.circular(30)
                ),
                onPressed: () {
                  Map <String,dynamic> data={"email" : email.text.trim(),"username" : user.text.trim(),"contact" : contact.text.trim(),"feedback" : feedback.text.trim(),};
                  FirebaseFirestore.instance.collection("feedbackData").add(data);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()),);
                },
                child: Text("Send", style: TextStyle(
                    color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Thank you for the feedback.", style: TextStyle(color: Colors.grey),),
              ],
            )
          ],
        ),

      ),
    );
  }
}