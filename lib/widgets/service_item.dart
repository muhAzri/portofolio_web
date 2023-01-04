import 'package:flutter/material.dart';

import 'package:portofolio_web/shared/theme.dart';

class ServiceItem extends StatelessWidget {
  final String title;
  final String description;

  const ServiceItem({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      margin: const EdgeInsets.only(right: 70),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/icons/laptop.png',
            width: 37.5,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            title,
            style: purpleTextStyle.copyWith(
              fontSize: 16,
              fontWeight: bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            description,
            style: grayTextStyle.copyWith(
              height: 1.8,
            ),
            maxLines: 5,
          )
        ],
      ),
    );
  }
}

class ServiceItemMobile extends StatelessWidget {
  final String title;
  final String description;

  const ServiceItemMobile({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff000000).withOpacity(0.1),
            offset: const Offset(0, 4),
            blurRadius: 20,
          ),
        ],
      ),
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/icons/laptop.png',
            width: 37.5,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            title,
            style: purpleTextStyle.copyWith(
              fontSize: 16,
              fontWeight: bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            description,
            style: grayTextStyle.copyWith(
              height: 1.8,
            ),
            maxLines: 5,
          )
        ],
      ),
    );
  }
}
