import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/utils/constant.dart';
import '../component/crousel.dart';
import '../component/header.dart';
import '../utils/global.dart';

class Home extends StatelessWidget {
  final CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Globals.scaffoldKey,
      endDrawer: Drawer(
        child: SafeArea(
          child: Padding(padding: 
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: ListView.separated(itemBuilder: 
          (BuildContext context , int index) {
            return headerItem[index].isButton ? MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Container(
                decoration: BoxDecoration(
                  color: kPDangerColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextButton(onPressed: headerItem[index].onTap,
                 child: Text(
                  headerItem[index].title!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                 ),
                ),
              ): ListTile(
                title: Text(
                  headerItem[index].title!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
              );
              }
        ,
           separatorBuilder: 
           (BuildContext context,int index){
            return const SizedBox(
              height: 10.0,
            );
           }
           , itemCount: headerItem.length),
          ),
          ),
        ),
      backgroundColor: kBackgroundColor,
      body: Container(
       child:  SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Header(controller: controller,) ,
            ),
             Crousel(carouselController: controller,),
             //CVsection(),
          ],
        ),
       ),
      ),
    );
  }
}