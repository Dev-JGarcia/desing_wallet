// ignore_for_file: file_names

import 'package:desing_wallet/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class WidgetBodyTadBar extends StatefulWidget {
  const WidgetBodyTadBar({
    Key? key,
  }) : super(key: key);

  @override
  State<WidgetBodyTadBar> createState() => _WidgetBodyTadBarState();
}

class _WidgetBodyTadBarState extends State<WidgetBodyTadBar> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size displayWidth = MediaQuery.of(context).size;
    final provider = Provider.of<ProviderApp>(context);

    return Container(
      margin: EdgeInsets.all(displayWidth.width * .04),
      height: displayWidth.height * 0.05,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          colors: <Color>[
            Color(0xff0B2D62),
            Color(0xff0E6EC9),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListView.builder(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: displayWidth.width * .02),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            setState(() {
              currentIndex = index;
              HapticFeedback.lightImpact();
            });
            provider.cuerpoPantalla = listOfStrings[index];
            debugPrint("Nambre de tab ${listOfStrings[index]}");
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.fastLinearToSlowEaseIn,
                width: index == currentIndex
                    ? displayWidth.width * .32
                    : displayWidth.width * .3,
                alignment: Alignment.center,
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: index == currentIndex ? displayWidth.width * .12 : 0,
                  width: index == currentIndex ? displayWidth.width * .32 : 0,
                  decoration: BoxDecoration(
                    color: index == currentIndex
                        ? Colors.blueAccent.withOpacity(.2)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.fastLinearToSlowEaseIn,
                width: index == currentIndex
                    ? displayWidth.width * .31
                    : displayWidth.width * .18,
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Row(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          width: index == currentIndex
                              ? displayWidth.width * .13
                              : 0,
                        ),
                        AnimatedOpacity(
                          opacity: index == currentIndex ? 1 : 0,
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          child: Text(
                            index == currentIndex ? listOfStrings[index] : '',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          width: index == currentIndex
                              ? displayWidth.width * .03
                              : 20,
                        ),
                        Icon(
                          listOfIcons[index],
                          size: displayWidth.width * .08,
                          color: index == currentIndex
                              ? Colors.blueAccent
                              : Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.attach_money_outlined,
    Icons.person_rounded,
  ];

  List<String> listOfStrings = [
    'Home',
    'Facturas',
    'Cuenta',
  ];
}
