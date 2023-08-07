
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

late CarouselController carouselController ;
class _CrouselState extends State<Crousel> {

  @override
  void initState() {
    carouselController = CarouselController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
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
            child: CarouselSlider(items: [0,1].map((i) =>crouselItems[i] ).toList(),
             options: CarouselOptions(
              //autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  carouselController.animateToPage(index);
                });
              },
              initialPage: 0,
              viewportFraction: 1,
              scrollPhysics: const NeverScrollableScrollPhysics(),
              height: crouselContainerHeight
             ),
             carouselController: carouselController,
             )
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
