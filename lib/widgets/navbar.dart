import 'package:flutter/material.dart';

import '../shared/theme.dart';

class NavBar extends StatefulWidget {
  final ScrollController scrollController;

  const NavBar({super.key, required this.scrollController});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  late final ScrollController scrollController;

  _NavBarState();

  @override
  void initState() {
    super.initState();
    scrollController = widget.scrollController;
  }

  bool _isHomeHovered = false;
  bool _isAboutHovered = false;
  bool _isProjectsHovered = false;
  bool _isServicesHovered = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 104,
        right: 104,
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/images/logo.png',
            width: 36,
            height: 36,
          ),
          const SizedBox(width: 8),
          Text(
            'Muhammad Azri Fatihah Susanto',
            style: purpleTextStyleUbuntu.copyWith(fontSize: 16),
          ),
          const Spacer(),
          InkWell(
            onHover: (isHovering) {
              setState(() {
                _isHomeHovered = isHovering;
              });
            },
            onTap: () {
              scrollController.animateTo(
                0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            child: Text(
              'Home',
              style: _isHomeHovered
                  ? orangeTextStyleUbuntu.copyWith(fontSize: 16)
                  : purpleTextStyleUbuntu.copyWith(fontSize: 16),
            ),
          ),
          const SizedBox(width: 50),
          InkWell(
            onHover: (isHovering) {
              setState(() {
                _isAboutHovered = isHovering;
              });
            },
            onTap: () {
              scrollController.animateTo(
                550,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            child: Text(
              'About',
              style: _isAboutHovered
                  ? orangeTextStyleUbuntu.copyWith(fontSize: 16)
                  : purpleTextStyleUbuntu.copyWith(fontSize: 16),
            ),
          ),
          const SizedBox(width: 50),
          InkWell(
            onHover: (isHovering) {
              setState(() {
                _isProjectsHovered = isHovering;
              });
            },
            onTap: () {
              scrollController.animateTo(
                1250,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            child: Text(
              'Projects',
              style: _isProjectsHovered
                  ? orangeTextStyleUbuntu.copyWith(fontSize: 16)
                  : purpleTextStyleUbuntu.copyWith(fontSize: 16),
            ),
          ),
          const SizedBox(width: 50),
          InkWell(
            onHover: (isHovering) {
              setState(() {
                _isServicesHovered = isHovering;
              });
            },
            onTap: () {
              scrollController.animateTo(
                1800,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            child: Text(
              'Services',
              style: _isServicesHovered
                  ? orangeTextStyleUbuntu.copyWith(fontSize: 16)
                  : purpleTextStyleUbuntu.copyWith(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
