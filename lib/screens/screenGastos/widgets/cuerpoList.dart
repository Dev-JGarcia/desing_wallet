// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SlideAnimation2 extends StatelessWidget {
  const SlideAnimation2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    double _h = MediaQuery.of(context).size.height;

    return AnimationLimiter(
      child: ListView.builder(
        padding: EdgeInsets.only(
            top: _h * 0.31, left: _w * 0.025, right: _w * 0.025),
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            delay: const Duration(milliseconds: 100),
            child: SlideAnimation(
              duration: const Duration(milliseconds: 2500),
              curve: Curves.fastLinearToSlowEaseIn,
              horizontalOffset: -300,
              verticalOffset: -850,
              child: Container(
                margin: EdgeInsets.only(bottom: _w / 20),
                height: _w / 4,
                decoration: BoxDecoration(
                  color: const Color(0xff17191F),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.1),
                      blurRadius: 5,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                
              ),
            ),
          );
        },
      ),
    );
  }
}
