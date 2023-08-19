
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/component/crousel_item.dart';
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
             
             onPageChanged: (index, reason) {
                setState(() {
                  _currentPage = index;
                });
              },
              scrollDirection: Axis.vertical,
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
      velocity = velocity.sign * kMaxFlingVelocity;
    }
    return super.createBallisticSimulation(position, velocity);
  }
}

