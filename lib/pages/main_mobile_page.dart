import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:portofolio_web/widgets/project_item.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../bloc/project_bloc.dart';
import '../models/project_model.dart';
import '../shared/data.dart';
import '../shared/theme.dart';
import '../widgets/service_item.dart';

class MainMobilePage extends StatelessWidget {
  const MainMobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget profile() {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 36,
            ),
            const SizedBox(height: 50),
            Text(
              'Hi, I am Azri',
              style: orangeTextStyleUbuntu.copyWith(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Flutter Developer From Jakarta Indonesia',
              style: purpleTextStyle.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                height: 1.066,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'I am a Flutter developer with 1 year of experience and proficiency in using the Bloc pattern for state management. I am self-taught and able to deliver visually appealing, powerful applications for various industries.',
              style: grayTextStyle,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    launchUrl(Uri.parse('mailto:muhammad.azri.f.s@gmail.com'));
                  },
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
                        Image.asset(
                          'assets/icons/email.png',
                          width: 14,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Email Me',
                          style: whiteTextStyleUbuntu.copyWith(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 32),
                InkWell(
                  onTap: () {
                    launchUrlString(
                      'https://drive.google.com/file/d/1aKkJ467umKOGhF3icYd1635B4oBK4YRS/view?usp=sharing',
                    );
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icons/download.png',
                        width: 12,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Download CV',
                        style: grayTextStyleUbuntu.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    launchUrl(linkedin);
                  },
                  child: Image.asset(
                    'assets/icons/linkedin.png',
                    width: 32,
                    height: 32,
                  ),
                ),
                const SizedBox(width: 24),
                InkWell(
                  onTap: () {
                    launchUrl(github);
                  },
                  child: Image.asset(
                    'assets/icons/github.png',
                    width: 32,
                    height: 32,
                  ),
                ),
              ],
            )
          ],
        ),
      );
    }

    Widget aboutMe() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        decoration: BoxDecoration(
          color: backgroundColor1,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/about_me.png',
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "About Me",
              style: orangeTextStyleUbuntu.copyWith(fontSize: 16),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Why hire me for your next project?',
              style: whiteTextStyle.copyWith(
                fontSize: 24,
                fontWeight: bold,
                height: 1.45,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'I am a Flutter developer with 1 year of experience creating mobile apps using the Bloc pattern. My portfolio showcases my abilities and I am known for my strong work ethic and ability to meet deadlines. I am also a strong communicator and always keep clients informed. Clear communication is crucial to project success, and I am willing to go the extra mile for your project.',
              style: whiteTextStyleUbuntu.copyWith(
                height: 1.7,
              ),
            ),
          ],
        ),
      );
    }

    Widget projects() {
      return Container(
        margin: const EdgeInsets.only(
          top: 30,
          left: 12,
          right: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Projects',
              style: orangeTextStyleUbuntu.copyWith(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Latest works.',
              style: purpleTextStyle.copyWith(
                fontSize: 24,
                fontWeight: bold,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            BlocProvider(
              create: (context) => ProjectBloc()..add(ProjectGet()),
              child: BlocBuilder<ProjectBloc, ProjectState>(
                builder: (context, state) {
                  if (state is ProjectSuccess) {
                    return Column(
                      children: state.projects.map(
                        (project) {
                          return ProjectItemMobile(projectModel: project);
                        },
                      ).toList(),
                    );
                  }

                  // return const Center(
                  //   child: CircularProgressIndicator(),
                  // );
                  return Row(children: [
                    ProjectItemMobile(
                      projectModel: ProjectModel(
                        title: 'Todo app With Amplify AWS',
                        type: 1,
                        projectUrl:
                            'https://github.com/muhAzri/todo_amplify_cubit',
                        imageUrl:
                            'https://i.ibb.co/nRHmBKp/Simulator-Screen-Shot-i-Phone-14-Pro-Max-2023-01-01-at-21-24-23.jpg',
                      ),
                    ),
                    ProjectItemMobile(
                      projectModel: ProjectModel(
                        title: 'Bank Sha E-Wallet App',
                        type: 1,
                        projectUrl:
                            'https://github.com/muhAzri/bank_sha-Bloc-State-API-Consume',
                        imageUrl:
                            'https://i.ibb.co/C6L6nf0/Simulator-Screen-Shot-i-Phone-14-Pro-Max-2022-12-26-at-14-20-59.png',
                      ),
                    ),
                  ]);
                },
              ),
            )
          ],
        ),
      );
    }

    Widget services() {
      return Container(
        margin: const EdgeInsets.only(top: 40),
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Services',
              style: orangeTextStyleUbuntu.copyWith(
                fontSize: 18,
                fontWeight: medium,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Best solutions to\nboost your creative project.',
              style: purpleTextStyle.copyWith(
                fontSize: 16,
                fontWeight: bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Are you in need of a modern and visually appealing mobile app for your business or service? Is your current app outdated and not optimized for a variety of devices and browsers? Look no further! As a skilled Flutter developer, I can create a custom app from\na given design and am proficient in integrating API functionality. Trust me to deliver an optimal user experience for your customers.',
              style: grayTextStyleUbuntu.copyWith(
                height: 1.8,
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 30),
            const ServiceItemMobile(
              title: 'Flutter\nDeveloper',
              description:
                  'Good communication, details in the code and verbose documentation. I guaranteed free session until you can run my code on your system.',
            ),
            const ServiceItemMobile(
              title: 'Backend\nDeveloper',
              description:
                  'I view backend development projects as opportunities to learn and grow. Currently learning Laravel and Django, working to improve my skills',
            ),
          ],
        ),
      );
    }

    Widget contact() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          color: backgroundColor1,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            Text(
              'Interested working\nwith me?',
              style: whiteTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: () {
                launchUrl(github);
              },
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: orangeColor,
                  ),
                ),
                child: Center(
                  child: Text(
                    'See More Projects',
                    style: whiteTextStyleUbuntu,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            InkWell(
              onTap: () {
                launchUrl(
                  Uri.parse('mailto:muhammad.azri.f.s@gmail.com'),
                );
              },
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 24,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: orangeColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Contact Me',
                      style: whiteTextStyleUbuntu.copyWith(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 12),
        children: [
          profile(),
          aboutMe(),
          projects(),
          services(),
          contact(),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
