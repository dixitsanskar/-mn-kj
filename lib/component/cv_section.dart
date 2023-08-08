

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/constant.dart';
import 'package:portfolio/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_scaled_box.dart';

class CVsection extends StatelessWidget {
  const CVsection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ScreenHelper(mobile: _buildUi(context, MediaQuery.of(context).size.width * .8),
       tablet: _buildUi(context, 760.0), desktop:  _buildUi(context, 1000.0)),
    );
  }
}


Widget _buildUi(BuildContext context,  double swidth) {
  return ResponsiveScaledBox(width: swidth,
   child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
        children: [
         Expanded (child: Text("BETTER DESIGN,\nBETTER EXPERIENCE",
          style: GoogleFonts.robotoSlab(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            height: 1.8,
          )),),
          Expanded
          (child: GestureDetector
          ( onTap: () {
            
          },
            child:  MouseRegion
         (cursor: SystemMouseCursors.click
          ,child:  Text("DOWNLOAD CV",
          style: GoogleFonts.robotoSlab(
            color: kPrimaryColor,
            fontWeight: FontWeight.w900,
            height: 16.0,
          )),)))
          
        ],
      ),
      SizedBox(
        height: 50.0,
      ),
    ],

   )
   );
}