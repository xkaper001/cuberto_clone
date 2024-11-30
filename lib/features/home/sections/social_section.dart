import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_infinite_marquee/flutter_infinite_marquee.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/social.dart';

class SocialSection extends StatefulWidget {
  final List<Social> socials;
  final ScrollController scrollController;
  const SocialSection(
      {super.key, required this.socials, required this.scrollController});

  @override
  State<SocialSection> createState() => _SocialSectionState();
}

class _SocialSectionState extends State<SocialSection> {
  late bool isForward;
  @override
  void initState() {
    super.initState();
    setState(() {
      isForward = false;
    });
    widget.scrollController.addListener(
      () {
        if (widget.scrollController.position.userScrollDirection ==
            ScrollDirection.forward) {
          setState(() {
            isForward = false;
          });
        } else if (widget.scrollController.position.userScrollDirection ==
            ScrollDirection.reverse) {
          setState(() {
            isForward = true;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        ValueListenableBuilder(
          valueListenable: widget.scrollController.position.isScrollingNotifier,
          builder: (context, value, child) {
            log("Scrolling");
            return preHeader(isForward, value);
          },
        ),
        header(width),
        for (Social social in widget.socials)
          SocialSectionItem(title: social.title, url: social.url),
      ],
    );
  }
}

Container preHeader(bool direction, bool isScrolling) {
  // bool isForward = false;
  // if (scrollController.position.userScrollDirection ==
  //     ScrollDirection.forward) {
  //   isForward = true;
  // } else {
  //   isForward = false;
  // }
  return Container(
    color: Colors.black,
    height: 500,
    child: InfiniteMarquee(
      separatorBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 64),
          height: 50,
          width: 150,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
        );
      },
      frequency: Duration(milliseconds: isScrolling ? 1 : 20),
      stepOffset: direction ? 3.5 : -3.5,
      itemBuilder: (context, index) {
        return const Text(
          'Follow Us',
          style: TextStyle(color: Colors.white, fontSize: 300),
        );
      },
    ),
  );
}

Container header(double width) {
  return Container(
    width: double.infinity,
    color: Colors.black,
    padding: EdgeInsets.symmetric(vertical: 42, horizontal: width * 0.075),
    child: const Text(
      'SOCIAL MEDIA AND CONTACTS',
      style: TextStyle(color: Colors.white, fontSize: 20),
    ),
  );
}

class SocialSectionItem extends StatefulWidget {
  final String title;
  final String url;
  const SocialSectionItem({super.key, required this.title, required this.url});

  @override
  State<SocialSectionItem> createState() => _SocialSectionItemState();
}

class _SocialSectionItemState extends State<SocialSectionItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double?> _animation;
  late final Uri _url;
  bool isHovering = false;
  double height = 150;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween<double?>(begin: 0, end: height)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _url = Uri.parse(widget.url);
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return MouseRegion(
      onEnter: (_) => setState(() {
        isHovering = true;
        _controller.forward();
      }),
      onExit: (_) => setState(() {
        isHovering = false;
        _controller.reverse();
      }),
      child: InkWell(
        onTap: () async => await _launchUrl(),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: height,
              decoration: const BoxDecoration(
                color: Colors.black,
                border: Border.symmetric(
                    horizontal: BorderSide(width: 0.25, color: Colors.grey)),
              ),
              padding:
                  EdgeInsets.symmetric(horizontal: width * 0.075, vertical: 36),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(color: Colors.white, fontSize: 42),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.arrow_outward_sharp,
                    color: Colors.white,
                    size: 52,
                  ),
                ],
              ),
            ),
            AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Container(
                      color: Colors.white,
                      width: width,
                      height: _animation.value,
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: isHovering ? 1 : 0,
                        child: InfiniteMarquee(
                          stepOffset: 2.5,
                          itemBuilder: (context, index) {
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  widget.title,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 42),
                                ),
                                const SizedBox(width: 72),
                                const Icon(Icons.arrow_outward_sharp,
                                    color: Colors.black, size: 52),
                                const SizedBox(width: 72),
                              ],
                            );
                          },
                        ),
                      ));
                }),
          ],
        ),
      ),
    );
  }
}
