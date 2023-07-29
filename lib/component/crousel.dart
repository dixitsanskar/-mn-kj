
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/component/crousel_item.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:portfolio/utils/screen_helper.dart';

class Crousel extends StatefulWidget {
  const Crousel({super.key});

  @override
  State<Crousel> createState() => _CrouselState();
}

class _CrouselState extends State<Crousel> {



  @override
  Widget build(BuildContext context) {
    
    CarouselController carouselController = CarouselController();
    double crouselContainerHeight = MediaQuery.of(context).size.height * (ScreenHelper.isMobile(context)? 0.7 : 0.85);
    return SizedBox(
      height: crouselContainerHeight,
     // color:Colors.yellow ,
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
                child: ScreenHelper(mobile: _buildMobile(context, crouselItems[index].text, crouselItems[index].image), tablet: _buildTablet(context, crouselItems[index].text, crouselItems[index].image), desktop: _buildDesktop(context, crouselItems[index].text, crouselItems[index].image))
              );
            }
            )).toList(),
             options: CarouselOptions(
              //autoPlay: true,
              viewportFraction: 1,
              scrollPhysics: const NeverScrollableScrollPhysics(),
              height: crouselContainerHeight
             ))
          )
        ],
      ),
    );
  }
}
// class Crousel extends StatelessWidget {
//   const Crousel({super.key});


//   @override
//   Widget build(BuildContext context) {
//     CarouselController carouselController = CarouselController();
//     double crouselContainerHeight = MediaQuery.of(context).size.height * (ScreenHelper.isMobile(context)? 0.7 : 0.85);
//     return SizedBox(
//       height: crouselContainerHeight,
//      // color:Colors.yellow ,
//       width: double.infinity,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Container(
//             alignment: Alignment.center,
//             child: CarouselSlider(items: List.generate(5, (index) => 
//             Builder(builder: (BuildContext context) {
//               return Container(
//                 constraints: BoxConstraints(
//                   minHeight: crouselContainerHeight,
//                 ),
//                 child: ScreenHelper(mobile: _buildMobile(context, crouselItems[index].text, crouselItems[index].image), tablet: _buildTablet(context, crouselItems[index].text, crouselItems[index].image), desktop: _buildDesktop(context, crouselItems[index].text, crouselItems[index].image))
//               );
//             }
//             )).toList(),
//              options: CarouselOptions(
//               viewportFraction: 1,
//               scrollPhysics: const NeverScrollableScrollPhysics(),
//               height: crouselContainerHeight
//              ))
//           )
//         ],
//       ),
//     );
//   }
// }

Widget _buildDesktop(BuildContext context, Widget text, Widget image){
  return Center(
    child: ResponsiveScaledBox(width: 1000.0, 
    child: Row(
      children: [
        Expanded(
          child: text,
        ),
        Expanded(
          child: image,
        )
      ],
    )
  ),
  );
}

Widget _buildTablet(BuildContext context, Widget text, Widget image){
  return Center(
    child: ResponsiveScaledBox(width: 700.0, 
    child: Row(
      children: [
        Expanded(
          child: text,
        ),
        Expanded(
          child: image,
        )
      ],
    )
  ),
  );
}

Widget _buildMobile(BuildContext context, Widget text, Widget image){
  double mobileWidth = MediaQuery.of(context).size.width * 0.8;
  return Container(
    constraints: BoxConstraints(
      maxWidth: mobileWidth,
    ),
    width: double.infinity,
    child: text,
  );
}
