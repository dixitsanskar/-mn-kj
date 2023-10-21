

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/component/rive_image.dart';
import 'package:rive/rive.dart';



// class AboutMe extends StatelessWidget {
//   const AboutMe({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }


class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  late RiveAnimationController _imageController;
  @override
  void initState() {
    super.initState();
    _imageController = OneShotAnimation('Walk', autoplay: true,
    );
    
  }
  void _clickState(){
    setState(() {
      _imageController = OneShotAnimation('hit', autoplay: false);
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
      child: Padding(padding: EdgeInsets.all(30.0),
      child: Container(
        //child: RiveAnimation.asset('assets/images/about.riv'),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container( 
              width: 400,
              height: 400,
              child: ClipOval(
                clipper: MyClip(),
                child:RiveAnimation.asset('assets/images/zombie.riv', 
                controllers: [_imageController],
                ) ,
              ),
              )
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.12,),
            Expanded(child: 
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hi there!', 
                style: GoogleFonts.robotoSlab(
                  fontSize: 25.0,

                ) ,),
                Text('I\'m Sanskar Dixit', style: GoogleFonts.robotoSlab(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w700

                ),),
                 Text('A Flutter Developer.', 
                style: GoogleFonts.robotoSlab(
                  fontSize: 25.0,

                ) ,),
                 Text('Working with Flutter for 1.5 years.', 
                style: GoogleFonts.robotoSlab(
                  fontSize: 25.0,

                ) ,),
                 Text('Worked on many projects.', 
                style: GoogleFonts.robotoSlab(
                  fontSize: 25.0,

                ) ,),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,

                ),
                 MouseRegion(
                  cursor: SystemMouseCursors.click,
                 
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: TextButton(
                      
                      onPressed: (){
                
                        _clickState();

                      }, 
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Know More About Me', style: GoogleFonts.robotoSlab(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.black
                          ),),
                          SizedBox(width: 10.0,),
                          Icon(Icons.arrow_forward_ios, color: Colors.black,)
                        ],
                      )),
                  ),
                )
               
              ],
            )
            ),
            
          ],
        ),
      ),
      ),
    );
  }
}


