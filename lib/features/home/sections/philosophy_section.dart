import 'package:flutter/material.dart';
import 'package:portfolio/features/home/widgets/video_widget.dart';

class PhilosophySection extends StatelessWidget {
  const PhilosophySection({super.key});

  @override
  Widget build(BuildContext context) {
    final vw = MediaQuery.of(context).size.width;
    final edge = vw * 0.1;
    final rem = vw * 0.075;
    return Container(
      color: const Color.fromRGBO(22, 22, 22, 1),
      child: Container(
        width: vw,
        padding: EdgeInsets.symmetric(horizontal: edge, vertical: edge * 1.2),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(96), topRight: const Radius.circular(96))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Our', style: TextStyle(fontSize: rem * 1.3,height: 0.9), ),
            Text('philosophy', style: TextStyle(fontSize: rem * 1.3, height:0.9, fontStyle:  FontStyle.italic) ),
            SizedBox(height: edge*1.1),
            LayoutBuilder(
              builder: (context, constraints) {
                return Row(
                  children: [
                    SizedBox(width: constraints.maxWidth * 0.4, child:  const VideoWidget('assets/videos/philo.mp4')),
                    
                    Container(
                      padding: EdgeInsets.only(left: constraints.maxWidth * 0.1),
                      width: constraints.maxWidth * 0.5,
                      child: Text(text, style: TextStyle(fontSize: rem * 0.22, height: 1, fontWeight: FontWeight.w500),),
                    ),
                  ],
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}

final text = """In our team, developers work alongside designers, strategists and analysts. Cuberto doesn't do cookie-cutter solutions and we build products exactly as they were during the design phase, no short cuts or simplifications.

We're driven by user‑centered design that drives productivity and increases revenue. Our expertise and ingenuity are remarkable, yet we always strive to outdo and outperform our previous achievements.

""";