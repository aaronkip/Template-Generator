import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/content.dart';
import '../../../helpers/style.dart';
import '../../../widgets/button.dart';

class MobileScreen extends StatelessWidget {
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
    var screenSize = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 450,
              constraints: BoxConstraints(maxWidth: 450),
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: RichText(
                textAlign: TextAlign.center,
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
                        fontSize: 28, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: 550,
          constraints: BoxConstraints(maxWidth: 550),
          child: Text(
            mainParagraph,
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(letterSpacing: 1.5, height: 1.5),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          constraints: BoxConstraints(maxWidth: 550),
          padding: EdgeInsets.all(4),
          margin: EdgeInsets.symmetric(horizontal: 20),
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
                padding: EdgeInsets.only(left: 4),
                child: TextField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.email_outlined),
                      hintText: "Email",
                      border: InputBorder.none),
                ),
              ),
              InkWell(
                onTap: () {
                  launchMailto();
                },
                child: CustomButton(
                  text: "Get started",
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
