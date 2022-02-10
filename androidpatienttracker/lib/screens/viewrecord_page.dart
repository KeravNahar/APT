import 'package:androidpatienttracker/screens/widgets/add_record.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:androidpatienttracker/screens/home_page.dart';
class ViewPage extends StatefulWidget {
  const ViewPage({Key? key}) : super(key: key);

  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  TextEditingController pname = new TextEditingController();
  TextEditingController pdiag = new TextEditingController();
  var diag_variable = "";

  void changedata({required String data_in}){
    setState(() {
      diag_variable = data_in;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:Text('View Record', style:TextStyle(fontSize: 20, color: Colors.blue) ,),
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
            Text("Enter valid Name to get diagnostic form form",style: TextStyle(color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.normal), textAlign: TextAlign.center,),
            Column(
              children: [
                WidTextFieldRecord(
                  hintText: "Enter Patient ID",
                  obscureText: false,
                  controller: pname ,
                ),
                SizedBox(height: 30,),
              ],
            ),

            Column(
              children: [
                Text("$diag_variable",style: TextStyle(color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                SizedBox(height: 30,),
                Container(
                  height: 60,
                  width : 200,
                  child: RaisedButton(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black12),
                        borderRadius: BorderRadius.circular(30)
                    ),
                    onPressed: () async{
                      var name = pname.text.trim();
                      var docid= "yIbc2T0HLxAaRkZlvLh0";
                      DocumentSnapshot variable = await FirebaseFirestore.instance.collection("PatientRecord").doc(docid).get();
                      changedata(data_in:variable['Diagnosis']);
                      print(variable['Diagnosis']);
                    },
                    child: Text("View Record", style: TextStyle(
                        color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
