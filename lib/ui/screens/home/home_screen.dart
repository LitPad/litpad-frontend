import 'package:flutter/material.dart';
import 'package:litpad/core/utils/constants/constants.dart';
import 'package:litpad/ui/components/home/navbar_widget.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';

import 'containers/footer_section.dart';
import 'containers/hero_section.dart';
import 'containers/our_booking_list_section.dart';
import 'containers/with_litpad_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
      controller: context.scrollController,
      child: Column(
        children: [
          const NavBar(),
          const SizedBox(height: 100),
          FadeInDown(
            globalKey: GlobalKey(),
            delay: 600.ms,
            child: const HeroSection(),
          ),
          const SizedBox(height: 80),
          FadeInUp(
            globalKey: GlobalKey(),
            delay: 400.ms,
            child: const WithLitpadSection(),
          ),
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
