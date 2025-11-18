import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile/utils/constant/color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Text("data")
      ),
      bottomNavigationBar: NavigationBar(
          selectedIndex: 0,
        elevation: 0,
        indicatorColor: AllColors.orange,
        destinations: [
          NavigationDestination(icon: Icon(Iconsax.home), label: ""),
          NavigationDestination(icon: Icon(Iconsax.shopping_cart), label: ""),
          NavigationDestination(icon: Icon(Iconsax.clock), label: ""),
          NavigationDestination(icon: Icon(Iconsax.clock), label: "")
        ],
      ),
    );
  }
}
