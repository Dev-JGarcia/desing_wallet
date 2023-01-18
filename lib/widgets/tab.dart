import 'package:desing_wallet/widgets/widgetTabBar.dart';
import 'package:flutter/material.dart';

class WidgetTAB extends StatelessWidget {
  const WidgetTAB({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(size.height * 0.01),
      margin: EdgeInsets.only(top: size.height * 0.05),
      width: size.width - 20,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 4.5,
                spreadRadius: 1,
                offset: const Offset(3, 3)),
          ],
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            colors: <Color>[
              Color(0xff0B2D62),
              Color(0xff0E6EC9),
            ],
          )),
      child: const WidgetBodyTadBar(),
    );
  }
}

