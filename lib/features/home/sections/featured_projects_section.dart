import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/features/home/widgets/video_widget.dart';

import '../models/project.dart';

class FeaturedProjectsSection extends StatelessWidget {
  final List<Project> projects;
  static route(List<Project> projects) => MaterialPageRoute(
      builder: (context) => FeaturedProjectsSection(
            projects: projects,
          ));
  const FeaturedProjectsSection({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    final vw = MediaQuery.of(context).size.width;
    final rem = vw * 0.075;
    final edge = vw * 0.1;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(edge),
      decoration: BoxDecoration(
        color: Color.fromRGBO(22, 22, 22, 1),
        border: Border.all(width: 0),
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
                child: SizedBox(
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
          SizedBox(height: edge),
          buildProjectCards(context, projects),
        ],
      ),
    );
  }
}

Row buildProjectCards(BuildContext context, List<Project> projects) {
  final vw = MediaQuery.of(context).size.width;
  final oddList =
      projects.where((element) => projects.indexOf(element) % 2 == 0).toList();
  final evenList =
      projects.where((element) => projects.indexOf(element) % 2 == 1).toList();
  return Row(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      buildProjectCardsColumn(context, oddList),
      SizedBox(width: vw * 0.045),
      buildProjectCardsColumn(context, evenList, doTopPad: true),
    ],
  );
}

buildProjectCardsColumn(BuildContext context, List<Project> projects,
    {bool doTopPad = false}) {
  final vw = MediaQuery.of(context).size.width;
  final rem = vw * 0.1;
  return SizedBox(
    width: vw * 0.3,
    child: ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: projects.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (doTopPad && index == 0)
              SizedBox(height: rem * 2),
            ClipRRect(
              borderRadius: BorderRadius.circular(48),
              child: CachedNetworkImage(
                width: vw * 0.3,
                imageUrl: projects[index].imageUrl,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) {
                  log(error.toString());
                  return const Icon(Icons.error);
                },
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: rem * 0.2),
            SizedBox(
              width: vw * 0.25,
              child: Text(
                projects[index].title,
                style: TextStyle(color: Colors.white, fontSize: rem * 0.16),
              ),
            ),
            SizedBox(height: rem * 0.5)
          ],
        );
      },
    ),
  );
}
