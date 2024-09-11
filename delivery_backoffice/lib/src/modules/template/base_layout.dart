import 'package:flutter/material.dart';

import '../../core/ui/helpers/size_extensions.dart';

class BaseLayout extends StatelessWidget {
  const BaseLayout(this.body, {super.key});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final shortesSide = context.screenShortestSide;
    return Scaffold(
      body: SizedBox(
        height: context.screenHeight,
        child: Stack(
          children: [
            Container(
              color: Colors.black,
              constraints: BoxConstraints(
                minWidth: screenWidth,
                minHeight: shortesSide * .15,
                maxHeight: shortesSide * .15,
              ),
              alignment: Alignment.centerLeft,
              child: Container(
                width: shortesSide * .13,
                margin: const EdgeInsets.only(left: 60),
                child: Image.asset('assets/images/logo.png'),),
            ),
            
          ],
        ),
      ),
    );
  }
}
