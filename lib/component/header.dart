import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/constant.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../model/header_item.dart';
import '../utils/global.dart';
import '../utils/screen_helper.dart';
import 'crousel.dart';

  List<HeaderItem> headerItem = [
  HeaderItem(title: "HOME", onTap: (){ }),
  HeaderItem(title:"ABOUT", onTap: () { }, ),
  HeaderItem(title:"SERVICES", onTap: () {  }, ),
  HeaderItem(title:"PROJECTS", onTap: () { }, ),
  HeaderItem(title:"CONTACT", onTap: () { }, ),
  HeaderItem(title:"RESUME", onTap: () { }, isButton: true),
];



class HeaderLogo extends StatelessWidget {
  const HeaderLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: (){},
          child: RichText(text:TextSpan( children: [TextSpan(
            text: "S", style: GoogleFonts.oswald(
              color: Colors.white,
              fontSize: 32.0,
              fontWeight:  FontWeight.bold
            )
          ),
          TextSpan(text: ".",
          style: GoogleFonts.oswald(
            color: kPrimaryColor,
            fontSize: 36.0,
            fontWeight: FontWeight.bold
          ))
          ]
          )
        ),
      ),
    ));
  }
}
class HeaderRow extends StatefulWidget {
  const HeaderRow({super.key});

  @override
  State<HeaderRow> createState() => _HeaderRowState();
}
class _HeaderRowState extends State<HeaderRow> {
  //const HeaderRow({super.key});
  @override
  void initState() {
    carouselController = CarouselController();
    super.initState();
  }
  void changePage(int index){
    setState(){
      carouselController.jumpToPage(index);
    }
  }

  @override
  Widget build(BuildContext context) {
      List<HeaderItem> headerItem = [
  HeaderItem(title: "HOME", onTap: (){ changePage(0); }),
  HeaderItem(title:"ABOUT", onTap: () { changePage(1);}, ),
  HeaderItem(title:"SERVICES", onTap: () {  changePage(2);}, ),
  HeaderItem(title:"PROJECTS", onTap: () { changePage(3);}, ),
  HeaderItem(title:"CONTACT", onTap: () { changePage(4);}, ),
  HeaderItem(title:"RESUME", onTap: () { }, isButton: true),
];

    return ResponsiveVisibility(
      visible: false,
      visibleConditions: [Condition.largerThan(name:MOBILE , value: true)],
      child: Row(
        children: headerItem.map((item) => item.isButton ? MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Container(
            decoration: BoxDecoration(
              color: kPDangerColor,
              borderRadius: BorderRadius.circular(8.0)
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0) ,
            child: TextButton(onPressed: item.onTap
            , child: Text(item.title! , style: const TextStyle(
              color: Colors.white,
              fontSize: 13.0,
              fontWeight: FontWeight.bold
            ),
            )
            ),
          ),
        ) :
         MouseRegion(
          cursor: SystemMouseCursors.click,
          
          child: Container(
            margin: const EdgeInsets.only(right: 30.0),
            child: Text(
              item.title!, 
              style: const TextStyle(
              color: Colors.white,
              fontSize: 13.0,
              fontWeight: FontWeight.bold
            ), 
            ),
          ),
        )
        ).toList(),
       
      ));
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: buildHeader(context) ,
        ),
        // We will make this in a bit
        mobile: buildMobileHeader(),
        tablet: buildHeader(context) ,
      ),
    );
  }

Widget buildMobileHeader(){
  return SafeArea(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const HeaderLogo(),
      GestureDetector(
              onTap: () {
             Globals.scaffoldKey.currentState?.openEndDrawer();
              },
              child: const Icon(
                Icons.menu_book_rounded,
                color: Colors.white,
                size: 28.0,
              ),
            )
          ],
        ),
      ),
    );
}
 
  Widget buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeaderLogo(),
          HeaderRow()
        ],
      ),
    );
    }
}