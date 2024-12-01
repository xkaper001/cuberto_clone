import 'package:flutter/material.dart';

import '../../../utils/responsive.dart';
import '../widgets/video_widget.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  Row row(double rem) => Row(
        children: [
          const Spacer(
            flex: 1,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'We are a digital',
                style: TextStyle(fontSize: rem, height: 1),
              ),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(150),
                    child: SizedBox(
                      height: rem * 1,
                      width: rem * 1.45,
                      child: const VideoWidget('assets/videos/header.mp4'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'design',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w300,
                            fontSize: rem,
                            height: 1,
                            fontFamily: 'GeneralSans',
                          ),
                        ),
                        TextSpan(
                          text: ' and',
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal,
                            fontSize: rem,
                            height: 1,
                            fontFamily: 'GeneralSans',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Text(
                'motion agency',
                style: TextStyle(fontSize: rem, height: 1),
              ),
            ],
          ),
          const Spacer(
            flex: 5,
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    final vw = MediaQuery.of(context).size.width;
    return ResponsiveLayout(
      mobileScaffold: row(vw * 0.05),
      tabletScaffold: row(vw * 0.07),
      desktopScaffold: row(vw * 0.075),
    );
  }
}
