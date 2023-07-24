
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:portfolio/utils/screen_helper.dart';

class Crousel extends StatelessWidget {
  const Crousel({super.key});

  @override
  Widget build(BuildContext context) {
    CarouselController carouselController = CarouselController();
    double crouselContainerHeight = MediaQuery.of(context).size.height * (ScreenHelper.isMobile(context)? 0.7 : 0.85);
    return Container(
      height: crouselContainerHeight,
      color:Colors.yellow ,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            child: CarouselSlider(items: List.generate(5, (index) => 
            Builder(builder: (BuildContext context) {
              return Container(
                constraints: BoxConstraints(
                  minHeight: crouselContainerHeight,
                  
                ),
              );
            }
            )).toList(),
             options: CarouselOptions(
              viewportFraction: 1,
              scrollPhysics: NeverScrollableScrollPhysics(),
              height: crouselContainerHeight
             ))
          )
        ],
      ),
    );
  }
}