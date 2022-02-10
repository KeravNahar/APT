import 'package:androidpatienttracker/screens/home_page.dart';
import 'package:androidpatienttracker/screens/widgets/add_record.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController pname = new TextEditingController();
  TextEditingController page = new TextEditingController();
  TextEditingController pgender = new TextEditingController();
  TextEditingController pdiag = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:Text('Add Patient', style:TextStyle(fontSize: 20, color: Colors.blue) ,),
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
                "Acurate to patient reports",style: TextStyle(color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.normal), textAlign: TextAlign.center,),
            Column(
              children: [
                WidTextFieldRecord(
                  hintText: "Patient Name",
                  obscureText: false,
                  controller: pname ,
                ),
                SizedBox(height: 30,),
                WidTextFieldRecord(
                  hintText: "Patient Age",
                  obscureText: false,
                  controller: page ,
                ),
                SizedBox(height: 30,),
                WidTextFieldRecord(
                  hintText: "Gender",
                  obscureText: false,
                  controller: pgender ,
                ),
                SizedBox(height: 30,),
                WidTextFieldRecord(
                  hintText: "Diagnosis",
                  obscureText: false,
                  controller: pdiag ,
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
                  Map <String,dynamic> data={"Patient Name":pname.text,"Patient Age":page.text,"Gender":pgender.text,"Diagnosis":pdiag.text};
                  FirebaseFirestore.instance.collection("PatientRecord").add(data);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Text("Add Record", style: TextStyle(
                    color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
