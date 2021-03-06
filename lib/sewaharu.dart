import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';

class Data {
  final String id;
  final String title, description;

  Data({
    this.id,
    this.title,
    this.description,
  });

  factory Data.fromJson(Map<String, dynamic> jsonData) {
    return Data(
      id: jsonData['id'],
      title: jsonData['title'],
      description: jsonData['description'],
    );
  }
}

class CustomListView extends StatelessWidget {
  final List<Data> data;

  CustomListView(this.data);

  Widget build(context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, int currentIndex) {
        return createViewItem(data[currentIndex], context);
      },
    );
  }

  Widget createViewItem(Data data, BuildContext context) {
    return new ListTile(
        title: new Card(
          elevation: 5.0,
          child: new Container(
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Row(children: <Widget>[
                  Padding(
                      child: Text(
                        data.title,
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                        textAlign: TextAlign.right,
                      ),
                      padding: EdgeInsets.all(1.0))
                ]),
              ],
            ),
          ),
        ),
        onTap: () {
          //We start by creating a Page Route.
          //A MaterialPageRoute is a modal route that replaces the entire
          //screen with a platform-adaptive transition.
          var route = new MaterialPageRoute(
            builder: (BuildContext context) => new SecondScreen(value: data),
          );
          //A Navigator is a widget that manages a set of child widgets with
          //stack discipline.It allows us navigate pages.
          Navigator.of(context).push(route);
        });
  }
}

//Future is n object representing a delayed computation.
Future<List<Data>> downloadJSON() async {
  final jsonEndpoint =
      "http://updatejewelry.com/rural_munici/sewaharu/sewaharu_json.php";

  final response = await get(jsonEndpoint);

  if (response.statusCode == 200) {
    List data = json.decode(response.body);
    return data.map((data) => new Data.fromJson(data)).toList();
  } else
    throw Exception('We were not able to successfully download the json data.');
}

class SecondScreen extends StatefulWidget {
  final Data value;

  SecondScreen({Key key, this.value}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(centerTitle: true, title: new Text('विस्तृत जानकारी')),
      body: new Container(
        child: new Center(
          child: Column(
            children: <Widget>[
              Padding(
                child: new Text(
                  widget.value.title,
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 25.0),
                  textAlign: TextAlign.left,
                ),
                padding: EdgeInsets.all(20.0),
              ),
              Padding(
                child: new Text(
                  widget.value.description,
                  style: new TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                padding: EdgeInsets.all(20.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class sewaharu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: new Scaffold(
        appBar: new AppBar(
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: const Text(
              'सेवाहरु',
              textAlign: TextAlign.center,
            )),
        body: new Center(
          //FutureBuilder is a widget that builds itself based on the latest snapshot
          // of interaction with a Future.
          child: new FutureBuilder<List<Data>>(
            future: downloadJSON(),
            //we pass a BuildContext and an AsyncSnapshot object which is an
            //Immutable representation of the most recent interaction with
            //an asynchronous computation.
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Data> data = snapshot.data;
                return new CustomListView(data);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              //return  a circular progress indicator.
              return new CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(sewaharu());
}
