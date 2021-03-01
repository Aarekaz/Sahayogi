import 'package:flutter/material.dart';
import 'package:all_in_one_goverment_app/aapatkalin.dart';
import 'package:all_in_one_goverment_app/karyakram.dart';
import 'package:all_in_one_goverment_app/sewaharu.dart';
import 'package:all_in_one_goverment_app/suchana.dart';
import 'package:all_in_one_goverment_app/sujhav.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:all_in_one_goverment_app/hamro_barema.dart';
import 'samshya.dart';
import 'mahatyo.dart';

class GridDashboard extends StatefulWidget {
  @override
  _GridDashboardState createState() => _GridDashboardState();
}

class _GridDashboardState extends State<GridDashboard> {
  Items item1 = new Items(
    title: "हाम्रो बारेमा",
    img: "images/aboutus.png",
    page: Hamro_barema(),
  );

  Items item2 = new Items(
    title: "सेवाहरु ",
    img: "images/services.png",
    page: sewaharu(),
  );

  Items item3 = new Items(
    title: "कार्यक्रम तथा परियोजना",
    img: "images/programs.png",
    page: karyakram(),
  );

  Items item4 = new Items(
    title: "सुचना तथा जनकारी",
    img: "images/notices.png",
    page: suchana(),
  );

  Items item5 = new Items(
    title: "सुझव तथा गुनासो",
    img: "images/advice.png",
    page: sujhav(),
  );

  Items item6 = new Items(
    title: "समस्या दर्ता",
    img: "images/exclamation.png",
    page: MyApp(),
  );

  Items item7 = new Items(
    title: "वडा विवरण",
    img: "images/house.png",
    page: Hamro_barema(),
  );

  Items item8 = new Items(
    title: "महत्त्वपूर्ण स्थानहरु",
    img: "images/locations.png",
    page: Hamro_barema(),
  );

  Items item9 = new Items(
    title: "आप्तकालीन नम्बर​",
    img: "images/emergency-call.png",
    page: aapatkalin(),
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [
      item1,
      item2,
      item3,
      item4,
      item5,
      item6,
      item7,
      item8,
      item9
    ];
    var color = 0xB3FFFFFF;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 3,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          children: myList.map((data) {
            return InkWell(
              child: Container(
                decoration: BoxDecoration(
                    color: Color(color),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      data.img,
                      width: 45,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      data.title,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500)),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => data.page));
              },
            );
          }).toList()),
    );
  }
}

class Items {
  String title;
  String img;
  Widget page;
  Items({this.title, this.img, this.page});
}
