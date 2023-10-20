

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_scaled_box.dart';

import '../model/crousel_item_mode.dart';
import '../utils/constant.dart';
import '../utils/screen_helper.dart';
import 'rive_image.dart';
 CrouselItemModel mainItem = CrouselItemModel(
  text: Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Text("FLUTTER DEVELOPER",
        // style: GoogleFonts.robotoSlab(
        //   fontSize: 16.0,
        //   fontWeight: FontWeight.w900 , 
        //   color: kPrimaryColor,
        // )
        // ),
        
        Text("Need a",style: GoogleFonts.robotoSlab(
          fontSize: 40.0,
          fontWeight: FontWeight.w900,
          color: Colors.white,
          height: 1.3
        )
        ),
        // const SizedBox(
        //   height: 10.0,
        // ),
        Text("FLUTTER DEVELOPER ?",
        style: GoogleFonts.robotoSlab(
          fontSize: 25.0,
          fontWeight: FontWeight.w900 , 
          color: kPrimaryColor,
        )
        ),
        const SizedBox(
          height: 10,
        ),
        const Text("A Flutter-Developer, based in India",
        style: TextStyle(
          color: kCaptionColor,
          fontSize: 15.0,
          height: 1.0,

        ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text("Need a full custom Mobile App?",
              style: TextStyle(
                color: kCaptionColor,
                fontSize: 15.0,
                height: 1.5,
              ),),
              // GestureDetector(
              //   onTap:() {
                  
              //   },
              //   child: MouseRegion(
              //     cursor: SystemMouseCursors.click,
              //   child: Text(
              //     ".",
              //     style: TextStyle(
              //       height: 1.5,
              //       color: Colors.white,
              //       fontSize: 15.0
              //     ),
              //   ),
              //   ),
              // ),
              SizedBox(
                height: 20.0,
              ),
               
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Container(
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  height: 48.0,
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: TextButton(

                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.phone_in_talk_outlined, color: Colors.white,),
                        SizedBox(width: 10.0,),
                        Text("LET'S TALK",  
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                    )),
                    ],),
                    onPressed: () {
                      
                    },
                    ),
                )
              ),
            ],
          ),
        )

      ],
    ),
  ),
  image:Container(
    child: riveImage()
  ),
);


class ScreenHelpMain extends StatelessWidget {
  const ScreenHelpMain({super.key});
  

  @override
  Widget build(BuildContext context) {
        double crouselContainerHeight = MediaQuery.of(context).size.height * (ScreenHelper.isMobile(context)? 0.7 : 0.85);

    return Container(
                constraints: BoxConstraints(
                  minHeight: crouselContainerHeight,
                ),
                child: ScreenHelper(mobile: _buildMobile(context, mainItem.text, mainItem.image), tablet: _buildTablet(context, mainItem.text, mainItem.image), desktop: _buildDesktop(context, mainItem.text, mainItem.image))
              );
  }
}

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

