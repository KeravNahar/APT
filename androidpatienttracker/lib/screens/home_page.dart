import 'package:androidpatienttracker/screens/viewrecord_page.dart';
import 'package:androidpatienttracker/screens/welcome_page.dart';
import 'package:androidpatienttracker/screens/widgets/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:androidpatienttracker/screens/addrecord_page.dart';
import 'package:androidpatienttracker/screens/feedback_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:Text('Android Patient Tracker', style:TextStyle(fontSize: 20, color: Colors.blue) ,),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset("images/logo.png"),
            ),
            Container(
              height: 60,
              width : 150,
              child: FlatButton(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white
                      ),
                      borderRadius: BorderRadius.circular(30)
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>WelcomePage()),
                    );

                  },
                  child: Icon(Icons.exit_to_app_rounded,color: Colors.red,)
              ),
            ),
            Container(
              height: 60,
              width : 250,
              child: RaisedButton(
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black12),
                    borderRadius: BorderRadius.circular(30)
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>AddPage()),
                  );

                },
                child: Text("Add Patient Records", style: TextStyle(
                    color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
              ),
            ),
            Container(
              height: 60,
              width : 250,
              child: RaisedButton(
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black12),
                    borderRadius: BorderRadius.circular(30)
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>ViewPage()),
                  );

                },
                child: Text("View Patient Records", style: TextStyle(
                    color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
              ),
            ),

            Container(
              height: 60,
              width : 250,
              child: RaisedButton(
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black12),
                    borderRadius: BorderRadius.circular(30)
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>FeedbackPage()),
                  );
                },
                child: Text("Feedback", style: TextStyle(
                    color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
              ),
            ),
          ],),
    ),
      );
  }
}
