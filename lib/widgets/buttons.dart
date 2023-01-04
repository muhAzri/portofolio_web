import 'package:flutter/material.dart';

import 'package:portofolio_web/shared/theme.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final String? icon;
  final VoidCallback? onTap;
  const CustomButton({
    super.key,
    required this.title,
    this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 152,
        height: 65,
        padding: const EdgeInsets.symmetric(
          vertical: 19,
          horizontal: 27,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: orangeColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon != null
                ? Image.asset(
                    icon!,
                    width: 16,
                  )
                : const SizedBox(),
            SizedBox(
              width: icon != null ? 10 : 0,
            ),
            Text(
              title,
              style: whiteTextStyleUbuntu.copyWith(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
