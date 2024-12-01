import 'dart:ui';

import 'package:flutter/material.dart';

import '../models/blog.dart';

class BlogSection extends StatelessWidget {
  final List<Blog> featuredBlogs;
  const BlogSection({super.key, required this.featuredBlogs});

  @override
  Widget build(BuildContext context) {
    final vw = MediaQuery.of(context).size.width;
    final rem = vw * 0.075;
    final edge = vw * 0.1;
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(22, 22, 22, 1),
        border: Border.all(width: 0),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(96), topRight: const Radius.circular(96)),
      ),
      width: vw,
      padding: EdgeInsets.symmetric(vertical: edge * 1.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: edge),
            child: Text(
              'Development\nand design',
              style: TextStyle(
                  fontSize: rem * 1.2,
                  height: 0.9,
                  letterSpacing: -7,
                  color: Colors.white),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: edge),
            child: Text(
              'resources',
              style: TextStyle(
                  fontSize: rem * 1.2,
                  height: 0.9,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
            ),
          ),
          SizedBox(height: edge),
          SizedBox(
            height: 450,
            child: ScrollConfiguration(
              behavior: const MaterialScrollBehavior().copyWith(dragDevices: {
                PointerDeviceKind.mouse,
                PointerDeviceKind.touch,
                PointerDeviceKind.trackpad,
              }),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: featuredBlogs.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(
                          right: (index == featuredBlogs.length - 1)
                              ? edge
                              : (rem * 0.3),
                          left: index == 0 ? edge : 0),
                      width: rem * 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: Image.network(
                              featuredBlogs[index].imageUrl,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          const SizedBox(height: 48),
                          Text(
                            featuredBlogs[index].title,
                            style: TextStyle(
                              fontSize: rem * 0.15,
                              height: 1,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: edge),
          LayoutBuilder(builder: (context, constraints) {
            return Row(
              children: [
                Expanded(child: Container()),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(right: constraints.maxWidth * 0.2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          text,
                          style: TextStyle(
                            fontSize: rem * 0.22,
                            height: 1.2,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: rem * 0.3),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(22, 22, 22, 1),
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.white, width: 1),
                          ),
                          child: Text(
                            'VIEW ALL RESOURCES',
                            style: TextStyle(color: Colors.white, fontSize: rem * 0.2),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
          SizedBox(height: edge * 0.3),
        ],
      ),
    );
  }
}

final text =
    "We regularly release design courses, offer advice to newbie designers, walk you through creating awesome effects, and share source files.";
