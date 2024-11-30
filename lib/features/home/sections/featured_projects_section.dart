import 'package:flutter/material.dart';
import 'package:portfolio/features/home/widgets/video_widget.dart';

class FeaturedProjectsSection extends StatelessWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const FeaturedProjectsSection());
  const FeaturedProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final vw = MediaQuery.of(context).size.width;
    final rem = vw * 0.075;
    final edge = vw * 0.1;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(edge),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(22, 22, 22, 1),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(96), topRight: Radius.circular(96)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Featured',
            style:
                TextStyle(fontSize: rem * 1.15, color: Colors.white, height: 1),
          ),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(300),
                child: Container(
                  height: rem * 1.03 * 1.25,
                  width: rem * 1.4 * 1.25,
                  child: const VideoWidget(
                      'https://cuberto.com/assets/featured/header.mp4'),
                ),
              ),
              Text(
                ' projects',
                style: TextStyle(
                    fontSize: rem * 1.15,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    height: 1,
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
          // Padding(
          //     padding: EdgeInsets.all(8),
          //     child: Scaffold(
          //       body: MasonryGridView.builder(
          //         itemCount: 6,
          //         gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
          //             crossAxisCount: 2),
          //         itemBuilder: (context, index) => Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: Container(
          //             height: 200,
          //             color: Colors.black,
          //           ),
          //         ),
          //       ),
          //     ))
        ],
      ),
    );
  }
}
