// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utils/constants.dart';
import 'package:flutter_portfolio/widgets/reusable/about_bullet.dart';
import 'package:flutter_portfolio/widgets/reusable/shot_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:js' as js;
import '../../utils/footer.dart';
import '../../widgets/reusable/chip_container.dart';

class WebAboutPage extends StatefulWidget {
  const WebAboutPage({super.key});

  @override
  State<WebAboutPage> createState() => _WebAboutPageState();
}

class _WebAboutPageState extends State<WebAboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Stack(
          children: [
            // Positioned(
            //   left: MediaQuery.of(context).size.width / 2.55,
            //   child: SizedBox(
            //     width: MediaQuery.of(context).size.width - 100,
            //     height: MediaQuery.of(context).size.width - 100,
            //     child: Image.asset(
            //       'assets/images/avatar.jpg',
            //       colorBlendMode: BlendMode.modulate,
            //       color: Colors.white.withOpacity(0.8),
            //     ),
            //   ),
            // ),
            LayoutBuilder(
              builder: (_, constraints) {
                if (constraints.maxWidth < 600) {
                  return Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width / 20),
                      //dasboard column
                      _aboutbody(),
                      SizedBox(width: MediaQuery.of(context).size.width / 20),
                    ],
                  );
                } else {
                  return Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width / 5),
                      //about column
                      _aboutbody(),
                      SizedBox(width: MediaQuery.of(context).size.width / 5),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  _aboutbody() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.11),
          _topText(),
          const SizedBox(height: 30),
          _links(),
          const SizedBox(height: 20),
          _bio(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.11),
          const Footer()
        ],
      ),
    );
  }

  _topText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About Me",
                      style: GoogleFonts.nunitoSans(
                        fontWeight: FontWeight.bold,
                        fontSize: 45,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Flexible(
                      child: ChipContainer(
                        text: "Bio",
                        color: Colors.deepPurple,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _links() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Links",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        const SizedBox(height: 40),
        AboutBullet(
          linkTo: "Twitter: ",
          textColor: const Color(0xff00acee),
          userName: Constants.twitterUserName,
          onTap: () {
            js.context.callMethod('open', [Constants.twitterLink]);
          },
        ),
        AboutBullet(
          linkTo: "Reddit: ",
          textColor: Colors.deepPurple,
          userName: Constants.redditUserName,
          onTap: () {
            js.context.callMethod('open', [Constants.reditLink]);
          },
        ),
        AboutBullet(
          linkTo: "Github: ",
          textColor: const Color(0xff00acee),
          userName: Constants.githubUserName,
          onTap: () {
            js.context.callMethod('open', [Constants.githubLink]);
          },
        ),
      ],
    );
  }

  _bio() {
    double boxSize =
        MediaQuery.of(context).size.height > MediaQuery.of(context).size.width
            ? MediaQuery.of(context).size.width / 2
            : MediaQuery.of(context).size.height / 2.5;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Bio",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        const SizedBox(height: 35),
        Text(
          "Work Status",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w500,
            fontSize: 26,
            color: Colors.deepPurple,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0, top: 5),
          child: Text(
            Constants.workDescription,
            maxLines: 2,
            textAlign: TextAlign.start,
            style: GoogleFonts.roboto(
              color: Colors.white38,
              fontSize: 15,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "Long, Intro",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w500,
            fontSize: 26,
            color: Colors.deepPurple,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0, top: 5),
          child: Text(
            Constants.aboutMe,
            textAlign: TextAlign.start,
            style: GoogleFonts.roboto(
              color: Colors.white38,
              fontSize: 15,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "Short, Intro",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w500,
            fontSize: 26,
            color: Colors.deepPurple,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0, top: 5),
          child: Text(
            Constants.shortIntro,
            maxLines: 2,
            textAlign: TextAlign.start,
            style: GoogleFonts.roboto(
              color: Colors.white38,
              fontSize: 15,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "Education",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w500,
            fontSize: 26,
            color: Colors.deepPurple,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0, top: 5),
          child: Text(
            Constants.education,
            maxLines: 2,
            textAlign: TextAlign.start,
            style: GoogleFonts.roboto(
              color: Colors.white38,
              fontSize: 15,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "Shots.",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w500,
            fontSize: 26,
            color: Colors.deepPurple,
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: boxSize - 30,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0, top: 5),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: Constants.shotImages.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding:
                      EdgeInsets.only(right: 8.0, left: index == 0 ? 0 : 8),
                  child: ShotCard(image: Constants.shotImages[index]),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
