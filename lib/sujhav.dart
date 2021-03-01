import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
//import package file manually

void main() => runApp(sujhav());
class sujhav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        theme: ThemeData(
          primarySwatch:Colors.red, //primary color for theme
        ),
        home: WriteSQLdata() //set the class here
    );
  }
}

class WriteSQLdata extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return WriteSQLdataState();
  }
}

class WriteSQLdataState extends State<WriteSQLdata>{

  TextEditingController namectl = TextEditingController();
  TextEditingController phonectl = TextEditingController();
  TextEditingController suggestionctl = TextEditingController();
  //text controller for TextField

  bool error, sending, success;
  String msg;

  String phpurl = "http://updatejewelry.com/rural_munici/sujhav/write.php";
  // do not use http://localhost/ for your local
  // machine, Android emulation do not recognize localhost
  // insted use your local ip address or your live URL
  // hit "ipconfig" on Windows or  "ip a" on Linux to get IP Address

  @override
  void initState() {
    error = false;
    sending = false;
    success = false;
    msg = "";
    super.initState();
  }

  Future<void> sendData() async {

    var res = await http.post(phpurl, body: {
      "name": namectl.text,
      "phone": phonectl.text,
      "suggestion": suggestionctl.text,
    }); //sending post request with header data

    if (res.statusCode == 200) {
      print(res.body); //print raw response on console
      var data = json.decode(res.body); //decoding json to array
      if(data["error"]){
        setState(() { //refresh the UI when error is recieved from server
          sending = false;
          error = true;
          msg = data["message"]; //error message from server
        });
      }else{

        namectl.text = "";
        phonectl.text = "";
        suggestionctl.text = "";
        //after write success, make fields empty

        setState(() {
          sending = false;
          success = true; //mark success and refresh UI with setState
        });
      }

    }else{
      //there is error
      setState(() {
        error = true;
        msg = "Error during sendign data.";
        sending = false;
        //mark error and refresh UI with setState
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(centerTitle: true,
        title:Text("समस्या दर्ता"),
        backgroundColor:Colors.blueAccent,
      ), //appbar

      body: SingleChildScrollView( //enable scrolling, when keyboard appears,
        // hight becomes small, so prevent overflow
          child:Container(
              padding: EdgeInsets.all(20),
              child: Column(children: <Widget>[
                Container(
                  child:Text(error?msg:"Enter Student Information"),
                  //if there is error then sho msg, other wise show text message
                ),

                Container(
                  child:Text(success?"Write Success":"send data"),
                  //is there is success then show "Write Success" else show "send data"
                ),
                Container(
                    child: TextField(
                      controller: namectl,
                      decoration: InputDecoration(
                        labelText:"पुरा नाम​:",
                        hintText:"पुरा नाम​ लेख्नुहोस्",
                      ),
                    )
                ), //text input for name

                Container(
                    child: TextField(
                      controller: phonectl,
                      decoration: InputDecoration(
                        labelText:"फोन नम्बर​:",
                        hintText:"फोन नम्बर​ लेख्नुहोस्",
                      ),
                    )
                ), //text input for address

                Container(
                    child: TextField(
                      controller: suggestionctl,
                      decoration: InputDecoration(
                        labelText:"समस्या:",
                        hintText:"समस्या लेख्नुहोस्",
                      ),
                    )
                ), //text input for class

                Container(
                    margin: EdgeInsets.only(top:20),
                    child:SizedBox(
                        width: double.infinity,
                        child:RaisedButton(
                          onPressed:(){ //if button is pressed, setstate sending = true, so that we can show "sending..."
                            setState(() {
                              sending = true;
                            });
                            sendData();
                          },
                          child: Text(
                            sending?"Sending...":"SEND DATA",
                            //if sending == true then show "Sending" else show "SEND DATA";
                          ),
                          color: Colors.blueAccent,
                          colorBrightness: Brightness.dark,
                          //background of button is darker color, so set brightness to dark
                        )
                    )
                )
              ],)
          )
      ),
    );
  }
}