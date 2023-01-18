import 'package:desing_wallet/Services/sharedpreferences.dart';
import 'package:flutter/material.dart';

import '../screens/screenPrincipal/types.dart';

class WidgetName extends StatelessWidget {
  const WidgetName({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(size.height * 0.01),
      margin: EdgeInsets.only(top: size.height * 0.01),
      width: size.width - 20,
      decoration: BoxDecoration(
        color: const Color(0xff292929),
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
      ),
      child: Column(
        children: [
          Text(
            UserPreferences.nombreSaved,
            style: ETypes().styleName,
          )
        ],
      ),
    );
  }
}
