import 'dart:math' as math;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio/features/home/models/blog.dart';
import 'package:portfolio/features/home/sections/featured_projects_section.dart';
import 'package:portfolio/features/home/sections/skills_section.dart';
import 'package:portfolio/features/home/sections/social_section.dart';
import 'package:portfolio/features/home/widgets/video_widget.dart';
import 'package:scroll_animator/scroll_animator.dart';

import 'models/project.dart';
import 'models/social.dart';
import 'sections/blog_section.dart';
import 'sections/hero_section.dart';
import 'sections/philosophy_section.dart';
import 'widgets/menu_button.dart';

class HomeScreen extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const HomeScreen());
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ScrollController _scrollController;
  final List<Social> _socialList = const [
    Social(title: 'Instagram', url: 'https://instagram.com/ayan_zzx'),
    Social(title: 'LinkedIn', url: 'https://linkedin.com/in/xkaper'),
    Social(title: 'Dribble', url: 'https://dribbble.com'),
    Social(title: 'Github', url: 'https://github.com/xkaper001'),
    Social(title: 'Youtube', url: 'https://www.youtube.com/@isthatAyan'),
    Social(title: 'Behance', url: 'https://behnace.net'),
    Social(title: 'Twitter', url: 'https://x.com/xkaper001'),
  ];

  final List<Blog> _featuredBlogs = [
    Blog(
      title: 'How to Make UI/UX Website // HTML and CSS development',
      imageUrl:
          'https://cdn.cuberto.com/cb/upload/b73b0d2feb001c8bd719c808c40ce28b.png',
    ),
    Blog(
      title: 'How to Cook an Emotional Site // Web Development',
      imageUrl:
          'https://cdn.cuberto.com/cb/upload/bc24961ad4410b4202a2277bc1c487fb.png',
    ),
    Blog(
      title: 'How to Make Epic Website // Frontend Development',
      imageUrl:
          'https://cdn.cuberto.com/cb/upload/480b30071a8533b278c30dd7d9133f09.png',
    ),
    Blog(
      title: 'Cuberto Mouse Follower',
      imageUrl:
          'https://cdn.cuberto.com/cb/upload/885fbbc555395f745746b23b73f539f5.png',
    ),
    Blog(
      title: 'Making switch with SVG Distortion Effect',
      imageUrl:
          'https://cdn.cuberto.com/cb/upload/99d9ee549abf01940d4b1cfa04734b7d.jpg',
    ),
    Blog(
      title: 'UI/UX Design TIps / Volume 9',
      imageUrl:
          'https://cdn.cuberto.com/cb/upload/ef20532e8de88a471d4bd1338dc93414.png',
    ),
  ];

  @override
  void initState() {
    _scrollController = AnimatedScrollController(
      animationFactory: const ChromiumEaseInOut()
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final vh = MediaQuery.of(context).size.height;
    final vw = MediaQuery.of(context).size.width;
    final projectList = <Project>[
      Project(
        title: 'Punto Pago – The First Super-App in Latin America',
        imageUrl: 'https://i.ibb.co/MCYZph5/cover.jpg',
      ),
      Project(
        title:
            'Kelvin Zero – A digital product for passwordless authentication',
        imageUrl: 'https://i.ibb.co/PM0WrfF/cover2.jpg',
      ),
      Project(
        title: 'Riyadh – Official website of Riyadh, Saudi Arabia\'s capital',
        imageUrl: 'https://i.ibb.co/kqv0Xtr/cover3.jpg',
      ),
      Project(
        title: 'Magma – The ultimate tool for building in the Web3 era',
        imageUrl: 'https://i.ibb.co/ZBVrgM6/cover4.jpg',
      ),
      Project(
        title: 'Qvino – Wine marketplace with interactive learning',
        imageUrl: 'https://i.ibb.co/3YM7chS/cover5.jpg',
      ),
      Project(
        title: 'FlipaClip – The best tool for stop-motion animation',
        imageUrl: 'https://i.ibb.co/VV5nBdr/cover3.jpg',
      ),
      Project(
        title: 'Zelt – Run HR, IT & Finance in one place',
        imageUrl: 'https://i.ibb.co/k5PfrVT/cover10.jpg',
      ),
      Project(
        title: 'Potion – Sales tool for increasing conversions',
        imageUrl: 'https://i.ibb.co/PjFRzVZ/cover7.jpg',
      ),
      Project(
        title: 'Cisco – Cloud based network management',
        imageUrl: 'https://i.ibb.co/RT0qcqX/cover9.jpg',
      ),
      Project(
        title: 'Ferrumpipe – Galvanized steel metal frame manufacturer',
        imageUrl: 'https://i.ibb.co/6nG7kWW/cover8.jpg',
      ),
    ];
    return Scaffold(
        appBar: AppBar(
          actions: [
            // const Icon(Icons.menu),
            Padding(
              padding: EdgeInsets.only(right: vw * 0.04),
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
        body: ScrollConfiguration(
          behavior: const MaterialScrollBehavior(),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
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
                SizedBox(
                    width: vw,
                    child: const VideoWidget('assets/videos/hero.mp4')),
                const SkillsSection(),
                FeaturedProjectsSection(projects: projectList),
                const PhilosophySection(),
                BlogSection(featuredBlogs: _featuredBlogs),
                SocialSection(
                  socials: _socialList,
                  scrollController: _scrollController,
                )
              ],
            ),
          ),
        ));
  }
}

class MyCustomSmoothScrollController extends ScrollController {
  MyCustomSmoothScrollController({
    double initialScrollOffset = 0.0,
    bool keepScrollOffset = true,
    String? debugLabel,
  }) : super(
          initialScrollOffset: initialScrollOffset,
          keepScrollOffset: keepScrollOffset,
          debugLabel: debugLabel,
        );

  @override
  ScrollPosition createScrollPosition(
    ScrollPhysics physics,
    ScrollContext context,
    ScrollPosition? oldPosition,
  ) {
    //use the customscroll position with smooth scrolling
    return CustomSmoothScrollPosition(
      physics: physics,
      context: context,
      initialPixels: initialScrollOffset,
      keepScrollOffset: keepScrollOffset,
      oldPosition: oldPosition,
      debugLabel: debugLabel,
    );
  }
}

class CustomSmoothScrollPosition extends ScrollPositionWithSingleContext {
  int previousScrollTime = DateTime.now()
      .millisecondsSinceEpoch; //used to track time between scrolls same as clragons code

  CustomSmoothScrollPosition({
    required ScrollPhysics physics,
    required ScrollContext context,
    double initialPixels = 0.0,
    bool keepScrollOffset = true,
    ScrollPosition? oldPosition,
    String? debugLabel,
  }) : super(
          physics: physics,
          context: context,
          initialPixels: initialPixels,
          keepScrollOffset: keepScrollOffset,
          oldPosition: oldPosition,
          debugLabel: debugLabel,
        );

  @override
  void pointerScroll(double delta) {
    // If an update is made to pointer scrolling here, consider if the same
    // (or similar) change should be made in
    // _NestedScrollCoordinator.pointerScroll.
    if (delta == 0.0) {
      goBallistic(0.0);
      return;
    }

    final double targetPixels =
        math.min(math.max(pixels + delta, minScrollExtent), maxScrollExtent);
    if (targetPixels != pixels) {
      goIdle();
      updateUserScrollDirection(
        -delta > 0.0 ? ScrollDirection.forward : ScrollDirection.reverse,
      );
      final double oldPixels = pixels;
      // Set the notifier before calling force pixels.
      // This is set to false again after going ballistic below.
      isScrollingNotifier.value = true;

      //--------------------  NEW CODE STARTS HERE  --------------------
      int deltaScrollTime =
          DateTime.now().millisecondsSinceEpoch - previousScrollTime;
      int animationDuration = deltaScrollTime < 500 ? deltaScrollTime : 500;

      if (animationDuration < 32) {
        //60fps is 16ms per frame so less than 32ms is pointless as its less than 2 frames
        //also avoids calling animateTo too many times in quick succession which seems to be buggy and throws exceptions for elapsed<0  that might be related to github.com/flutter/flutter/issues/106277
        super.pointerScroll(delta);
        return;
      }
      animateTo(targetPixels,
          duration: Duration(milliseconds: animationDuration),
          curve: Curves.linear);
      previousScrollTime = DateTime.now().millisecondsSinceEpoch;
      //--------------------  NEW CODE ENDS HERE  --------------------

      //-------------------- THIS IS THE ORIGINAL FORCE PIXELS IMPLEMENTATION OF super.pointerScroll(delta) --------------------
      // forcePixels(targetPixels);
      // didStartScroll();
      // didUpdateScrollPositionBy(pixels - oldPixels);
      // didEndScroll();
      // goBallistic(0.0);
    }
  }
}
