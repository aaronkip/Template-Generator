import 'package:flutter/material.dart';
import 'package:tempgen/screens/home/widgets/desktop.dart';
import 'package:tempgen/screens/home/widgets/mobile.dart';

import '../../helpers/responsive.dart';
import '../../helpers/style.dart';
import '../../widgets/dekstop_navbar.dart';
import '../../widgets/drawer.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        key: scaffoldKey,
        appBar: ResponsiveWidget.isSmallScreen(context)
            ? AppBar(
                leading: IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: active,
                  ),
                  onPressed: () {
                    scaffoldKey.currentState?.openDrawer();
                  },
                ),
                title: Icon(
                  Icons.note,
                  color: Colors.blue,
                  size: 30,
                ),
                centerTitle: true,
                elevation: 0,
                backgroundColor: bgColor,
              )
            : PreferredSize(
                preferredSize: Size(screenSize.width, 1000),
                child: NavBar(),
              ),
        drawer: const MobileMenu(),
        backgroundColor: bgColor,
        body: ResponsiveWidget(
          largeScreen: const DesktopScreen(),
          smallScreen: MobileScreen(),
          mediumScreen: const DesktopScreen(),
        ));
  }
}
