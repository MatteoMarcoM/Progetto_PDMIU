import 'package:flutter/material.dart';
import 'package:pdmiu_app_biblioteca/widgets/mobileHomeDrawer.dart';
import 'largeHomeDrawer.dart';

class ResponsiveHomeDrawer extends StatelessWidget {
  const ResponsiveHomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // ottengo la larghezza corrente dello schermo
    final width = MediaQuery.of(context).size.width;
    final isLarge = width > 800;

    return (isLarge) ? const LargeHomeDrawer() : const MobileHomeDrawer();
  }
}
