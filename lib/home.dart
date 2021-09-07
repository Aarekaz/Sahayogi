import 'package:flutter/material.dart';
import 'package:sahayogi/griddashboard.dart';
import 'package:sahayogi/maindrawer.dart';
import 'package:sahayogi/slider.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Sahayogi"),
        centerTitle: true,
        elevation: 0,
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.indigo),
        child: Drawer(
          child: MainDrawer(),
        ),
      ),
      backgroundColor: Colors.indigo,
      body: Column(
        children: <Widget>[
          SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              child: CarouselChangeReasonDemo()),
//          CarouselChangeReasonDemo()
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          GridDashboard()
        ],
      ),
    );
  }
}
