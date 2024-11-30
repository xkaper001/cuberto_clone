import 'package:flutter/material.dart';
import 'package:portfolio/features/home/widgets/video_widget.dart';

class SkillsSection extends StatelessWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const SkillsSection());
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final vh = MediaQuery.of(context).size.height;
    return SizedBox(
      height: vh + 250,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: SizedBox(
                  height: vh * 0.55,
                  child: VideoWidget(
                      'https://cuberto.com/assets/home/summary/1.mp4?3'))),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Quality is more important than\nquantity. One home run is\nbetter than two doubles.',
                style: TextStyle(
                    fontSize: 40,
                    height: 1.1,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'GeneralSans'),
              ),
              const SizedBox(height: 16),
              Text(
                '                                         ~ Steve Jobs',
                textAlign: TextAlign.end,
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'GeneralSans'),
              ),
              const SizedBox(height: 42),
              Container(
                height: 250,
                width: 500,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 0.5),
                  borderRadius: BorderRadius.circular(300),
                ),
                child: Center(
                  child: Text(
                    'Github',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'GeneralSans'),
                  ),
                ),
              )
            ],
          )),
        ],
      ),
    );
  }
}
