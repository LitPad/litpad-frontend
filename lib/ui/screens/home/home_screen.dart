import 'package:flutter/material.dart';
import 'package:litpad/core/utils/constants/constants.dart';
import 'package:litpad/ui/components/home/navbar_widget.dart';

import 'containers/footer_section.dart';
import 'containers/hero_section.dart';
import 'containers/our_booking_list_section.dart';
import 'containers/with_litpad_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          const NavBar(),
          const SizedBox(height: 100),
          const HeroSection(),
          const SizedBox(height: 80),
          const WithLitpadSection(),
          const OurBookingListSection(),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 60),
            child: const Divider(),
          ),
          const FooterSection(),
        ],
      ),
    ));
  }
}
