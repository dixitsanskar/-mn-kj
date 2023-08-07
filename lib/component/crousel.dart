
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/component/crousel_item.dart';
import 'package:portfolio/utils/page_change.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:portfolio/utils/screen_helper.dart';


class Crousel extends StatefulWidget {
  late CarouselController carouselController;
 Crousel({required this.carouselController });

  @override
  State<Crousel> createState() => _CrouselState();
}
 


class _CrouselState extends State<Crousel> {
  
  @override
  Widget build(BuildContext context) {
    int _currentPage = 0;
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
            child:Listener(
          onPointerSignal: (PointerSignalEvent event) {
            if (event is PointerScrollEvent && event.scrollDelta.dy != 0) {
              // Detect mouse scroll and update the carousel
              setState(() {
                _currentPage += event.scrollDelta.dy.sign.toInt();
                widget.carouselController.animateToPage(
                  _currentPage,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              });
            }
          },
             child: CarouselSlider(items: [0,1].map((i) =>crouselItems[i] ).toList(),
             options: CarouselOptions(
              onScrolled: (index) {
                setState(() {
                  widget.carouselController.animateToPage(index as int);
                });
              },
             //autoPlay: true,
             onPageChanged: (index, reason) {
                setState(() {
                  _currentPage = index;
                });
              },
             enableInfiniteScroll: false,
              initialPage: 0,
              viewportFraction: 1,
              scrollPhysics: CustomMouseScrollPhysics(),
              height: crouselContainerHeight
             ),
             carouselController: widget.carouselController,
             ))
      )
        ],
      ),
    );
  }
}

class CustomMouseScrollPhysics extends ScrollPhysics {
  CustomMouseScrollPhysics({ScrollPhysics? parent}) : super(parent: parent);

  @override
  CustomMouseScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return CustomMouseScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  Simulation? createBallisticSimulation(
      ScrollMetrics position, double velocity) {
    if (velocity.abs() > kMaxFlingVelocity) {
      // If the fling velocity is greater than the maximum fling velocity,
      // treat it as a touch scroll instead to avoid excessive scrolling speed.
      velocity = velocity.sign * kMaxFlingVelocity;
    }
    return super.createBallisticSimulation(position, velocity);
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
