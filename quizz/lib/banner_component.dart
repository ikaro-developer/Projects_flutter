import 'package:flutter/material.dart';

class BannerComponent extends StatelessWidget {
  final Widget screen;
  const BannerComponent(this.screen, {super.key});

  @override
  Widget build(BuildContext context) {
    return Banner(
      message: "DUCK DEV",
      location: BannerLocation.topEnd,
      color: Colors.red.withOpacity(0.8),
      textStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      child: screen,
    );
  }
}
