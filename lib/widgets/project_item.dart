import 'package:flutter/material.dart';
import 'package:portofolio_web/models/project_model.dart';

import 'package:portofolio_web/shared/theme.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProjectItem extends StatelessWidget {
  final ProjectModel projectModel;

  const ProjectItem({super.key, required this.projectModel});

  @override
  Widget build(BuildContext context) {
    late String type;

    switch (projectModel.type) {
      case 1:
        type = 'Mobile Development';
        break;
      default:
    }

    return InkWell(
      onTap: () {
        launchUrlString(projectModel.projectUrl!);
      },
      child: Container(
        width: 422,
        height: 460,
        margin: const EdgeInsets.only(right: 38),
        decoration: BoxDecoration(
          color: const Color(0xffFFFFFF),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff000000).withOpacity(0.1),
              offset: const Offset(0, 4),
              blurRadius: 20,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 422,
              height: 360,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      projectModel.imageUrl!,
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  )),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    type,
                    style: orangeTextStyleUbuntu,
                  ),
                  Text(
                    projectModel.title!,
                    style: purpleTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectItemMobile extends StatelessWidget {
  final ProjectModel projectModel;

  const ProjectItemMobile({super.key, required this.projectModel});

  @override
  Widget build(BuildContext context) {
    late String type;

    switch (projectModel.type) {
      case 1:
        type = 'Mobile Development';
        break;
      default:
    }

    return GestureDetector(
      onTap: () {
        launchUrlString(projectModel.projectUrl!);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: const Color(0xffFFFFFF),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff000000).withOpacity(0.1),
              offset: const Offset(0, 4),
              blurRadius: 20,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              decoration:  BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      projectModel.imageUrl!
                    ),
                    fit: BoxFit.cover),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    type,
                    style: orangeTextStyleUbuntu,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    projectModel.title!,
                    style: purpleTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
