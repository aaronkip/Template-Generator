import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/content.dart';
import '../../../helpers/responsive.dart';
import '../../../helpers/style.dart';
import '../../../widgets/button.dart';

class DesktopScreen extends StatelessWidget {
  const DesktopScreen({Key? key}) : super(key: key);

  launchMailto() async {
    final mailtoLink = Mailto(
      to: ['kosai.pairo@hotmail.com'],
      //cc: ['cc1@example.com', 'cc2@example.com'],
      subject: 'Subscription Request',
      body:
          'Hello there, \nRequesting for my credentials to be added to the template maker and note editing website.',
    );
    // Convert the Mailto instance into a string.
    // Use either Dart's string interpolation
    // or the toString() method.
    await launch('$mailtoLink');
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    var screenSize = MediaQuery.of(context).size;
    return Container(
      constraints: BoxConstraints(maxWidth: screenSize.width),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            width: screenSize.width / 2,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(bottom: 15),
                    child: Text(
                      "",
                      style: GoogleFonts.roboto(
                          color: active,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  RichText(
                      text: TextSpan(
                          children: [
                        TextSpan(
                          text: "Take your ",
                        ),
                        TextSpan(
                            text: "note editing",
                            style: GoogleFonts.roboto(color: active)),
                        TextSpan(
                          text: " experience to the next ",
                        ),
                        TextSpan(
                            text: "level.",
                            style: GoogleFonts.roboto(color: active)),
                        TextSpan(
                          text: " Don't miss out.",
                        ),
                      ],
                          style: GoogleFonts.roboto(
                              fontSize: ResponsiveWidget.isMediumScreen(context)
                                  ? 38
                                  : 58,
                              fontWeight: FontWeight.bold))),
                  Visibility(
                    child: Text(
                      mainParagraph,
                      style: GoogleFonts.roboto(
                          fontSize: 20, letterSpacing: 1.5, height: 1.5),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(.1),
                              offset: Offset(0, 40),
                              blurRadius: 80)
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: screenSize.width / 4,
                          padding: EdgeInsets.only(left: 8),
                          child: TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                                icon: Icon(Icons.email_outlined),
                                hintText: "Enter your email",
                                border: InputBorder.none),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            launchMailto();
                          },
                          child: CustomButton(
                            text: "Request",
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: screenSize.height / 14),
                  Visibility(
                    visible: screenSize.height > 700,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /*BottomText(
                          mainText: "15k+",
                          secondaryText: "Dates and matches\nmade everyday",
                        ),
                        BottomText(
                          mainText: "1,456",
                          secondaryText: "New members\nsignup every day",
                        ),
                        BottomText(
                          mainText: "1M+",
                          secondaryText: "Members from\naround the world",
                        ),*/
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: screenSize.width / 2,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: screenSize.width / 28,
                  ),
                  Image.asset(
                    "images/background.png",
                    width: screenSize.width / 1.6,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
