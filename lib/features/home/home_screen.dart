import 'package:flutter/material.dart';
import 'package:portfolio/features/home/sections/featured_projects_section.dart';
import 'package:portfolio/features/home/sections/skills_section.dart';
import 'package:portfolio/features/home/sections/social_section.dart';
import 'package:portfolio/features/home/widgets/video_widget.dart';
import 'package:portfolio/utils/responsive.dart';

import 'models/social.dart';
import 'widgets/menu_button.dart';

class HomeScreen extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const HomeScreen());
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;
  final List<Social> _socialList = const [
    Social(title: 'Instagram', url: 'https://instagram.com/ayan_zzx'),
    Social(title: 'LinkedIn', url: 'https://linkedin.com/in/xkaper'),
    Social(title: 'Dribble', url: 'https://dribbble.com'),
    Social(title: 'Github', url: 'https://github.com/xkaper001'),
    Social(title: 'Youtube', url: 'https://www.youtube.com/@isthatAyan'),
    Social(title: 'Behance', url: 'https://behnace.net'),
    Social(title: 'Twitter', url: 'https://x.com/xkaper001'),
  ];

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final vh = MediaQuery.of(context).size.height;
    final vw = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          actions: [
            // const Icon(Icons.menu),
            Padding(
              padding:  EdgeInsets.only(right: vw * 0.04),
              child: GestureDetector(
                child: CustomPaint(
                  size: const Size(64, 32),
                  painter: MenuPainter(),
                ),
              ),
            )
          ],
          backgroundColor: Colors.transparent,
          forceMaterialTransparency: true,
          toolbarHeight: 100,

        ),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          // physics: NeverScrollableScrollPhysics(),
          controller: _scrollController,
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 20, 0, 0),
                    child: Image.asset(
                      'assets/images/xkaper_logo.png',
                      height: 64,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
              Container(
                height: vh * 0.75,
                alignment: Alignment.center,
                child: const HeroSection(),
              ),
              SizedBox(width: vw, child: const VideoWidget('assets/videos/hero.mp4')),
              const SkillsSection(),
              const FeaturedProjectsSection(),
              SocialSection(socials: _socialList,scrollController: _scrollController,)
            ],
          ),
        ));
  }
}

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
                    child: Container(
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