import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';

final startColor = Color(0xFFaa7ce4);
final endColor = Color(0xFFe46792);
final titleColor = Color(0xff444444);
final textColor = Color(0xFFa9a9a9);
final shadowColor = Color(0xffe9e9f4);

// ignore: camel_case_types
class profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 180,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [startColor, endColor])),
          ),
          Container(
            height: 80,
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: Text(
                  'Profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: ListView(
              children: <Widget>[
                new CardHolder(),
                SizedBox(
                  height: 200,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardHolder extends StatelessWidget {
  const CardHolder({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 150, right: 20, left: 20),
      height: 600,
      width: 400,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: titleColor.withOpacity(.1),
                blurRadius: 20,
                spreadRadius: 10),
          ]),
      child: new Card(),
    );
  }
}

class Card extends StatelessWidget {
  const Card({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Container(
          height: 130,
          width: 130,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/ill.png'), fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                  color: Colors.blueAccent.withOpacity(.2), width: 1)),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Mike Edward',
          style: TextStyle(
            color: titleColor,
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              '2948 posts created',
              style: TextStyle(color: textColor, fontSize: 15),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              height: 12,
              child: VerticalDivider(
                width: 2,
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              '934 Feedback',
              style: TextStyle(color: textColor, fontSize: 15),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 30),
          padding: EdgeInsets.only(left: 20, right: 20, top: 8),
          width: 320,
          height: 200,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(.1),
                    blurRadius: 30,
                    spreadRadius: 5)
              ],
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'website',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        'www.google.com',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                              icon: Icon(
                                Icons.headset,
                                size: 15,
                              ),
                              onPressed: () {}),
                          IconButton(
                              icon: Icon(
                                Icons.headset,
                                size: 15,
                              ),
                              onPressed: () {}),
                        ],
                      )
                    ],
                  )
                ],
              ),
              Text(
                'Biography',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                  'Contrary to popular belief, Lorem Ipsum is not simply random text It has roots in a piece of classical Latin literature from 45 BC')
            ],
          ),
        ),
        Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 300,
              child: Divider(
                height: 1,
                color: titleColor.withOpacity(.3),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Material(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  child: InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Icon(
                        Icons.group_work,
                        color: textColor,
                        size: 40,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Text(
                      'Dirbble',
                      style: TextStyle(color: Colors.black, fontSize: 22),
                    ),
                    Text(
                      '.com/raazcse',
                      style: TextStyle(color: textColor, fontSize: 15),
                    )
                  ],
                ),
                Spacer(),
                Material(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  child: InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Icon(
                        Icons.insert_emoticon,
                        color: textColor,
                        size: 40,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Text(
                      'Behance',
                      style: TextStyle(color: Colors.black, fontSize: 22),
                    ),
                    Text(
                      '.net/surjasin',
                      style: TextStyle(color: textColor, fontSize: 15),
                    )
                  ],
                ),
                SizedBox(
                  width: 14,
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
