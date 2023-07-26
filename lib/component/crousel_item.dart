

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/component/rive_image.dart';
import 'package:portfolio/model/crousel_item_mode.dart';
import 'package:portfolio/utils/constant.dart';
import 'package:rive/rive.dart';



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
        const SizedBox(
          height: 18.0,
        ),
        Text("SANSKAR\nDIXIT",style: GoogleFonts.robotoSlab(
          fontSize: 40.0,
          fontWeight: FontWeight.w900,
          color: Colors.white,
          height: 1.3
        )
        ),
        const SizedBox(
          height: 10.0,
        ),
        const Text("Flutter-Developer, based in India",
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
          child: Wrap(
            children: [
              const Text("Need a full custom Mobile App?",
              style: TextStyle(
                color: kCaptionColor,
                fontSize: 15.0,
                height: 1.5,
              ),),
              GestureDetector(
                onTap:() {
                  
                },
                child: const MouseRegion(
                  cursor: SystemMouseCursors.click,
                child: Text(
                  "Got a project? Let's talk.",
                  style: TextStyle(
                    height: 1.5,
                    color: Colors.white,
                    fontSize: 15.0
                  ),
                ),
                ),
              ),
              const SizedBox(
                height: 25.0,
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
                    child: const Text("GET STARTED",  
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                    )),
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
)
);