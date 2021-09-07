import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

//String url = 'http://updatejewelry.com/rural_munici/image_api/imagejson.php';
//
//Post postFromJson(String str) {
//  final jsonData = json.decode(str);
//  return Post.fromJson(jsonData);
//}
//
//String postToJson(Post data) {
//  final dyn = data.toJson();
//  return json.encode(dyn);
//}
//
//
//List<Post> allPostsFromJson(String str) {
//  final jsonData = json.decode(str);
//  return new List<Post>.from(jsonData.map((x) => Post.fromJson(x)));
//}
//
//String allPostsToJson(List<Post> data) {
//  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
//  return json.encode(dyn);
//}
//
//class Post {
//  int id;
//  String name;
//  String image;
//
//  Post({
//    this.id,
//    this.name,
//    this.image,
//  });
//
//  factory Post.fromJson(Map<String, dynamic> json) => new Post(
//    id: json["id"],
//    name: json["name"],
//    image: json["image"],
//  );
//
//  Map<String, dynamic> toJson() => {
//    "id": id,
//    "name": name,
//    "image": image,
//  };
//}
//
//
//List<String> imgList;
//
//Future<Post> getPost() async{
//  final response = await http.get('$url');
//  return postFromJson(response.body);
//}

final List<String> imgList = [
  'https://www.state.gov/wp-content/uploads/2019/04/Nepal-2123x1406.jpg',
  'https://images.unsplash.com/photo-1540961286473-8ad1368dc1bd?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
  'https://images.unsplash.com/photo-1605640840605-14ac1855827b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1191&q=80',
  'https://images.unsplash.com/photo-1572536260889-47c5daef613e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1189&q=80',
  'https://images.unsplash.com/photo-1609898793184-7d1496532e84?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=976&q=80',
  'https://images.unsplash.com/photo-1571401835393-8c5f35328320?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=967&q=80'
];

void main() => runApp(CarouselChangeReasonDemo());

class CarouselChangeReasonDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselChangeReasonDemoState();
  }
}

class _CarouselChangeReasonDemoState extends State<CarouselChangeReasonDemo> {
  String reason = '';
  final CarouselController _controller = CarouselController();

  void onPageChange(int index, CarouselPageChangedReason changeReason) {
    setState(() {
      reason = changeReason.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigo,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 10.0),
              CarouselSlider(
                items: imageSliders,
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  height: MediaQuery.of(context).size.height / 4,
                  onPageChanged: onPageChange,
                  autoPlay: true,
                ),
                carouselController: _controller,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: ElevatedButton(
                      onPressed: () => _controller.previousPage(),
                      child: Text('←'),
                    ),
                  ),
                  Flexible(
                    child: ElevatedButton(
                      onPressed: () => _controller.nextPage(),
                      child: Text('→'),
                    ),
                  ),
                  ...Iterable<int>.generate(imgList.length).map(
                    (int pageIndex) => Flexible(
                      child: ElevatedButton(
                        onPressed: () => _controller.animateToPage(pageIndex),
                        child: Text("$pageIndex"),
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: Column(
                  children: [
                    Text('page change reason: '),
                    Text(reason),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
//                child: Text(
//                  'No. ${imgList.indexOf(item)} image',
//                  style: TextStyle(
//                    color: Colors.white,
//                    fontSize: 20.0,
//                    fontWeight: FontWeight.bold,
//                  ),
//                ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();
