

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
      child: Padding(padding: EdgeInsets.all(30.0),
      child: Container(
        //child: RiveAnimation.asset('assets/images/about.riv'),
        child: Row(
          children: [
            Center(
              child: Container(
                width: 300.0,
                height: 400.0,
                child: RiveAnimation.asset('assets/images/about.riv'),
              )
            ),
            Expanded(child: 
            Column(
              children: [Text('Hi there! \n I am a Flutter Developer. I have been working with Flutter for 2 years. I have worked on many projects. I have also worked')],
            )
            ),
            
          ],
        ),
      ),
      ),
    );
  }
}