

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/model/crousel_item_mode.dart';
import 'package:portfolio/utils/constant.dart';

List<CrouselItemModel> crouselItems = List.generate(5, (index) => CrouselItemModel(
  text: Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("FLUTTER DEVELOPER",
        style: GoogleFonts.robotoSlab(
          fontSize: 16.0,
          fontWeight: FontWeight.w900 , 
          color: kPrimaryColor,
        )
        ),
        
      ],
    ),
  ),
  image:Container(
    child: Image.asset(
      "assets/sanskar_new.png",
      fit: BoxFit.contain,
    )
  ),
)
);