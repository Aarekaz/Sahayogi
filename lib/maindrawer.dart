import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        child: Padding(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("images/nepal_government.png"),
            ],
          ),
        ),
      ),
      ListTile(
        onTap: () {},
        leading: Icon(
          Icons.call,
          color: Colors.white,
        ),
        title: Text("सम्पर्क",
          style: TextStyle(color: Colors.white),),
      ),

      ListTile(
        onTap: () {},
        leading: Icon(
          Icons.question_answer,
          color: Colors.white,
        ),
        title: Text("प्रायः सोधिने प्रश्नहरु",
          style: TextStyle(color: Colors.white),),
      ),

      ListTile(
        onTap: () {},
        leading: Icon(
          Icons.how_to_vote,
          color: Colors.white,
        ),
        title: Text("जनमत​",
          style: TextStyle(color: Colors.white),),
      ),

      ListTile(
        onTap: () {},
        leading: Icon(
          Icons.insert_drive_file,
          color: Colors.white,
        ),
        title: Text("ऐन कानुन​",
          style: TextStyle(color: Colors.white),),
      ),
    ]);
  }
}
