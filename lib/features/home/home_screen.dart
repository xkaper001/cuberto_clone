import 'package:flutter/material.dart';
import 'package:portfolio/features/home/models/blog.dart';
import 'package:portfolio/features/home/sections/featured_projects_section.dart';
import 'package:portfolio/features/home/sections/skills_section.dart';
import 'package:portfolio/features/home/sections/social_section.dart';
import 'package:portfolio/features/home/widgets/video_widget.dart';
import 'package:portfolio/utils/responsive.dart';

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
    _scrollController = ScrollController();
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
        body: SingleChildScrollView(
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
        ));
  }
}
